function [stringDecriptada] = decripta(chavePrivada, chavePublica, string)
%Decripta uma string com base na chave privada e pública
%Devolve string vazia se as chaves tiverem tamanhos diferentes
chavePrivada = char(chavePrivada);
chavePublica = char(chavePublica);
if length(chavePrivada) ~= length(chavePublica)
    stringDecriptada = '';
else
    key = '';
    for i=1:length(chavePrivada)
        key = [key, abs(chavePrivada(i) + chavePublica(i))];
    end
    aes = AES(key,"SHA-256");
    stringDecriptada = aes.decrypt(string);
end

end