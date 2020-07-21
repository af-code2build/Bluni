%Teste
clc; clear variables;
cprivada = chavePrivada(1,1);%verifica se a pessoa (1,1) existe e devolve a sua chave privada
cpublica = chavePublica();%gera uma chave pública aleatória
so = 'mensagem';%mensagem
es = encripta(cprivada,cpublica,so);
ds = decripta(cprivada,cpublica,es);

disp(['String original:' so]);
disp(['String encriptada:' es]);
disp(['String decriptada:' ds]);

%%
%Para criar as bases de dados
clear variables; clc; % usar flag '-append' para dar update 
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

%%
%Vamos ver se conseguimos fazer load para as variáveis do main
clear variables; clc;

load(loadChavePrivada('bomba',3));
%%
%Criar gráficos com datetime

x = datetime('now');
for i=1:8
    x = [x [x(i)+hours(1)]];
end
y = 1:9;
plot(x(1:9),y)

