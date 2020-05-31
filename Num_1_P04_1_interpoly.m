%% Interpolation
clear all
clc

x_min = -6;
x_max = 6;
k = 11;
x_ls = linspace(x_min,x_max,k);
x_ts = f_tschebyscheff(x_min,x_max,k);
y1 = @(x) cos(x);
y2 = @(x) (1+x.^2).^(-1);
y1_ls =y1(x_ls);
y2_ls =y2(x_ls);
y1_ts =y1(x_ts);
y2_ts =y2(x_ts);

a1_ls = f_a_koeff(k,x_ls,y1_ls);
a2_ls = f_a_koeff(k,x_ls,y2_ls);
a1_ts = f_a_koeff(k,x_ts,y1_ts);
a2_ts = f_a_koeff(k,x_ts,y2_ts);

%% Plot
schritt = 0.001;
subplot(2,2,1)
plot(x_ls,y1_ls,'x','MarkerEdgeColor','k','MarkerSize',10,'LineWidth',2);
hold on;
%plot(x_ts,y,'o','MarkerEdgeColor','k','MarkerSize',10,'LineWidth',2);
x_plot = x_min:schritt:x_max;
y_plot = f_plot(x_plot,a1_ls,k);
plot(x_plot,y_plot,'r');
title({'y=cos(x)','(mit linspace)'},'FontSize',15,'FontWeight','normal')
grid on

subplot(2,2,2)
plot(x_ls,y2_ls,'x','MarkerEdgeColor','k','MarkerSize',10,'LineWidth',2);
hold on;
%plot(x_ts,y,'o','MarkerEdgeColor','k','MarkerSize',10,'LineWidth',2);
x_plot = x_min:schritt:x_max;
y_plot = f_plot(x_plot,a2_ls,k);
plot(x_plot,y_plot,'r');
title({'y=1/(1+x^2)','(mit linspace)'},'FontSize',15,'FontWeight','normal')
grid on

subplot(2,2,3)
plot(x_ts,y1_ts,'x','MarkerEdgeColor','k','MarkerSize',10,'LineWidth',2);
hold on;
x_plot = x_min:schritt:x_max;
y_plot = f_plot(x_plot,a1_ts,k);
plot(x_plot,y_plot,'r');
title({'y=cos(x)','(mit Tschebyscheff)'},'FontSize',15,'FontWeight','normal')
grid on

subplot(2,2,4)
plot(x_ts,y2_ts,'x','MarkerEdgeColor','k','MarkerSize',10,'LineWidth',2);
hold on;
x_plot = x_min:schritt:x_max;
y_plot = f_plot(x_plot,a2_ts,k);
plot(x_plot,y_plot,'r');
title({'y=1/(1+x^2)','(mit Tschebyscheff)'},'FontSize',15,'FontWeight','normal')
grid on
%% Vandermonde
function a = f_a_koeff(k,x,y)
A = zeros(k);
for m = k:-1:1
    for n = k:-1:1
        A(m,n) = x(1,m)^(k-n);
    end
end
a = (A\y')';
end

%% Tschebyscheff
function x = f_tschebyscheff(x_min,x_max,k)
x = zeros(1,k);
for n = 1:1:k
    x(1,n) = (x_min+x_max)/2+(x_max-x_min)/2*cos((2*n-1)/(2*(k+1))*pi);
end
end

%% Funktion fuer y_plot
function y = f_plot(x,a,k)
y = 0;
for n = k:-1:1
    y = y + a(1,n)*x.^(k-n);
end
end