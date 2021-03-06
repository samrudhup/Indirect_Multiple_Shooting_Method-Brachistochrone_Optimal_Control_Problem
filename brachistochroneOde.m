function pdot =brachistochroneOde(t,p,g,c)
%c=no of coefficients
n=length(c);
theta=polyval(c,t);

x=p(1);
y=p(2);
v=p(3);

xdot=v*sin(theta);
ydot=v*cos(theta);
vdot=g*cos(theta);

pdot=[xdot;ydot;vdot];
