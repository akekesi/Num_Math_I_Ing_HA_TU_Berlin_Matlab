%% Regula-Falsi Verfahren (f stetig, f(a)<0 und f(b)>0)
clear all
clf

x = -10:0.001:10;
f = @(x) 1+cos(x).*cosh(x);

plot(x,f(x))
grid on;
grid minor;
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
disp('f(a) und f(b) muessen unterschiedliche Vorzeichen haben!')
disp('Fuer Test: a=4, b=6')
a = input('a: ');
b = input('b: ');
tol = 0.001;

while f(a) >= 0 || f(b) <= 0
    if f(a) > 0 && f(b) <0
        tmp = a;
        a = b;
        b = tmp;
    else
        disp('Falsche Angabe!')
        disp('f(a) und f(b) muessen unterschiedliche Vorzeichen haben!')
        a = input('a: ');
        b = input('b: ');
    end
end

[x,steps] = Num_1_P03_regulafalsi(f,a,b,tol);
disp(x);
disp(steps);