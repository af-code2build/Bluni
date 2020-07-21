function [stringEncriptada] = encripta(chavePrivada, chavePublica, string)
%Encripta uma string com base na chave privada e pública
%Encriptação AES
%Codificação SHA-256 + Base64
%Devolve string vazia se as chaves tiverem tamanhos diferentes
chavePrivada = char(chavePrivada);
chavePublica = char(chavePublica);
if length(chavePrivada) ~= length(chavePublica)
    stringEncriptada = '';
else
    key = '';
    for i=1:length(chavePrivada)
        key = [key, abs(chavePrivada(i) + chavePublica(i))];
    end
    aes = AES(key,"SHA-256");
    stringEncriptada = aes.encrypt(string);
end

end