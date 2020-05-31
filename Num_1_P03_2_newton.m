%% Newton Verfahren (df(a) darf nicht Null sein!)
function [x, steps] = Num_1_P03_newton(f,df,a,tol)
d = 111;
x_0 = a;
steps = 0;
while abs(d) > tol
    x = x_0 - f(x_0)/df(x_0);
    d = x_0-x;
    steps = steps+1;
    x_0 = x;
end
end