%% Matrix-Multiplikation
function [A] = Num_1_P01_3_mat_mult(L,R)

m_1 = size(L,1);
n_2 = size(R,2);
A = zeros(m_1,n_2);

% Eintraege der Matrix A(m,n) mit Funktionaufruf
for m = 1:1:m_1
    for n = 1:1:n_2
        A(m,n) = mult(L(m,:),R(:,n),m_1);
    end
end
end

% Berechnung der Eintraege von Matrix A
function [x] = mult(a,b,m_1)
x = 0;
for m = 1:1:m_1
        x = x + a(m)*b(m);
end
end
