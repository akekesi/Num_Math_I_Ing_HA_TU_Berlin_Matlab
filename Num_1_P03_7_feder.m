%% 2xFerdern 1xGewicht
g = 9.82;
m = 1;
L = 2;
s = 10;
I = eye(2);
a_1 = [0; 0];
a_2 = [1; 1];
x_0 = [0; -4];  % [0; -4] und [0; 4];
tol = 0.001;
d = 111;
steps = 0;

G = [0; -m*g];
F_1 = @(x) s*(L/(norm((x-a_1),2))-1)*(x-a_1);
F_2 = @(x) s*(L/(norm((x-a_2),2))-1)*(x-a_2);
F = @(x) F_1(x)+F_2(x)+G;
dF_1 =  @(x) s*((L/(norm((x-a_1),2))-1)*I-L*((x-a_1)*(x-a_1)')/(norm((x-a_1),2))^3);
dF_2 =  @(x) s*((L/(norm((x-a_2),2))-1)*I-L*((x-a_2)*(x-a_2)')/(norm((x-a_2),2))^3);
dF = @(x) dF_1(x)+dF_2(x);

while abs(d) > tol
    x = x_0-dF(x_0)\F(x_0);     % oder x = x_0-inv(dF(x_0))*F(x_0);
    d = x_0-x;
    x_0 = x;
    steps = steps+1;
end
disp('x:');
disp(x);
disp('Steps:')
disp(steps);
disp('F(x)=0:')
disp(F(x));

f1 = F_1(x)/10;
f2 = F_2(x)/10;
g = G/10;

x_plot = [a_1(1,1) x(1,1) a_2(1,1)];
y_plot = [a_1(2,1) x(2,1) a_2(2,1)];
plot(x_plot,y_plot,'k','LineWidth',2)
hold on
x_g = [x(1,1) (x(1,1)+g(1,1))];
y_g = [x(2,1) (x(2,1)+g(2,1))];
plot(x_g,y_g,'g','LineWidth',5)
x_f1 = [x(1,1) (x(1,1)+f1(1,1))];
y_f1 = [x(2,1) (x(2,1)+f1(2,1))];
plot(x_f1,y_f1,'b','LineWidth',5)
x_f2 = [x(1,1) (x(1,1)+f2(1,1))];
y_f2 = [x(2,1) (x(2,1)+f2(2,1))];
plot(x_f2,y_f2,'r','LineWidth',5)
plot(a_1(1,1),a_1(2,1),'k','Marker','x','MarkerSize',15,'LineWidth',5)
plot(a_2(1,1),a_2(2,1),'k','Marker','x','MarkerSize',15,'LineWidth',5)
plot(x(1,1),x(2,1),'k','Marker','o','MarkerFaceColor','k','MarkerSize',10)