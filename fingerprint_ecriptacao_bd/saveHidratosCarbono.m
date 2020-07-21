function saveHidratosCarbono(chavePrivada, hidratosCarbono)
%Salva a tabela no utilizador com a chave privada passada
addpath('BD');
n = idUtilizador(chavePrivada);

try
    save(['BD/utilizador_',num2str(n),'.mat'],'hidratosCarbono','-append');
catch
    disp('Houve um erro ao atualizar a tabela...');
end

end