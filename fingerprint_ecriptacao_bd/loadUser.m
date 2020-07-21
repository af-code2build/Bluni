function [user]=loadUser(chavePrivada)
%Devolve uma struct do utilizador com esta chave privada
%No caso de erro, devolve uma struct com campos vazios
% Struct:
%   id (chavePrivada)
%   nome (contém o nome da pessoa em formato string de aspas)
%   dataNascimento (contém a data de nascimento da pessoa em formato data)
%   email (contém o email da pessoa em formato string de aspas)
%   contacto (contém o contacto da pessoa em formato string de aspas)
%   nivel (contém o nível de acesso deste utilizador em formato número; se for igual a 1, é porque é utilizador principal)
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