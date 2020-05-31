%%Hilbertmatrix Test
A = hilb(5);
[m,n] = size(A);
b = A(:,1) + A(:,n);
[L,R]=Num_1_P01_lr(A);
[x] = Num_1_P01_vorrueck(L,R,b);
disp('A:');
disp(A);
disp('b:');
disp(b');
disp('L:');
disp(L);
disp('R:');
disp(R);
disp('x:');
disp(x);
%% igy is lehet, de a "P*b"-t ne szabad elfelejteni !!! 
A = hilb(5)
b = A(:,1) + A(:,5);
[L,R,P] = lu(A);
L
R
P
b
P*b
y = L\(P*b) % !!! P*b !!!
x_lu = R\y
W = chol(A)
W'
%%
A = [2 -1 6; -4 5 -3; 8 11 67];
b = [18 -3 231];
[L,R,P] = lu(A);
y = L\(P*b'); % wegen der Reihenfolge von L ist P*b noetig
x_lr = R\y
%%
A = [2 -1 6; -4 5 -3; 8 11 67]
b = [18 -3 231]
[R_chol] = chol(A)
y = R_chol'\(b')
x_chol = R_chol\y
x__=A\b'
%%
A = hilb(5)
b = A(:,1) + A(:,5)
[R_chol] = chol(A)
y = R_chol'\(b)
x_chol = R_chol\y
x__=A\b