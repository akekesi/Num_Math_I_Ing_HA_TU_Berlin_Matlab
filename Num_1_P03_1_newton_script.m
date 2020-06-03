%% Newton Verfahren (df(a) darf nicht Null sein!)
clear all

f = @(x) 1+cos(x).*cosh(x);
df = @(x) -sin(x).*cosh(x)+cos(x).*sinh(x);
a = 5;
tol = 0.001;

[x, steps] = Num_1_P03_2_newton(f,df,a,tol);
disp(x);
disp(steps);
