function [tab]=loadInsulinaBolus(chavePrivada)
%Devolve uma tabela dos valores de insulina bolus (os que vêm da bomba) do utilizador com esta chave privada
%No caso de erro, devolve uma tabela vazia
% Tabela:
%   valor (valor da quantidade de insulina administrada)
%   data (data de quando o valor foi inserido em formato data)
addpath('BD');
n = idUtilizador(chavePrivada);
try
    load(['BD/utilizador_',num2str(n),'.mat'],'insulinaBolus');
catch
    disp('Erro no load de insulinaBolus');
    tab = table([],[],'VariableNames',{'valor','data'});
    return
end

tab = insulinaBolus;
end