%Aly Khater

clc;
clear;
close all;

x=linspace(0,1,30)';
w=0.1*sin(10*[1:30].^3)';
y = 2*x.^2-3*x+1+w;



%Find a line of the form y = ax^2+bx+c

u = [x.^2,x,ones(30,1)]\y;
%iterated from the code provided on page 46 of the book
a=u(1), b=u(2), c=u(3)
plot(x,y,'*')
hold on
plot(x,a*x.^2+b*x+c,'--','LineWidth',2)

%a = 1.6387
%b = -2.5850
%c = 0.9108