%% Loesevergleich
clear all
clc
a = 0;
b = 50;
h1 = 0.5;
h2 = 0.2;
h3 = 0.1;
y0 = 1;
dy =  @(t,y0) cos(t)*y0;
y = @(t) exp(sin(t));

[t_eE1,y_eE1] = expl_Euler(a,b,h1,dy,y0);
[t_C1,y_C1] = Collatz(a,b,h1,dy,y0);
[t_H1,y_H1] = Heun(a,b,h1,dy,y0);

[t_eE2,y_eE2] = expl_Euler(a,b,h2,dy,y0);
[t_C2,y_C2] = Collatz(a,b,h2,dy,y0);
[t_H2,y_H2] = Heun(a,b,h2,dy,y0);

[t_eE3,y_eE3] = expl_Euler(a,b,h3,dy,y0);
[t_C3,y_C3] = Collatz(a,b,h3,dy,y0);
[t_H3,y_H3] = Heun(a,b,h3,dy,y0);

%% Plot
x = a:0.1:b;
subplot(3,1,1)
plot(x,y(x),'Color','k')
hold on,

plot(t_eE1,y_eE1,'Color','#0072BD')
plot(t_C1,y_C1,'Color','#D95319')
plot(t_H1,y_H1,'Color','#EDB120')
title('h=0,5','FontWeight','normal')
legend({'y=exp(sin(t))','expl. Euler','Collatz','Heun'}, 'location', 'NorthEast');
axis([a b 0 3])
grid on

subplot(3,1,2)
plot(x,y(x),'Color','k')
hold on,
plot(t_eE2,y_eE2,'Color','#0072BD')
plot(t_C2,y_C2,'Color','#D95319')
plot(t_H2,y_H2,'Color','#EDB120')
title('h=0,2','FontWeight','normal')
legend({'y=exp(sin(t))','expl. Euler','Collatz','Heun'}, 'location', 'NorthEast');
axis([a b 0 3])
grid on

subplot(3,1,3)
plot(x,y(x),'Color','k')
hold on,
plot(t_eE3,y_eE3,'Color','#0072BD')
plot(t_C3,y_C3,'Color','#D95319')
plot(t_H3,y_H3,'Color','#EDB120')
title('h=0,1','FontWeight','normal')
legend({'y=exp(sin(t))','expl. Euler','Collatz','Heun'}, 'location', 'NorthEast');
axis([a b 0 3])
grid on

%% explites Eulerverfahren
function [t,y1] = expl_Euler(a,b,h,dy,y0)
t = a:h:b;
y1 = zeros(size(t));
y1(1,1) = y0;
for n = 2:1:length(t)
    y1(1,n) = y0+h*dy(t(n-1),y0);
    y0 = y1(1,n);
end
end

%% Collatzverfahren
function [t,y1] = Collatz(a,b,h,dy,y0)
t = a:h:b;
y1 = zeros(size(t));
y1(1,1) = y0;
for n = 2:1:length(t)
    y1(1,n) = y0+h*dy(t(1,n-1)+h/2,y0+h/2*dy(t(1,n-1),y0));
    y0 = y1(1,n);
end
end

%% Heunverfahren
function [t,y1] = Heun(a,b,h,dy,y0)
t = a:h:b;
y1 = zeros(size(t));
y1(1,1) = y0;
for n = 2:1:length(t)
    y1(1,n) = y0 + h/2*(dy(t(1,n-1),y0)+dy(t(1,n-1)+h,y0+h*dy(t(1,n-1),y0)));
    y0 = y1(1,n);
end
end

%% Loesung von Max
%{
h=0.1;
%h = input('h: ');
a=0;
b=50;
t=[a:h:b];
[~,n]=size(t);
y=zeros(n,1);  
y(1,1)=1;

y_eu=y;
y_co=y;
y_he=y;

f = @(t,y) cos(t)*y;
for j=a+1:n-1;
  %%Explize Euler
    y_eu(j+1)=y_eu(j)+h*f(t(j),y_eu(j));
  %%Collatz
    y_co(j+1)=y_co(j)+h*f(t(j)+(h/2),y_co(j)+(h/2)*f(t(j),y_co(j)));
  %%Heun
    y_he(j+1)=y_he(j)+(h/2)*(f(t(j),y_he(j))+f(t(j)+h,y_he(j)+h*f(t(j),y_he(j))));
  %%Exakt
    y_ex(j+1)=exp(sin(t(j+1)));
end

figure('Name','Vergleich der Verfahren') 
hold on
plot(t,y_eu)
plot(t,y_co)
plot(t,y_he)
plot(t,y_ex)
legend('Euler','Collatz','Heun','Exakt')
hold off
%}