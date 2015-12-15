clc
clear

syms brCvorova;
syms matrica;
syms resenje;

brCvorova = 6;

%% Formiranje matrice susednosti
matrica = zeros(brCvorova); 
for i = 1 : brCvorova
    for j = i+1 : brCvorova
    matrica(i,j) = randi([0 1],1);
    matrica(j,i) = matrica(i,j); 
    end
end
matrica % ispisivanje formirane matrice

%%
resenje = vertex_cover_goran(matrica)