function [Sij, DE, DM]=ising2Dpaso(Sij,beta)

J=1;
DE=0;
DM=0;
[n, m]= size(Sij);

for a=1:n
    for b=1:m
        c = -Sij(a,b);
        E = -2*c*J*( Sij(mod(a,n)+1,b)+Sij(mod(a-2,n)+1,b)+Sij(a,mod(b,m)+1)+Sij(a,mod(b-2,m)+1) );
        if E < 0 || exp(-beta*E) > rand()
            Sij(a,b) = c;
            DE = DE + E;
            DM = DM + 2*c;
        end
    end
end
