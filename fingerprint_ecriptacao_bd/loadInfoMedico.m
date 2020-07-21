function [tab]=loadInfoMedico(chavePrivada)
%Devolve uma tabela da informação médica do utilizador com esta chave privada
%No caso de erro, devolve uma tabela vazia
% Tabela:
%   si (sensibilidade da insulina)
%   rh (racio da insulina)
%   gmax (nível de glicémia máximo)
%   gmin (nível de glicémia mínimo)
%   data (data de quando o médico atualizou a tabela no formato data)
addpath('BD');
n = idUtilizador(chavePrivada);
try
    load(['BD/utilizador_',num2str(n),'.mat'],'infoMedico');
catch
    disp('Erro no load do infoMedico');
    tab = table([],[],[],[],[],'VariableNames',{'si','rh','gmax','gmin','data'});
    return
end

tab = infoMedico;
end