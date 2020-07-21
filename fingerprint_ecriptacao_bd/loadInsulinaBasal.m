function [tab]=loadInsulinaBasal(chavePrivada)
%Devolve uma tabela dos valores de insulina basal do utilizador com esta chave privada
%No caso de erro, devolve uma tabela vazia
% Tabela:
%   inicio (hora de início)
%   unidInsulina (unidade de insulina)
addpath('BD');
n = idUtilizador(chavePrivada);
try
    load(['BD/utilizador_',num2str(n),'.mat'],'insulinaBasal');
catch
    disp('Erro no load de insulinaBasal');
    tab = table([],[],'VariableNames',{'inicio','unidInsulina'});
    return
end

tab = insulinaBasal;
end