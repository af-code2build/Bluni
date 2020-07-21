function [output]=transmissorBLE(fich, info)

fich = [char(fich),'.bb'];


phyMode = 'LE1M'; % Select one mode from the set {'LE1M','LE2M','LE500K','LE125K'}
sps = 8;          % Samples per symbol
channelIdx = 0;  % Channel index value in the range [0,39]
accessAddLen = 32;% Length of access address
accessAddHex = '8E89BED6';  % Access address value in hexadecimal
accessAddBin = de2bi(hex2dec(accessAddHex),accessAddLen)'; % Access address in binary

% Symbol rate based on |'Mode'|
symbolRate = 1e6;
if strcmp(phyMode,'LE2M')
    symbolRate = 2e6;
end


% Initialize the parameters required for signal source
txCenterFrequency       = 2.404e9;  % Varies based on channel index value
txFrontEndSampleRate    = symbolRate*sps;


sigSink = comm.BasebandFileWriter('CenterFrequency',txCenterFrequency,...
        'Filename',fich,...
        'SampleRate',txFrontEndSampleRate);
    

for i=1:length(info)

    % CRC initialization value
    crcInit = '123456';
    % Configure an advertising channel PDU
    cfgLLAdv = bleLLDataChannelPDUConfig;
    cfgLLAdv.LLID = 'Data (start fragment/complete)';
    %cfgLLAdv.LLID = 'Data (continuation fragment/empty)';
    cfgLLAdv.CRCInitialization = crcInit;
    cfgLLAdv.SequenceNumber = 0;
    cfgLLAdv.NESN = 1;
    
    messageBits = bleLLDataChannelPDU(cfgLLAdv, dec2hex(char(info(i))));
    txWaveform = bleWaveformGenerator(messageBits,...
        'Mode',            phyMode,...
        'SamplesPerSymbol',sps,...
        'ChannelIndex',    channelIdx,...
        'AccessAddress',   accessAddBin);
    sigSink(txWaveform);
        %for j=1:length(txWaveform)
        %sigSink(txWaveform(j));
       % end
        
        %[status, cfgLLAdv, payload] = bleLLDataChannelPDUDecode(messageBits, '123456');
end



% Release the signal sink
release(sigSink)

output = 1;
end
