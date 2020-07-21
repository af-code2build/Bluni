function [chavePublica] = chavePublica()
%Devolve uma chave pública aleatória com carateres maiúsculos, minúsculos
%e números

%O tamanho da chave será de 6 carateres. 

aux = randsample([48:57,65:90,97:122],6, 1);
chavePublica = char(aux);

end