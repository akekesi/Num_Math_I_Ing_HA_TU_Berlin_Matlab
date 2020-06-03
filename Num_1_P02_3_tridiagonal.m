function [u] = Num_1_P02_3_tridiagonal(a,b,f)
c = zeros(size(a));
d = zeros(size(b));
y = zeros(size(f));
u = zeros(size(f));
% c, d
for n=1:1:length(a)
    if n > 1
        c(1,n) = sqrt(a(1,n)-d(1,n-1)^2);
    else
        c(1,n) = sqrt(a(1,n));
    end
    if n < length(a)
        d(1,n) = b(1,n)/c(1,n);
    end
end
% L*y=f --> y
for n=1:1:length(a)   
    if n == 1
        y(1,n) = f(1,n)/c(1,n);
    else
        y(1,n) = (f(1,n)-y(1,n-1)*d(1,n-1))/c(1,n);
    end
end
% L'*u=y --> u
for n=length(a):-1:1   
    if n == length(a)
        u(1,n) = y(1,n)/c(1,n);
    else
        u(1,n) = (y(1,n)-d(1,n)*u(1,n+1))/c(1,n);
    end
end
%disp(c);
%disp(d);
%disp(y);
end
