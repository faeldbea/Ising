function [U,M,Mstd,Ustd]=ising2D(beta)
L=30;  

%propongo un estado inicial al azar

%Sij es una matriz de 1 y -1 indicando las dos proyecciones de
%espin

Sij=2*(rand(L,L)>0.5) -1;

%defino el numero de iteraciones y de pretermalizacion
if beta>0.3 && beta<0.5
    
    npre = 100000;
    npasos = 1000000;
else
    npre = 50000;
    npasos = 500000;
end

energia=nan(npasos+1,1);
magnet=nan(npasos+1,1);

%pretermalizo
%ising2Dpaso hace un nuevo elemento de la cadena de Markov

for n=1:npre
    %[Sij, ~, ~]=ising2Dpaso(Sij,beta);
    [Sij, DE, DM]=ising2Dpaso(Sij,beta);
end


energia(1) = En(Sij);
magnet(1) = sum(sum(Sij));

for n=1:npasos
    [Sij,DE,dM] = ising2Dpaso(Sij,beta);
    energia(n+1) = energia(n) + DE;
    magnet(n+1) = magnet(n) + dM;
end

plot(magnet)
U=nanmean(energia)/(L*L);
M=nanmean(abs(magnet))/(L*L);
Mstd = std(abs(magnet))/(L*L);
Ustd = std(energia)/(L*L);
