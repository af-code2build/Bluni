function [n] = idUtilizador(chavePrivada)
addpath('BD');
load('BD/ids.mat','ids');

for i=1:length(ids.id)
    if strcmp(string(chavePrivada), ids.chave(i))
        n = ids.id(i);
        return
    end
end
n=0;
end