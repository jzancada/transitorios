% resuelve ecuacion diferencial
clear
close all


syms x(t) u(t)

% control
e(t) = x(t)

x_dot(t) = diff(x,t,1);
e_dot(t) = x_dot(t);
e2_dot(t) = diff(e_dot,t,1);

% escogemos lambdas
p=poly([-1,-1]*2)
lambda_0 = p(3);
lambda_1 = p(2);

u(t) = (-lambda_0*e(t)-lambda_1*e_dot(t))/10

cond1 = x(0) == 1
cond2 = x_dot(0) == 0

% resolucion
S = dsolve([diff(x,t,2) == 10*u], [cond1, cond2])

x_sol(t) = S;
e_sol(t) = subs(e,x,x_sol)
u_sol = subs(u,x,  x_sol)

figure
fplot(x_sol)
ylim([-2 2])
xlim([0 10])
title('x')

figure
fplot(e_sol)
ylim([-2 2])
xlim([0 10])
title('e')

figure
fplot(u_sol)
ylim([-2 2])
xlim([0 10])
title('u')
