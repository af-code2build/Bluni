function [output] = recetor(fich, tempoEspera)


output = [];

aux = [];

contador = 0;

flag = 0;

if tempoEspera < 1
    tempoEspera = 1;
end
tempoEspera = round(tempoEspera);

while(contador < tempoEspera)
    [aux, ~] = recetorBLE(fich);
    if ~isempty(aux) %&& per == 0
        flag = 1;
        break
    end
    pause(1);
    contador = contador + 1;
end

if flag ~= 1
    [aux, ~] = recetorBLE(fich);
    if isempty(aux)
        return
    end
end

aux = char(aux);
inicio = 0;

for i=1:length(aux)
    if(aux(i) == '*')
        output = [output; string(aux(inicio+1:i-1))];
        inicio = i;
    end
end


end