function [En,Mag,Cv,X]=resultados()

clear all
close all

%En y Mag son los valores en funcion de la temperatura

BETA=[7,2:-0.1:0.6, 0.6:-0.01:0.5, 0.5:-0.005:0.3, 0.3:-0.01:0.28];

T=1./BETA;

for n=1:length(BETA)
    [En(n),Mag(n),Mstd(n),Ustd(n)]=ising2D(BETA(n));
end

%calculo Cv
Cv(1)= NaN;
for n=2:length(BETA)   
    Cv(n) = (En(n)-En(n-1))/(T(n)-T(n-1));
end

%calculo X
X = BETA .* Mstd .^ 2;

%grafico
figure(1)
subplot(2,2,1)
errorbar(T,En,Ustd)
TITLE('Energia en funcion de la temperatura')
subplot(2,2,2)
errorbar(T,Mag,Mstd)
TITLE('Magnetizacion en funcion de la temperatura')
subplot(2,2,3)
scatter(T,Cv,'.')
TITLE('Cv en funcion de la temperatura')
subplot(2,2,4)
scatter(T,X,'.')
TITLE('X en funcion de la temperatura')

beep
