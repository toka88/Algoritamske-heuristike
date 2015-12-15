function [vertexCover] = vertex_cover_goran(G)
    matrica = G;
    vertexCover = [0];
    while (true)
        [k] = kardinalnost(matrica);
        [index, najveci] = indexNajveceg(k);
        if najveci ~= 0
            vertexCover = [vertexCover index];  % Dodaje cvor u veretxCover
            [matrica] = brisanje(matrica, index);
        else 
            break; % za izlazak iz while petlje - pronadjen je vertex cover
        end
    end    
end

function [k] = kardinalnost(matrica)
    [red,kolona] = size(matrica);
    k = zeros(1,red); % formiranje niza i postavljanje vrednosti na nulu
    brojac = 0;
    for i = 1: red
        for j= 1: kolona
            if matrica(i,j)==1
            brojac = brojac +1;    
            end
        end
        k(i) = brojac;
        brojac = 0;
    end
end

function [index, maxVrednost] = indexNajveceg(niz)
    maxVrednost = max(niz);
    for i = 1: size(niz,2)
        if maxVrednost == niz(i)
            index = i;
        end
    end
end

function [staramatrica] = brisanje(staramatrica, index)
    n = size(staramatrica,1);
    for i = 1:n
        staramatrica(index, i) = 0;
        staramatrica(i, index) = 0;
    end
end