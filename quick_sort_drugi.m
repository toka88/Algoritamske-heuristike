function niz = quick_sort_drugi(niz, p, r)
    q = 0;
    if p<r % proverava se da li niz ima vise od jednog elementa
        [niz, q] = rand_particija(niz, p, r);
        niz = quick_sort_drugi(niz,p,q-1);
        niz = quick_sort_drugi(niz, q+1, r);
    end
end

%%Poslednji element menja sa onim koji se nalazi na slucajnoj poziciji 
    function [niz, j] = rand_particija(niz, p, r)
        i = p+randi([0 r-p],1,1);
        pomocna = niz(r);
        niz(r) = niz(i);
        niz(i) = pomocna;
        [niz, j] = particija(niz,p,r);
    end
    
    function [niz, i] = particija(niz,p,r)
        x = niz(r);
        i = p - 1;
        for j = p: r-1
            if niz(j)<= x
                i = i+1;
                pomocna = niz(i);
                niz(i) = niz(j);
                niz(j) = pomocna;
            end
        end
        pomocna = niz(i+1);
        niz(i+1) = niz(r);
        niz(r) = pomocna;
        i = i+1;
    end