function [user]=loadUser(chavePrivada)
%Devolve uma struct do utilizador com esta chave privada
%No caso de erro, devolve uma struct com campos vazios
% Struct:
%   id (chavePrivada)
%   nome (cont�m o nome da pessoa em formato string de aspas)
%   dataNascimento (cont�m a data de nascimento da pessoa em formato data)
%   email (cont�m o email da pessoa em formato string de aspas)
%   contacto (cont�m o contacto da pessoa em formato string de aspas)
%   nivel (cont�m o n�vel de acesso deste utilizador em formato n�mero; se for igual a 1, � porque � utilizador principal)
addpath('BD');
n = idUtilizador(chavePrivada);
try
    load(['BD/utilizador_',num2str(n),'.mat'],'utilizador');
catch
    disp('Erro no load do user');
    user = struct('id',"",...
    'nome',"",...
    'dataNascimento',datetime('now'),...
    'email',"",...
    'contacto',"",...
    'nivel',-1);
    return
end

user = utilizador;
end