%% Construir a base de dados de um utilizador
%% Utilizador 1

clear variables; clc;

id = 1; %para qual utilizador estamos a construir a BD

nivel = 1; %nível do utilizador; igual a 1 é utilizador principal

privada=chavePrivada(id,1);

utilizador_p = struct('id_chave',privada,...
    'nome','Joaquim Ramos',...
    'dataNascimento',datetime(1987,11,06),...
    'email','joaquim99@gmail.com',...
    'contacto','917261276',...
    'nivel',nivel);

utilizadorer_s = table([2; 3; 4],["Patrícia Soares"; "Gonçalo Borges"; "Guilherme Ramos"],[2; 3; 3], ["Paciente"; "Amizade"; "Parentesco"],'VariableNames',{'id_num','nome','nivel', 'relacao'});

if nivel == 1
    tab_infoMedico = table([70],[160],[70],[datetime('now')],'VariableNames',{'Sensibilidade','g_max','g_min','data_update'});

    tab_insulinaBasal = table(["00:00";"06:00";"12:00"],["0.8";"0.7";"0.65"],'VariableNames',{'Time','Insulin_units'});

    tab_insulinaHC = table(["00:00";"07:00";"11:00";"15:30";"21:00"],["10";"9";"8";"9";"11"],'VariableNames',{'Time','Unit_Carb'});
end

addpath('BD');

save(['BD/','utilizador_',num2str(id),'.mat']);

%% Utilizador 2

clear variables; clc;

id = 2; %para qual utilizador estamos a construir a BD

nivel = 2; %nível do utilizador; igual a 1 é utilizador principal

privada=chavePrivada(id,1);

utilizador_p = struct('id_chave',privada,...
    'nome','Patrícia Soares',...
    'dataNascimento',datetime(1988,06,12),...
    'email','patysoares10@gmail.com',...
    'contacto','961821745',...
    'nivel',nivel);

addpath('BD');

save(['BD/','utilizador_',num2str(id),'.mat']);


%% Utilizador 3

clear variables; clc;

id = 3; %para qual utilizador estamos a construir a BD

nivel = 3; %nível do utilizador; igual a 1 é utilizador principal

privada=chavePrivada(id,1);

utilizador_p = struct('id_chave',privada,...
    'nome','Gonçalo Borges',...
    'dataNascimento',datetime(1985,02,10),...
    'email','borgeszolas@gmail.com',...
    'contacto','917286171',...
    'nivel',nivel);

addpath('BD');

save(['BD/','utilizador_',num2str(id),'.mat']);

%% Utilizador 4

clear variables; clc;

id = 4; %para qual utilizador estamos a construir a BD

nivel = 3; %nível do utilizador; igual a 1 é utilizador principal

privada=chavePrivada(id,1);

utilizador_p = struct('id_chave',privada,...
    'nome','Guilherme Ramos',...
    'dataNascimento',datetime(1993,04,13),...
    'email','gil_ramos93@gmail.com',...
    'contacto','964526152',...
    'nivel',nivel);

addpath('BD');

save(['BD/','utilizador_',num2str(id),'.mat']);