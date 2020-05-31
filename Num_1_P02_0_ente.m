%% untransformierte Ente, Kreis
A = randi(2,2,2);
x = [0 6 ; 0 0];
y = [0 0; 0 6];
[U,S,V] = svd(A);
r = 6;
t = 0:0.01:2*pi;
kreis = [r*cos(t); r*sin(t)];
ente = [0 1 1 1.5 2.5 3 3 4 2 2 1 -3.7 -5 -4 -3 0; 1 0 3.5 4 4 3.5 3 3 2 -1 -2 -2 1 0 1 1];

subplot(2,3,1)
plot(ente(1,:), ente(2,:), 'k');
hold on;
plot(kreis(1,:), kreis(2,:), 'k');
plot(x(1,:), x(2,:), 'b', 'LineWidth',2);
plot(y(1,:), y(2,:), 'r', 'LineWidth',2);
grid on;
ylim([-20 20]);
xlim([-20 20]);
title('Original (M)', 'FontSize', 15, 'FontWeight', 'normal')
%% V' Ente, Kreis
ente_V = V'*ente;
kreis_V = V'*kreis;

subplot(2,3,4)
plot(ente_V(1,:), ente_V(2,:), 'k');
hold on;
plot(kreis_V(1,:), kreis_V(2,:), 'k');
x_V = V'*x;
y_V = V'*y;
plot(x_V(1,:), x_V(2,:), 'b', 'LineWidth',2);
plot(y_V(1,:), y_V(2,:), 'r', 'LineWidth',2);
ylim([-20 20]);
xlim([-20 20]);
title("V'*M", 'FontSize', 15, 'FontWeight', 'normal')
%% SV' Ente, Kreis
ente_SV = S*V'*ente;
kreis_SV = S*V'*kreis;

subplot(2,3,5)
plot(ente_SV(1,:), ente_SV(2,:), 'k');
hold on;
plot(kreis_SV(1,:), kreis_SV(2,:), 'k');
x_SV = S*V'*x;
y_SV = S*V'*y;
plot(x_SV(1,:), x_SV(2,:), 'b', 'LineWidth',2);
plot(y_SV(1,:), y_SV(2,:), 'r', 'LineWidth',2);
ylim([-20 20]);
xlim([-20 20]);
title("S*V'*M", 'FontSize', 15, 'FontWeight', 'normal')
%% A=USV Ente, Kreis
ente_USV = U*S*V'*ente;
kreis_USV = U*S*V'*kreis;

subplot(2,3,2)
plot(ente_USV(1,:), ente_USV(2,:), 'k');
hold on;
plot(kreis_USV(1,:), kreis_USV(2,:), 'k');
x_USV = U*S*V'*x;
y_USV = U*S*V'*y;
plot(x_USV(1,:), x_USV(2,:), 'b', 'LineWidth',2);
plot(y_USV(1,:), y_USV(2,:), 'r', 'LineWidth',2);
ylim([-20 20]);
xlim([-20 20]);
title("U*S*V'*M", 'FontSize', 15, 'FontWeight', 'normal')
%% A=USV Ente, Kreis
ente_A = A*ente;
kreis_A = A*kreis;

subplot(2,3,3)
plot(ente_A(1,:), ente_A(2,:), 'k');
hold on;
plot(kreis_A(1,:), kreis_A(2,:), 'k');
x_A = A*x;
y_A = A*y;
plot(x_A(1,:), x_A(2,:), 'b', 'LineWidth',2);
plot(y_A(1,:), y_A(2,:), 'r', 'LineWidth',2);
ylim([-20 20]);
xlim([-20 20]);
title('A*M', 'FontSize', 15, 'FontWeight', 'normal')