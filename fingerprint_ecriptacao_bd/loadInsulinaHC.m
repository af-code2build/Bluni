function [tab]=loadInsulinaHC(chavePrivada)
%Devolve uma tabela dos valores de HC por unidade de insulina do utilizador com esta chave privada
%No caso de erro, devolve uma tabela vazia
% Tabela:
%   inicio (hora de início)
%   unidHC (HC por unidade de insulina)
addpath('BD');
n = idUtilizador(chavePrivada);
try
    load(['BD/utilizador_',num2str(n),'.mat'],'insulinaHC');
catch
    disp('Erro no load de insulinaHC');
    tab = table([],[],'VariableNames',{'inicio','unidHC'});
    return
end

tab = insulinaHC;
end