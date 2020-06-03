%% Doppelstern
clear all
clc

global m1
global m2;
global gamma
frage = 'Waehlen Sie! [1-2-3-4]\n';
V = input(frage);
if V == 1
    m1 = 3;
    m2 = 3;
    p = 3;
    x1 = [-1;0];
    x2 = [1;0];
    h = 0.1;
elseif V == 2
    m1 = 2.5;
    m2 = 5;
    p = 2.637;
    x1 = [-2;0];
    x2 = [1;0];
    h = 0.1;
elseif V == 3
    m1 = 1;
    m2 = 5;
    p = 1.1;
    x1 = [-1;0];
    x2 = [1;0];
    h = 0.1;
elseif V ==4
    m1 = 1;
    m2 = 5;
    p = 0.7;
    x1 = [-1;0];
    x2 = [1;0];
    h = 0.05;
end

gamma = 1;
SP = (x1*m1+x2*m2)/(m1+m2);
v1 = [0;p/m1];
v2 = [0;-p/m2];
y = [x1;x2;v1;v2];
m = length(y);
n = 150;         % 39
Y = zeros(m,n);
R = zeros(2,n);

for n = 1:1:n
    if n == 1
        y = [x1;x2;v1;v2];
    else
        y = ruku_schritt(@gravi,y,h);
    end
    r = y(3:4)-y(1:2);
    Y(:,n) = y;
    R(:,n) = r;
end
plot(R(1,:),R(2,:),'k')


for n = 1:1:n
    clf
    subplot(1,2,1)
    plot(SP(1,1),SP(2,1),'x','MarkerSize',15,'LineWidth',3,'Color','k')
    hold on
    plot(Y(1,1:n),Y(2,1:n),'Color','#0072BD')
    plot(Y(3,1:n),Y(4,1:n),'Color','#D95319')
    plot(Y(1,n),Y(2,n),'.','MarkerSize',m1*10,'Color','#0072BD');
    plot(Y(3,n),Y(4,n),'.','MarkerSize',m2*10,'Color','#D95319');
    legend({'Schwerp.','m1','m2'}, 'location', 'NorthEast');
    
    grid on;
    ax1 = gca;
    ax1.XAxisLocation = 'origin';
    ax1.YAxisLocation = 'origin';
    ax1.XLim = [-3 3];
    ax1.YLim = [-3 3];
    daspect([1 1 1])
    
    % Relativvektor
    subplot(1,2,2)
    plot(R(1,1:n),R(2,1:n),'k')
    hold on
    quiver(0,0,R(1,n),R(2,n),'AutoScale','off','Color','k');
    legend({'Relativv.'}, 'location', 'NorthEast');
    grid on;
    ax2 = gca;
    ax2.XAxisLocation = 'origin';
    ax2.YAxisLocation = 'origin';
    ax2.XLim = [-5 5];
    ax2.YLim = [-5 5];
    daspect([1 1 1])
    drawnow
end

%% Gravi
function f = gravi(y)
global m1
global m2;
global gamma
x1 = y(1:2);
x2 = y(3:4);
v1 = y(5:6);
v2 = y(7:8);
F1 = gamma*m1*m2/(norm(x2-x1))^3*(x2-x1);
F2 = -F1;
f = [v1;v2;F1/m1;F2/m2];
end

%% Runge-Kutta
function y_neu = ruku_schritt(f,y,h)
k1 = f(y);
k2 = f(y+h/2*k1);
k3 = f(y+h/2*k2);
k4 = f(y+h*k3);
y_neu = y+h*(k1/6+k2/3+k3/3+k4/6);
end
