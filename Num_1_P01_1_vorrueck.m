%% Hilfsfunktion fuer L-R Zerlegung
function [x] = Num_1_P01_vorrueck(L,R,b)

% L,R,b fuer test:
% Ergebnis: [1,2,3]
% L = [1 0 0; -2 1 0; 4 5 1];
% R = [2 -1 6; 0 3 9; 0 0 -2];
% b = [18 -3 231];

laenge = length(L);
y = zeros(1,laenge);
x = zeros(1,laenge);

% Vorwaertseinsetzen --> y
for m = 1:1:laenge
    y(m) = b(m);
    if m > 1
        for n = (m-1):-1:1
            y(m) = y(m) - y(n)*L(m,n);
        end
    end
end

% Rueckwaertseinsetzen --> x
for m = laenge:-1:1
    x(m) = y(m);
    if m < laenge
        for n = (m+1):1:laenge
            x(m) = x(m) - x(n)*R(m,n);
        end
    end
    x(m) = x(m)/R(m,m);
end
end