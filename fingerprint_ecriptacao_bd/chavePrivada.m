function [chavePrivada] = chavePrivada(nf, ns)
% nf = número da fingerprint a procurar
% ns = número secundário - deixar a 1 se quisermos que a fingerprint exista
% 1 < nf < 9; 1 < ns < 8 (limites incluídos)
%
%Devolve string vazia se não encontrar a fingerprint na base de dados
%Devolve a chave privada da fingerprint se a encontrar na base de dados
if nf<1
    nf = 1;
elseif nf>9
    nf = 9;
end
if ns<1
    ns = 1;
elseif ns>8
    ns = 8;
end
addpath(genpath(pwd));
%% BUILD FINGERPRINT TEMPLATE DATABASE
% build_db(9,8);        %THIS WILL TAKE ABOUT 30 MINUTES
load('db.mat');

%% EXTRACT FEATURES FROM AN ARBITRARY FINGERPRINT
filename=['10' num2str(nf) '_' num2str(ns) '.tif'];
img = imread(filename);
if ndims(img) == 3; img = rgb2gray(img); end  % Color Images
disp('A comparar fingerprints... Isto pode demorar um bocado...');
ffnew=ext_finger(img,0);

%% FOR EACH FINGERPRINT TEMPLATE, CALCULATE MATCHING SCORE IN COMPARISION WITH FIRST ONE
S=zeros(9,1);
for i=1:8:72
    %second=['10' i '_1']
    %fprintf(['Computing similarity between ' filename ' and ' second ' from FVC2002 : ']);
    S(i)=match(ffnew,ff{i});
    %fprintf([num2str(S(i)) '\n']);
    %drawnow
end
%% OFFER MATCHED FINGERPRINTS
if isempty(find(S>0.9, 1)) % usar length() == 0 para testar se existe
    chavePrivada = '';
else
    chavePrivada = '';
    s = size(ffnew);
    for i=1:s(2)
        aux = 0;
        for j=1:s(1)
            aux = aux + ffnew(j,i);
        end
        while aux > 65535
            aux = aux - 65535;
        end
        chavePrivada = [chavePrivada, char(round(aux))];
    end
end
