%% Sekanten Verfahren
function [x, steps] = Num_1_P03_4_sekanten(f,a,b,tol)
d = 111;
x_0 = a;
x_1 = b;
steps = 0;
while abs(d) > tol
    x = (x_0*f(x_1)-x_1*f(x_0))/(f(x_1)-f(x_0));
    d = x_1-x;
    steps = steps+1;
    x_0 = x_1;
    x_1 = x;
end
end
