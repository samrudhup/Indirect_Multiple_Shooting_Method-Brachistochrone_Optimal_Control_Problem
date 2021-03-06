function [Eineq,Eeq,t,p,theta] = brachistochroneError(z,g)

c=z(1:end-1); %coefficients of the polynomial
tf=z(end);    %Termianl time

x0=0;
y0=0;
v0=0;
p0=[x0;y0;v0];
xf=2;
yf=2;

tspan=[0,tf];
options=odeset('RelTol',1e-8);
[t,p]=ode113(@brachistochroneOde,tspan,p0,options,g,c);
theta=polyval(c,t);
xtf=p(end,1);
ytf=p(end,2);
vtf=p(end,3);
Eeq = [xtf-xf; ytf-yf];
Eineq=[];

