clc
clear
syms niz;
syms duzinaNiza;
syms gornjaGranica;

duzinaNiza = 15;
gornjaGranica = 99;
fprintf('Niz pre sortiranja\n')
niz = randi([1 gornjaGranica], 1, duzinaNiza)

fprintf('Niz posle sortiranja\n')
set(0,'RecursionLimit',1000); % Povecan broj rekurzija na 1000
niz = quick_sort_drugi(niz,1,duzinaNiza)
