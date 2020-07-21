function [output, per] = recetorBLE(fich)
%Devolve array vazio ([]) se está à espera que o outro lado escreva
%Devolve as strings lidas em "output"
%Se per != 0, houve algum erro!
%Utilização:
%   fich = nome do ficheiro
%Exemplo:
%   [output, per] = recetorBLE("bomba-app");


phyMode = 'LE1M';
bleParam = helperBLEReceiverConfig(phyMode);

fich = [char(fich), '.bb'];

try
    bbFileName = fich;
    sigSrc = comm.BasebandFileReader(bbFileName);
catch
    %fim = 0;
    per = -3;
    output = [];
    return
end

    
    bbSampleRate = sigSrc.SampleRate;
    sigSrc.SamplesPerFrame = 1e7;
    bleParam.SamplesPerSymbol = bbSampleRate/bleParam.SymbolRate;

% *Capture the BLE Packets*

% The transmitted waveform is captured as a burst
dataCaptures = sigSrc();


% Initialize System objects for receiver processing
agc = comm.AGC('MaxPowerGain',20,'DesiredOutputPower',2);

freqCompensator = comm.CoarseFrequencyCompensator('Modulation', 'OQPSK',...
                'SampleRate',bbSampleRate,...
                'SamplesPerSymbol',2*bleParam.SamplesPerSymbol,...
                'FrequencyResolution',100);

prbDet = comm.PreambleDetector(bleParam.RefSeq,'Detections','First');

% Initialize counter variables
pktCnt = 0;
crcCnt = 0;
final = [];

% Loop to decode the captured BLE samples
while length(dataCaptures) > bleParam.MinimumPacketLen

    % Consider two frames from the captured signal for each iteration
    startIndex = 1;
    endIndex = min(length(dataCaptures),2*bleParam.FrameLength);
    rcvSig = dataCaptures(startIndex:endIndex);

    rcvAGC = agc(rcvSig); % Perform AGC
    rcvDCFree = rcvAGC - mean(rcvAGC); % Remove the DC offset
    rcvFreqComp = freqCompensator(rcvDCFree); % Estimate and compensate for the carrier frequency offset
    rcvFilt = conv(rcvFreqComp,bleParam.h,'same'); % Perform gaussian matched filtering

    % Perform frame timing synchronization
    [~, dtMt] = prbDet(rcvFilt);
    release(prbDet)
    prbDet.Threshold = max(dtMt);
    prbIdx = prbDet(rcvFilt);

    % Extract message information
    [cfgLLAdv,pktCnt,crcCnt,remStartIdx, payload] = helperBLEPhyBitRecover(rcvFilt,...
                                prbIdx,pktCnt,crcCnt,bleParam);
                            
                            if ~isempty(payload)
                                payload = string(char(hex2dec(payload))');
                                final = [final; payload];
                            else
                                break
                            end

    % Remaining signal in the burst captures
    dataCaptures = dataCaptures(1+remStartIdx:end);

    % Release System objects
    release(freqCompensator)
    release(prbDet)
    
end

% Release the signal source
release(sigSrc)

symbolRate = 1e6;
if strcmp(phyMode,'LE2M')
    symbolRate = 2e6;
end
sps = 8;
txCenterFrequency       = 2.404e9;  % Varies based on channel index value
txFrontEndSampleRate    = symbolRate*sps;
sigSink = comm.BasebandFileWriter('CenterFrequency',txCenterFrequency,...
        'Filename',fich,...
        'SampleRate',txFrontEndSampleRate);
    
    sigSink(0);
    
    release(sigSink); 
    
   

% Determine the PER
if pktCnt
    per = 1-(crcCnt/pktCnt);
else
    per = -2;
end

output = final;

end