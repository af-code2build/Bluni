function [tab]=loadHidratosCarbono(chavePrivada)
%Devolve uma tabela dos valores dos hidratos de carbono introduzidos pelo utilizador com esta chave privada
%No caso de erro, devolve uma tabela vazia
% Tabela:
%   valor (valor do HC)
%   data (data de quando o valor foi inserido em formato data)
addpath('BD');
n = idUtilizador(chavePrivada);
try
    load(['BD/utilizador_',num2str(n),'.mat'],'hidratosCarbono');
catch
    disp('Erro no load dos hidratosCarbono');
    tab = table([],[],'VariableNames',{'valor','data'});
    return
end

tab = hidratosCarbono;
end