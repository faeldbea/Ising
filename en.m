function energia = En(Sij)

J=1;
E=0;
[n, m]= size(Sij);

for a=1:n
    for b=1:m

        E = E - Sij(a,b)*J*( Sij(mod(a,n)+1,b)+Sij(mod(a-2,n)+1,b)+Sij(a,mod(b,m)+1)+Sij(a,mod(b-2,m)+1) );
    end
end

energia = E/2;
