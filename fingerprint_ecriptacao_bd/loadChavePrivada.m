function [chave] = loadChavePrivada(dispositivo, np)
% dispositivo = 'bomba' ou 'sensor' ou 'PC'
% np = número da pessoa = [1;9]
% Faz o load da chave privada simulando o setup dos dispositivos
% O nome da chave privada é 'privada'
% Exemplo -> <nome variavel> = loadChavePrivada('bomba',1);
dispositivo = char(dispositivo);
addpath(['BD_' dispositivo]);

fich = ['BD_' dispositivo '/p' num2str(np) '.mat'];

load(fich);

chave = privada;
end