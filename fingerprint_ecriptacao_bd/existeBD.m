function [st,existe] = existeBD(chavePrivada)
%Devolve 1 se o utilizador com esta chave privada existe na base de dados
%OU
%Devolve 0 se o utilizador com esta chave privada NÃO existe na base de dados
addpath('BD');
n = idUtilizador(chavePrivada);

try
    st = load(['BD/utilizador_',num2str(n),'.mat']);
    existe = 1;
catch
    st = [];
    existe = 0;
end

end