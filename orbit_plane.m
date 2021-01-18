%%%ORBITAL PLANE

%%this script was design in order to obtain the orbital plane for a given
%%satellite. The problem we are dealing with is the resctrict two body
%%problem by Kepler. The planet considered is the earth.

clf
clc
clear all

% it is all in km

mu=3.986*10^11; %[m^3/s^2] gravitational constant
g0=9.81*10^-3;%[mm/s^2]
%initial condition
v0=[0 sqrt(mu/9000)+1000 0]'; %[m/s]
r0=[9000/sqrt(2) 0 9000/sqrt(2)]'; %[m]

c1=[1 0 0]';
c2=[0 1 0]';
c3=[0 0 1]';

%ivariant vectros

h=cross(r0,v0);%[m^2/s] momentum %column vector
h_ver=h/norm(h);
e=-r0/norm(r0)-cross(h,v0)/mu; %eccentricity vector
e_ver=e/norm(e);
ecc=norm(e); %value of the eccentricity
%%%we must find a way to include hyperbolas and 
p=norm(h)^2/mu;%semi_latum rettum %[km]

i=acos(h_ver'*c3); %rad inclination
omega=atan2((h'*c1),-(h'*c2)); % [rad]this 2*pi is useful in order to obtain the positive angle



a=norm(h)^2/mu/(1-ecc^2); %[m] semi-major axis
b=a*sqrt(1-ecc^2);%[m] semi-minor axis
N=[cos(omega) sin(omega) 0]'; %node direction

ni=N'*e_ver;% pericenter argument
if isnan(ni)
    ni=0;
end

% %plotting the plane of the orbit

% x=-max(r):mac(r);
% y=-max(r):max(r)
% [X,Y]=meshgrid(x,y);
% Z=-(h_ver(1)*X+h_ver(2)*Y)/h_ver(3);
% s=surf(X,Y,Z);
% map=[1 0 0];%sets the color for the picture
% colormap(map)
% alpha(s,0.4)
% hold on
% quiver3(0,0,0,50*h_ver(1),50*h_ver(2),50*h_ver(3),'r','Linewidth',5)
% quiver3(0,0,0,50*e_ver(1),50*e_ver(2),50*e_ver(3),'b','Linewidth',5)
% hold on
% quiver3(r0(1),r0(2),r0(3),v0(1),v0(2),v0(3))
% hold on
% quiver3(0,0,0,r0(1),r0(2),r0(3))

%%%ellipse figure on the 2-D plane

anomalia=[0:360];
r=p./(1+ecc*cosd(anomalia));

%parametric form of the ellipse. Extreemely useful

x=r.*cosd(anomalia);
y=r.*sind(anomalia);
z=zeros(1,length(x));
ELL=[x;y;z];

[I,map]=imread('matlab_earth.jpg');
[X,Y,Z]=sphere();
X=X*6371;
Y=Y*6371;
Z=Z*6371;
warp(X,Y,Z,I);
set(gca,'ZDir','reverse')





% rotation matrix (Rodriguez rotation)

A1=[cos(omega) -sin(omega) 0;sin(omega) cos(omega) 0;0 0 1];
N=A1*c1;% new x axis 
A2=cos(i)*eye(3)+sin(i)*skew(N)+(1-cos(i))*outproduct(N,N);%rotation arounthe axis N
c3_rot=A2*A1*c3;%new axis c3 after the two previous rotations
A3=cos(ni)*eye(3)+sin(ni)*skew(c3_rot)+(1-cos(ni))*outproduct(c3_rot,c3_rot);%rotation arounthe axis c3_rot
A=A3*A2*A1; %whole rotation matrix

%plane rotation

ELL_rot=A*ELL;
plot3(ELL_rot(1,:),ELL_rot(2,:),ELL_rot(3,:),'b','Linewidth',4);

%plot3(ELL(1,:),ELL(2,:),ELL(3,:),'r','Linewidth',4);%initial ellipse

xlabel('Km');
ylabel('Km');
zlabel('Km');

hold on

