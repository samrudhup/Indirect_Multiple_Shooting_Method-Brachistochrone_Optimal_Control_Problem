close all;
clear all;
clc;
g=10;
n=1; %degree fo the polynomial used to parameterize the control
tfmin=0;
tfmax=100;
zmin=[-50*ones(n+1,1);tfmin];
zmax=[+50*ones(n+1,1);tfmax];
cguess=zeros(n+1,1);
cguess(1,1)=0.2;
cguess(2,1) = 0.2;
tfguess=2;
zguess=[cguess;tfguess];
A=[];
B=[];
Aeq=[];
Beq=[];

options = optimset('Display','Iter','TolX',1e-8,'TolFun',1e-8);
z=fmincon(@brachistochroneObj,zguess,A,B,Aeq,Beq,zmin,zmax,@brachistochroneError,options,g);
[Eineq,E,t,p,theta] = brachistochroneError(z,g);
figure(1)
plot(t,p);
ylabel('States');
xlabel('time');
legend('x','y','v')
figure(2)
plot(t,theta);
ylabel('Control Angle Theta');
xlabel('Time');
