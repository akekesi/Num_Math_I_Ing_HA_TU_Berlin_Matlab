%% Regula-Falsi Verfahren (f stetig, f(a)<0 und f(b)>0)
function [x, steps] = Num_1_P03_regulafalsi(f,a,b,tol)
d = 111;
x_0 = a;
steps = 0;
while abs(d) > tol
    x = (a*f(b)-b*f(a))/(f(b)-f(a));
    d = x_0-x;
    if f(x) > 0
        b = x;
    else
        a = x;
    end
    steps = steps+1;
    x_0 = x;
end
end