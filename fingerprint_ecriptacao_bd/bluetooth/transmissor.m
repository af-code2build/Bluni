function transmissor(fich, info)

infoFinal = "";

for i=1:length(info)
    infoFinal = strcat(infoFinal,info(i),"*");
end

transmissorBLE(fich, infoFinal);

end