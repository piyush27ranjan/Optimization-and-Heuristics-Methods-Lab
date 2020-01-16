t = 0:0.1:6*pi;
x = sqrt(t).*sin(2*t);
y = sqrt(t).*cos(2*t);
z = t.^2;
plot3(x, y, z, 'k', 'linewidth', 1)
grid on
