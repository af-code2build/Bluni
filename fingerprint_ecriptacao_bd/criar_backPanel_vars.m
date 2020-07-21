% Inicializar variáveis
msg = table([],[],[],[],[],[],[],'VariableNames',{'Tipo','ID','Assunto','Tamanho','Time','Msg_encript', 'Msg_decript'});
total_msg = table([],[],[],[],'VariableNames',{'Num_msg','Time_inicio','Num_falhas','Time_ultima'});
overall = table([],[],[],[],'VariableNames',{'ID_simul','Num_simul','Time_limit','Num_renova'});

% Criar uma nova linha
msg2 = table("ss","1","1","56","3:07","hello","trustrus",'VariableNames',{'Tipo','ID','Assunto','Tamanho','Time','Msg_encript', 'Msg_decript'});
msg = [msg;msg2];

% Como mostrar segmentos da tabela:
[msg(:,1), msg(:,3:end)] % Não mostra uma das colunas
[msg(strcmp(msg.Tipo,"lolo"),1), msg(strcmp(msg.Tipo,"lolo"),3:end)] % Mostrar apenas umas linhas da tabela
msg{:,2} % como obter o valor dentro de uma linha

% Como verificar se um valor dentro de uma linha está vazio
ov2 = table("02","","5h","0",'VariableNames',{'ID_simul','Num_simul','Time_limit','Num_renova'});
isempty(str2num(ov2{:,2}))