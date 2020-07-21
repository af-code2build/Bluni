function [tab]=loadInfoMedico(chavePrivada)
%Devolve uma tabela da informa��o m�dica do utilizador com esta chave privada
%No caso de erro, devolve uma tabela vazia
% Tabela:
%   si (sensibilidade da insulina)
%   rh (racio da insulina)
%   gmax (n�vel de glic�mia m�ximo)
%   gmin (n�vel de glic�mia m�nimo)
%   data (data de quando o m�dico atualizou a tabela no formato data)
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