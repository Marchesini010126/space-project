% This script create the 2D isopential lines for a gravity fiel around one
% single massive body



clf
clear
close all
%-------PARAMETERS--------------------------------------------------------%

m1=10^24;         %[Kg]         first object mass
center_m1=[0,0];  %location of the mass in the plane

m2=10^26;               %[Kg]         first object mass
center_m2=[-11000,0]    %location of the mass in the plane


G=6.67*10^-20;    %[Km^3/Kg/s^2]  Universal gravitational constant

%-------------------------------------------------------------------------%

U_pot=-100000:2000:0;       %[J*10^-6] % the potential field where we change 
                       % the units in Km

r1= - U_pot / (m1*G);             %[Km] distance from the earth
r2= - U_pot / (m2*G);             %[Km] distance from the juppiter

theta=[0:0.01:2*pi+0.01]; %[rad] angular position in a cilindrical system

a=cos(theta);
b=sin(theta);

x1=outproduct(r1,a);    % take your time to understand at this point but ...
y2=outproduct(r1,b);    % it is just a smart move


x2=outproduct(r2,a);    % take your time to understand at this point but ...
y2=outproduct(r2,b);    % it is just a smart move

% the problem is now that I want to represent the isopotential lineas only
% and avoid drowing all the others. So I can invert this equation

% U=-m1*G/r1-m2*G/r2;

%then 

% r2=m2*G[1/(-U-m1*G/r1]);

% this are the r2 from the the second mass so that the potential is equal
% to U

U=-100000;
c=[-10000 0];

x=[-1000:10:1000];
y=[-1000:10:1000];

[X,Y]=meshgrid(x,y);

U=-m1*G./sqrt((X.^2+Y.^2))-m2*G./sqrt(((c(1)-X).^2+(c(2)-Y).^2));
x=1000
U=-m1*G./sqrt((X.^2+Y.^2))-m2*G./sqrt(((c(1)-X).^2+(c(2)-Y).^2));



c=mesh(X,Y,U)
axis equal




circle(0,0,0.01,'r')

%function created for designin a circle filled
function circles = circle(x,y,r,c)
hold on
th = 0:pi/50:2*pi;
x_circle = r * cos(th) + x;
y_circle = r * sin(th) + y;
circles = plot(x_circle, y_circle);
fill(x_circle, y_circle, c)
hold off
axis equal
end
    
    



