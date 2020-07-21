function [glucoseLevel] = generateGlucoseLevel(simulation)
%Função que gera índices glicémicos consoante as horas do dia, os hidratos
%de carbono ingeridos e que pode providenciar eventos de hiper ou
%hipoglicemia consoante a simulação a executar
%simulation -> qual a simulação que pretendemos executar: 1-dia com níveis
%considerados "normais"; 2- dia com um evento de hiperglicémia; 3- dia com
%evento de hipoglicémia

maxV= 20;
minV=10;
rng('shuffle');     %Para iniciar a semente consoante o tempo atual
ind = 1;
glucoseLevel = zeros(1, 192);

if simulation == 1      %Situação em que se trata de um dia "normal", sem eventos de hiper ou hipoglicémia
    for hora=8:23
        if (hora >= 8) && (hora <=12)
            mediana = 140;
            for intervalo = 1:12        %Um valor para cada 5 minutos
                first = minV + (maxV-minV)*rand(1,1);
                
                second = minV + (maxV-minV)*rand(1,1);
                if intervalo == 1
                    aux = mediana + (first - second);
                else
                    aux = aux + (first - second);
                end
                glucoseLevel(ind) = aux;
                ind= ind + 1;
            end
        elseif (hora > 12) && (hora <=15)
            mediana = 150;
            for intervalo = 1:12
                first = minV + (maxV-minV)*rand(1,1);
                second = minV + (maxV-minV)*rand(1,1);
                if intervalo == 1
                    aux = mediana + (first - second);
                else
                    aux = aux + (first - second);
                end
                glucoseLevel(ind) = aux;
                ind= ind + 1;
            end
        elseif (hora > 15) && (hora <=17)
            mediana = 90;
            for intervalo = 1:12
                first = minV + (maxV-minV)*rand(1,1);
                second = minV + (maxV-minV)*rand(1,1);
                if intervalo == 1
                    aux = mediana + (first - second);
                else
                    aux = aux + (first - second);
                end
                glucoseLevel(ind) = aux;
                ind= ind + 1;
            end
        else
            mediana = 160;
            for intervalo = 1:12
                first = minV + (maxV-minV)*rand(1,1);
                second = minV + (maxV-minV)*rand(1,1);
                if intervalo == 1
                    aux = mediana + (first - second);
                else
                    aux = aux + (first - second);
                end
                glucoseLevel(ind) = aux;
                ind= ind + 1;
            end
        end
    end
    
elseif simulation == 2      %Simulação em que ocorre um evento de hiperglicémia
    for hora=8:23
        if (hora >= 8) && (hora <=12)
            mediana = 135;
            for intervalo = 1:12
                first = minV + (maxV-minV)*rand(1,1);
                second = minV + (maxV-minV)*rand(1,1);
                if intervalo == 1
                    aux = mediana + (first - second);
                else
                    aux = aux + (first - second);
                end
                glucoseLevel(ind) = aux;
                ind= ind + 1;
            end
        elseif (hora > 12) && (hora <=15)
            mediana = 145;
            for intervalo = 1:12
                first = minV + (maxV-minV)*rand(1,1);
                second = minV + (maxV-minV)*rand(1,1);
                if intervalo == 1
                    aux = mediana + (first - second);
                else
                    aux = aux + (first - second);
                end
                glucoseLevel(ind) = aux;
                ind= ind + 1;
            end
        elseif (hora > 15) && (hora <=16)       %O açúcar no sangue vai subir: hiperglicémia > 180
            mediana = 95;
            for intervalo = 1:12
                valor = 10 + (maxV-18)*rand(1,1);
                if intervalo == 1
                    aux = mediana + valor;
                else
                    aux = aux + valor;
                end
                glucoseLevel(ind) = aux;
                ind= ind + 1;
            end
        elseif (hora > 16) && (hora <=17)       %O açúcar no sangue vai descer
            lastValue = glucoseLevel(ind-1);
            for intervalo = 1:12
                valor = 7 + (maxV-18)*rand(1,1);
                if intervalo == 1
                    aux = lastValue - valor;
                else
                    aux = aux - valor;
                end
                glucoseLevel(ind) = aux;
                ind= ind + 1;
            end
        else
            mediana = 155;
            for intervalo = 1:12
                first = minV + (maxV-minV)*rand(1,1);
                second = minV + (maxV-minV)*rand(1,1);
                if intervalo == 1
                    aux = mediana + (first - second);
                else
                    aux = aux + (first - second);
                end
                glucoseLevel(ind) = aux;
                ind= ind + 1;
            end
        end
    end
else       %simulação em que ocorre um evento de hipoglicémia
    for hora=8:23
        if (hora >= 0) && (hora <=8)
            mediana = 125;
            for intervalo = 1:12
                first = minV + (maxV-minV)*rand(1,1);
                second = minV + (maxV-minV)*rand(1,1);
                if intervalo == 1
                    aux = mediana + (first - second);
                else
                    aux = aux + (first - second);
                end
                glucoseLevel(ind) = aux;
                ind= ind + 1;
            end
        elseif (hora > 8) && (hora <=9)     %O açúcar no sangue vai descer: hipoglicémia < 70
            lastValue = glucoseLevel(ind-1);
            for intervalo = 1:12
                valor = 5 + (maxV-18)*rand(1,1);
                if intervalo == 1
                    aux = lastValue - valor;
                else
                    aux = aux - valor;
                end
                glucoseLevel(ind) = aux;
                ind= ind + 1;
            end        
        elseif (hora > 9) && (hora <=10)        %O açúcar no sangue vai subir: simulando o efeito da insulina
            lastValue = glucoseLevel(ind-1);
            for intervalo = 1:12
                valor = 5 + (maxV-18)*rand(1,1);
                if intervalo == 1
                    aux = lastValue + valor;
                else
                    aux = aux + valor;
                end
                glucoseLevel(ind) = aux;
                ind= ind + 1;
            end        
        elseif (hora > 10) && (hora <=15)
            mediana = 145;
            for intervalo = 1:12
                first = minV + (maxV-minV)*rand(1,1);
                second = minV + (maxV-minV)*rand(1,1);
                if intervalo == 1
                    aux = mediana + (first - second);
                else
                    aux = aux + (first - second);
                end
                glucoseLevel(ind) = aux;
                ind= ind + 1;
            end
        elseif (hora > 15) && (hora <=17)    
            mediana = 95;
            for intervalo = 1:12
                first = minV + (maxV-minV)*rand(1,1);
                second = minV + (maxV-minV)*rand(1,1);
                if intervalo == 1
                    aux = mediana + (first - second);
                else
                    aux = aux + (first - second);
                end
                glucoseLevel(ind) = aux;
                ind= ind + 1;
            end
        elseif (hora > 17) && (hora <=19)  
            mediana = 110;
            for intervalo = 1:12
                first = minV + (maxV-minV)*rand(1,1);
                second = minV + (maxV-minV)*rand(1,1);
                if intervalo == 1
                    aux = mediana + (first - second);
                else
                    aux = aux + (first - second);
                end
                glucoseLevel(ind) = aux;
                ind= ind + 1;
            end
        else
            mediana = 115;
            for intervalo = 1:12
                first = minV + (maxV-minV)*rand(1,1);
                second = minV + (maxV-minV)*rand(1,1);
                if intervalo == 1
                    aux = mediana + (first - second);
                else
                    aux = aux + (first - second);
                end
                glucoseLevel(ind) = aux;
                ind= ind + 1;
            end
        end
    end  
end
end