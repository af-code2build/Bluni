function saveInsulinaBasal(chavePrivada, insulinaBasal)
%Salva a tabela no utilizador com a chave privada passada
addpath('BD');
n = idUtilizador(chavePrivada);

try
    save(['BD/utilizador_',num2str(n),'.mat'],'insulinaBasal','-append');
catch
    disp('Houve um erro ao atualizar a tabela...');
end

end