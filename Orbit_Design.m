clear
clc
clf
inc=[0 9371000 0 6533.37 790  2000];
t_span=[0 10000]
[t,y]=ode45(@(t,XX)orbit(t,XX),t_span,inc);
plot3(y(:,1),y(:,2),y(:,3))
hold on
[I,map]=imread('matlab_earth.jpg');
[X,Y,Z]=sphere();
X=X*6371000;
Y=Y*6371000;
Z=Z*6371000;
warp(X,Y,Z,I);
set(gca,'ZDir','reverse')
grid on
hold on
quiver3(y(1:3:end,1),y(1:3:end,2),y(1:3:end,3),y(1:3:end,4),y(1:3:end,5),y(1:3:end,6),'Linewidth',3);
rotate(earth, [0 0 1],1) % test to see if it's working


%%%rotazione a cazo per  sperimetare

%x.^2/400+4*y.^2/900=20;
%%
x=-100:100;
y=-100:100;
y_up=real(+sqrt((20-x.^2./400).*900));
y_down=real(-sqrt((20-x.^2./400).*900));




