%% Nullstellen Verfahren Allgemein
% egymasutani eredmenyek kulonbseget szamolja ki
clear all
clf

%f = @(x) x.^2-2;
%df = @(x) 2*x;
f = @(x) 1+cos(x).*cosh(x);
df = @(x) -sin(x).*cosh(x)+cos(x).*sinh(x);

x = -10:0.001:10;
plot(x,f(x))
hold on
plot(x,df(x))
grid on;
grid minor;
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
disp('f(a) und f(b) muessen unterschiedliche Vorzeichen haben!')
disp('f(a_s) darf nicht Null sein!')
disp('Fuer Test: a=4, b=6')
a = input('a: ');   % fuer Regula-Falsi Verfahren
b = input('b: ');   % fuer Regula-Falsi Verfahren
a_s = a;            % fuer Sekanten und Newton Verfahren
b_s = a_s+3;        % fuer Sekanten
while f(a) >= 0 || f(b) <= 0 || df(a) == 0
    if f(a) > 0 && f(b) <0
        tmp = a;
        a = b;
        b = tmp;
    else
        disp('Falsche Angabe!')
        disp('f(a) und f(b) muessen unterschiedliche Vorzeichen haben!')
        disp('f(a_s) darf nicht Null sein!')
        disp('Fuer Test: a=4, b=6')
        a = input('a: ');   % fuer Regula-Falsi Verfahren
        b = input('b: ');   % fuer Regula-Falsi Verfahren
    end
end
tol = 0.001;
%% Newton Verfahren (df(a)darf nicht Null sein!)
[x_n, steps_n] = Num_1_P03_newton(f,df,a_s,tol);
disp(x_n);
disp(steps_n);
%% Sekanten Verfahren
[x_s, steps_s] = Num_1_P03_sekanten(f,a_s,b_s,tol);
disp(x_s);
disp(steps_s);
%% Regula-Falsi Verfahren (f stetig, f(a)<0 und f(b)>0)
[x_rf,steps_rf] = Num_1_P03_regulafalsi(f,a,b,tol);
disp(x_rf);
disp(steps_rf);