%% Script fuer Test

%% Vor/Rueck
% A*x = L*R*x = L*y = b
L = [1 0 0; -2 1 0; 4 5 1];
R = [2 -1 6; 0 3 9; 0 0 -2];
b = [18 -3 231];
[x] = Num_1_P01_1_vorrueck(L,R,b);
disp(x);

%% Berechnung der Matrix A
% A = L*R
[A] = Num_1_P01_3_mat_mult(L,R);
disp(A);

%% LR-Zerlegung
% A*x = L*R*x = L*y = b
[L,R] = Num_1_P01_2_lr(A);
disp(L);
disp(R);

%% Plot
clf
x_1 = 0:0.01:1;
y_11 = sin(5*x_1);
y_12 = cos(5*x_1);
x_2 = -3:0.01:3;
y_21 = sin(exp(x_2));

subplot(2,1,1)
plot(x_1,y_11)
hold on
plot(x_1,y_12)
v =5;
text(0.5,0,['text: ',num2str(v)])
title('y=sin(5x) und y=cos(5x)', 'FontSize', 15, 'FontWeight', 'normal')
ylim([-2 2])
xlabel('x', 'FontSize', 15)
ylabel('y', 'FontSize', 15)
yticks(-2:1:2)
grid on

subplot(2,1,2)
plot(x_2,y_21)
title('y=sin(exp(x))', 'FontSize', 15, 'FontWeight', 'normal')
ylim([-1.5 1.5])
xlabel('x', 'FontSize', 15)
ylabel('y', 'FontSize', 15)
yticks(-1.5:0.5:1.5)
