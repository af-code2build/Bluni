%% Como creat uma tabela:

t1 = datetime(2020,5,13,8,0,0);
t2 = datetime(2020,5,14,8,0,0);
Data = t1:minutes(5):t2;
Data = Data';
Data.Format = 'hh:mm'
aux = size(Data);
Valor = randi(70,aux(1),1);

Valores_Glicemicos_iniciais = table(Valor, Data)


%%Criar array de 8:00 até 7:55 horas (24 horas)
t1 = datetime(2020,5,13,8,0,0);
t2 = datetime(2020,5,14,8,0,0);
Horas = t1:minutes(5):t2;
Horas = Horas';
Horas.Format = 'HH:mm';
Horas(end) = [];


% Criar a tabela Int
t1 = datetime('07:10','InputFormat','HH:mm');
t2 = datetime('07:55','InputFormat','HH:mm'); 
Horas = t1:minutes(5):t2;
Horas = Horas';
Horas.Format = 'HH:mm';
avg = 145.* ones(10,1);
Int = table(avg,Horas,'VariableNames',{'valor','data'});

% Passar numeros para horas:
a = 7;
b = 55;
d = [a, b];
s = num2str(d,'%d:%d');
res = datetime(s, 'InputFormat','HH:mm');
res.Format = 'HH:mm';

% Intervalo de Horas:
a = 4;
b = 15;
c = 7;
d = 15;
Horas(duration(Horas(:).Hour, Horas(:).Minute, 0) >= duration(a,b,0) & duration(Horas(:).Hour, Horas(:).Minute, 0) <= duration(c,d,0));
res = find(duration(Horas(:).Hour, Horas(:).Minute, 0) >= duration(a,b,0) & duration(Horas(:).Hour, Horas(:).Minute, 0) <= duration(c,d,0)==1)
res(1)
res(end)


res = find(duration(GG{:,2}.Hour, GG{:,2}.Minute, 0) >= duration(a,b,0) & duration(GG{:,2}.Hour, GG{:,2}.Minute, 0) <= duration(c,d,0))
final = GG(res(1):res(end),:)


% Como converter uma data para uma string e vice versa:
s = datestr(datetime('now')+ hours(5),'HH:MM'); % Ao contrário do datetime 'MM' indica minutos e não meses
s = string(s);
datetime(s)