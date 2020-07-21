function [tab]=loadValoresGlicemicos(chavePrivada)
%Devolve uma tabela dos valores glic�micos do utilizador com esta chave privada
%No caso de erro, devolve uma tabela vazia
% Tabela:
%   valor (valor glic�mico)
%   data (data de quando o valor foi inserido em formato data)
addpath('BD');
n = idUtilizador(chavePrivada);
try
    load(['BD/utilizador_',num2str(n),'.mat'],'valoresGlicemicos');
catch
    disp('Erro no load dos valoresGlicemicos');
    tab = table([],[],'VariableNames',{'valor','data'});
    return
end

tab = valoresGlicemicos;
end