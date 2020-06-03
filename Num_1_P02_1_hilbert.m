%%Hilbertmatrix
m_a = 2;
m_e = 13;
m_T = m_e-m_a+1;
n_T = 6;
T = zeros(m_T,n_T);

for m = 1:1:m_T
    k = m_a+(m-1);
    A = hilb(k);
    b = A(:,1) + A(:,k);
    x = zeros(1,k);
    x(1,1) = 1;
    x(1,k) = x(1,k)+1;

    x_bs = A\b;

    [L,R,P] = lu(A);
    y_lr = L\(P*b); % wegen der Reihenfolge von L ist P*b noetig
    x_lr = R\y_lr;

    [R_chol] = chol(A); % für symm., pos. def. Matrix
    y_chol = R_chol'\b;
    x_chol = R_chol\y_chol;

    T(m,1) = k;
    T(m,2) = cond(A,Inf)*10^-16;
    T(m,3) = norm((x-x_bs),inf)/norm(x,inf);
    T(m,4) = norm((x-x_lr),inf)/norm(x,inf);
    T(m,5) = norm((x-x_chol),inf)/norm(x,inf);
    T(m,6) = norm((A*x_chol-b),inf);    % ??????? *10^16; ???????
end
disp(T);
% ab 12: "Warning: Matrix is close to singular or badly scaled. Results may be inaccurate. RCOND =  2.684500e-17. 
%         In Num_1_P02_hilbert (line 16)"
% bei 15 stürzt ab
% am schlechteste nach 12: LR-Zerlegung

% FRAGE:
% [L,R]=Num_1_P01_2_lr(A);             % ??? andere Ergebnisse wie lu(A) ???
% [x] = Num_1_P01_1_vorrueck(L,R,b);
