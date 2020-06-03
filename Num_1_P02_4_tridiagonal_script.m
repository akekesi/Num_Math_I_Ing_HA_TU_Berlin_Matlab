%%Tridiagonal
n = 3;
f = ones(1,n);
s = ones(1,n);
a = zeros(1,n);
b = zeros(1,n-1);
for k=1:1:n
    if k < n
        a(1,k) = s(1,k)+s(1,k+1);
        b(1,k) = -s(1,k+1);
    else
        a(1,k) = s(1,k);
    end
end
[u] = Num_1_P02_3_tridiagonal(a,b,f);
disp(a);
disp(b);
disp(f);
disp(u);

%{
S = zeros(n);
s = ones(1,n);
for k=1:1:n
    if k == 1
        S(k,k) = s(1,n)+s(1,k+1);
        S(k,k+1) = -s(1,k+1); 
    elseif k == n
        S(k,k-1) = -s(1,k);
        S(k,k) = s(1,n);
    else
        S(k,k-1) = -s(1,k);
        S(k,k) = s(1,n)+s(1,k+1);
        S(k,k+1) = -s(1,k+1);
    end
end
S
%}
