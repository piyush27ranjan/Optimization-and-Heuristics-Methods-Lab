close all
clear
clc
syms x1 x2 real;
f = x2^2 + x1^2;
x0 = [0, 1];
fe = subs(f, [x1, x2], x0);
d = diff(f, x1);
jac = jacobian(f, [x1, x2]);
jac
ans = subs(jac(1), x1, 2);
ans

ans_matrix = subs(jac, [x1, x2], [2, 3]);
ans_matrix

H = hessian(f, [x1, x2]);
H

u = -50:10:50;
val_mat = []
fe = -50:10:50;
for i=1:length(u)
    for j=1:length(u)
        x0 = [u(i), u(j)];
        f_val = subs(f, [x1, x2], x0);
        fe(j) = double(f_val);
    end
    val_mat = [val_mat; fe];
    clear fe;
end
figure
surf(val_mat)
hold
contour(val_mat)