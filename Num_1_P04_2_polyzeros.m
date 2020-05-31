%% Polyzeros
% Wiso wird die letzte NS immer nur in 2 Schritte bestimmt?
clear all
clc

a = [1 1 2];    % [-1 9 81 -729];
[x,step] = polyzeros(a);
disp('NS:')
disp(x')
disp('Steps:')
disp(step-1)

%% Funk-Polyzeros
function [x,step] = polyzeros(a)
n = length(a)-1;
x = zeros(1,n);
step = x;
tol = 0.001;

X = -5:0.1:5;
Y = polyval(a,X);
plot(X,Y);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

for n = 1:1:n
    x0 = rand+1i*rand;
    d = 111;
    while abs(d) > tol
        f = polyval(a,x0);
        da = polyder(a);
        df = polyval(da,x0);
        D = df/f;
        for k = 1:1:n-1
            D = D-1/(x0-x(1,k));
        end
        x(1,n) = x0-1/D;
        d = x(1,n)-x0;
        x0 = x(1,n);
        step(1,n) = step(1,n)+1;
    end
end
end