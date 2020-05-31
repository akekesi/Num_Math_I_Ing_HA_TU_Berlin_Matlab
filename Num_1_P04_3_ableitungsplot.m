%% Ableitungsplot
f1 = @(x) sin(x);
f2 = @(x) x.^3;

a = -5;
b = 5;
h = 0.1;
n = 100;
x = a:(b-a)/(n-1):b;    % ??? Stuetzstellen mit a und b ???

%% Plot
subplot(1,2,1)
plot(x,f1(x),'Color','#0072BD')
hold on
plot(x,funk_df(f1,x,h),'Color','#D95319')
plot(x,funk_ddf(f1,x,h),'Color','#EDB120')
legend({'f','df','ddf'}, 'location', 'NorthEast');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
title('y=sin(x)','FontSize',15,'FontWeight','normal')
grid on

subplot(1,2,2)
plot(x,f2(x),'Color','#0072BD')
hold on
plot(x,plot(x,funk_df(f2,x,h)),'Color','#D95319')
plot(x,funk_ddf(f2,x,h),'Color','#EDB120')
legend({'f','df','ddf'}, 'location', 'NorthEast');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
title('y=x^3','FontSize',15,'FontWeight','normal')
grid on

%% df
function df = funk_df(f,x,h)
df = (f(x+h)-f(x-h))/2/h;
end

%% ddf
function ddf = funk_ddf(f,x,h)
ddf = (f(x-h)-2*f(x)+f(x+h))/h^2;
end