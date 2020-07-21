%constroi a base de dados de um utilizador
clear variables; clc;

id = 2; %para qual utilizador estamos a construir a BD

nivel = 1; %nível do utilizador; igual a 1 é utilizador principal

privada=chavePrivada(id,1);

utilizador = struct('id',privada,...
    'nome',"Joaquim",...
    'dataNascimento',datetime('now'),...
    'email',"joaquim99@gmail.com",...
    'contacto',"999999999",...
    'nivel',nivel);

if nivel == 1
    infoMedico = table([],[],[],[],[],'VariableNames',{'si','rh','gmax','gmin','data'});
    
    infoMedico = [infoMedico; table(1,3,60,50,datetime('now'),'VariableNames',{'si','rh','gmax','gmin','data'})];

    valoresGlicemicos = table([],[],'VariableNames',{'valor','data'});

    hidratosCarbono = table([],[],'VariableNames',{'valor','data'});

    insulinaBolus = table([],[],'VariableNames',{'valor','data'});

    insulinaBasal = table([],[],'VariableNames',{'inicio','unidInsulina'});

    insulinaHC = table([],[],'VariableNames',{'inicio','unidHC'});
end

addpath('BD');

save(['BD/','utilizador_',num2str(id),'.mat']);

%%
%Base de dados do setup
clear variables; clc; 
addpath('BD_bomba');
addpath('BD_sensor');
addpath('BD_PC');
addpath('BD');
ids = table([],[],'VariableNames',{'id','chave'});
for i=1:9
privada = chavePrivada(i,1);
ids = [ids;table(i,string(privada),'VariableNames',{'id','chave'})];
save(['BD_bomba/p' num2str(i) '.mat'], 'privada');
save(['BD_sensor/p' num2str(i) '.mat'], 'privada');
save(['BD_PC/p' num2str(i) '.mat'], 'privada');
end
save('BD/ids.mat', 'ids');


