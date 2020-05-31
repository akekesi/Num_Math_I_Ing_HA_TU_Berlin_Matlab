%% Doppelsten-Plot
clear all
clc

fig = uifigure;

ax1 = uiaxes('Parent',fig,...
    'Units','pixels',...
    'Position',[100,100,200,200]);
ax1.XAxisLocation = 'origin';
ax1.YAxisLocation = 'origin';
ax1.XLim = [-2.5 2.5];
ax1.YLim = [-2.5 2.5];
ax1.PlotBoxAspectRatio = [1 1 1];

ax2 = uiaxes('Parent',fig,...
    'Units','pixels',...
    'Position',[300,100,200,200]);
ax2.XAxisLocation = 'origin';
ax2.YAxisLocation = 'origin';
ax2.XLim = [-5 5];
ax2.YLim = [-5 5];
ax2.PlotBoxAspectRatio = [1 1 1];

btn1 = uibutton(fig,'push',...
    'Text','1',...
    'Position',[150,310,24,22],...
    'ButtonPushedFcn', @(btn1,event) plotButtonPushed(btn1,ax1,ax2));

btn2 = uibutton(fig,'push',...
    'Text','2',...
    'Position',[180,310,24,22],...
    'ButtonPushedFcn', @(btn2,event) plotButtonPushed(btn2,ax1,ax2));

btn3 = uibutton(fig,'push',...
    'Text','3',...
    'Position',[210,310,24,22],...
    'ButtonPushedFcn', @(btn3,event) plotButtonPushed(btn3,ax1,ax2));

btn4 = uibutton(fig,'push',...
    'Text','4',...
    'Position',[240,310,24,22],...
    'ButtonPushedFcn', @(btn4,event) plotButtonPushed(btn4,ax1,ax2));

function plotButtonPushed(btn,ax1,ax2)
global m1;
global m2;
global gamma
global h;
gamma = 1;
h = 0.1;
if btn.Text == '1'
    m1 = 3;
    m2 = 3;
    p = 3;
    x1 = [-1;0];
    x2 = [1;0];
    n = 135;
elseif btn.Text == '2'
    m1 = 2.5;
    m2 = 5;
    p = 2.637;
    x1 = [-2;0];
    x2 = [1;0];
    n = 121;
elseif btn.Text == '3'
    m1 = 1;
    m2 = 5;
    p = 1.1;
    x1 = [-1;0];
    x2 = [1;0];
    n = 44;
elseif btn.Text == '4'
    m1 = 1;
    m2 = 5;
    p = 0.7;
    x1 = [-1;0];
    x2 = [1;0];
    n = 150;
    h = 0.05;
end
[SP,R,Y] = doppelstern(p,x1,x2,n);
n = length(Y);
for n = 1:1:n
    plot(ax1,SP(1,1),SP(2,1),'x','MarkerSize',15,'LineWidth',3,'Color','k')
    hold(ax1,'on')
    plot(ax1,Y(1,1:n),Y(2,1:n),'Color','#0072BD')
    plot(ax1,Y(3,1:n),Y(4,1:n),'Color','#D95319')
    plot(ax1,Y(1,n),Y(2,n),'.','MarkerSize',m1*10,'Color','#0072BD')
    plot(ax1,Y(3,n),Y(4,n),'.','MarkerSize',m2*10,'Color','#D95319')
    legend(ax1,{'Schwerp.','m1','m2'}, 'location', 'NorthEast')
    drawnow
    hold(ax1,'off')
    
    plot(ax2,R(1,1:n),R(2,1:n),'k')
    hold(ax2,'on')
    quiver(ax2,0,0,R(1,n),R(2,n),'AutoScale','off','Color','k')
    legend(ax2,{'Relativv.'}, 'location', 'NorthEast')
    daspect(ax2,[1 1 1])
    drawnow
    hold(ax2,'off')
end
end

%% Doppelstern
function [SP,R,Y] = doppelstern(p,x1,x2,n)
global m1;
global m2;
SP = (x1*m1+x2*m2)/(m1+m2);
v1 = [0;p/m1];
v2 = [0;-p/m2];
y = [x1;x2;v1;v2];
m = length(y);
Y = zeros(m,n);
R = zeros(2,n);

for n = 1:1:n
    if n == 1
        y = [x1;x2;v1;v2];
    else
        y = ruku_schritt(@gravi,y);
    end
    r = y(3:4)-y(1:2);
    Y(:,n) = y;
    R(:,n) = r;
end
end

%% Gravi
function f = gravi(y)
global m1;
global m2;
global gamma;
x1 = y(1:2);
x2 = y(3:4);
v1 = y(5:6);
v2 = y(7:8);
F1 = gamma*m1*m2/(norm(x2-x1))^3*(x2-x1);
F2 = -F1;
f = [v1;v2;F1/m1;F2/m2];
end

%% Runge-Kutta
function y_neu = ruku_schritt(f,y)
global h;
k1 = f(y);
k2 = f(y+h/2*k1);
k3 = f(y+h/2*k2);
k4 = f(y+h*k3);
y_neu = y+h*(k1/6+k2/3+k3/3+k4/6);
end