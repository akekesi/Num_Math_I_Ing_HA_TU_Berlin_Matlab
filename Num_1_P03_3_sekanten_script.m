%% Sekanten Verfahren
clear all

f = @(x) 1+cos(x).*cosh(x);
a = 5;
b = a+3;
tol = 0.001;

[x, steps] = Num_1_P03_sekanten(f,a,b,tol);
disp(x);
disp(steps);