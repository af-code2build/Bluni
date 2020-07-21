function [chavePublica] = chavePublica()
%Devolve uma chave p�blica aleat�ria com carateres mai�sculos, min�sculos
%e n�meros

%O tamanho da chave ser� de 6 carateres. 

aux = randsample([48:57,65:90,97:122],6, 1);
chavePublica = char(aux);

end