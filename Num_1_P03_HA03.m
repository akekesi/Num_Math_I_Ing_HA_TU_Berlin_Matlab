%% Iterationsverfahren/Newton Verfahre
clear all
clc
tol = 10^-15;
a = 5;
x_0 =5;
d = 999;
s = 0;
%f = @(x) exp(-x/2);                    % 2/Ue:
%f = @(x) (1/2*x^2-12);                 % 2/H:
%f = @(x) sqrt(2*(x+12));               % 2/H: x_0 = 4, delta > 0.00001
%f = @(x) -sqrt(2*(x+12));              % 2/H: x_0 = 0, delta > 0.00001
f = @(x) 1/2*(x+a/x)-(x^2-a)^2/8/x^3;   % 3/H/c: a = 5, x_0 = 5, delta > 1*10^-16
f_NV = @(x) x^2-5;
df_NV = @(x) 2*x;

while abs(d) > tol
    y = f(x_0);
    d = x_0 - y;
    x_0 = y;
    s = s + 1;
end
disp('---Fixpunkt Iteration---')
disp(x_0);
disp(s);        %(vorletztes y ist das richtige --> (s-1) Schritte ist noetig)
disp('---Newton Verfahren---')
[x_NV, steps_NV] = Num_1_P03_newton(f_NV,df_NV,a,tol);
disp(x_NV);
disp(steps_NV); %(vorletztes y ist das richtige --> (s-1) Schritte ist noetig)
disp('!!! Vorletztes y ist das richtige --> (s-1) Schritte ist noetig !!!')