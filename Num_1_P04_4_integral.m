%% Integral
clear all
clc
clf
f = @(x) x.^3-5*x.^2+22;
a = 0;
b = 5;
n = 100;
[T,xt,t,S,xs,s,R,xr,r] = integral(f,a,b,n);
disp('T:')
disp(T)
disp('S:')
disp(S)
disp('R:')
disp(R)
%% Plot
x = a:0.01:b;
plot(x,f(x),'--','Color','k','LineWidth',2);
hold on
plot(xt,t,'Color','#0072BD');
plot(xs,s,'.','Color','#D95319','MarkerSize',13);
plot(xs,s,'x','Color','#77AC30','MarkerSize',9,'LineWidth',1);
legend({'f','F-Trapezregel','F-Simpsoregel','F-Riemann'}, 'location', 'NorthEast');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
grid on

%% Trapez-/Simpsonregel/Riemann Zwischenwertsumme
function [T,xt,t,S,xs,s,R,xr,r] = integral(f,a,b,n)
T = 0;
xt = zeros(1,n-1);
t = zeros(1,n-1);
S = 0;
xs = zeros(1,n-1);
s = zeros(1,n-1);
R = 0;
xr = zeros(1,n-1);
r = zeros(1,n-1);
h = (b-a)/(n-1);
for k = 1:1:n-1
    T = T + (f(a+(k-1)*h)+f(a+k*h))/2*h;
    xt(1,k) = (a+h/2)+h*k;
    t(1,k) = T;
    
    S = S + (h)/6*(f(a+(k-1)*h)+4*f(a+k*h-h/2)+f(a+k*h));
    xs(1,k) = xt(1,k);
    s(1,k) = S;
    
    xrand = a+h*(k-1) + rand*h;
    R = R + f(xrand)*h;
    xr(1,k) = xrand;
    r(1,k) = R;
end
end