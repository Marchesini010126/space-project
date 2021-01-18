%  This simulations simulates the two body motion in the in free space
%  -------------------------------------------------------------------

function dX_dt=twobody3d(t,X,m1,m2)

%------------ State vector definition -----------------------%

% this is the structure of the state vector

%FIRST MASS POITION END SPEED

x1 =X(1);
y1 =X(2);
z1 =X(3);
vx1=X(4);
vy1=X(5);
vz1=X(6);


%SECOND MASS POITION END SPEED

x2 =X(7);
y2 =X(8);
z2 =X(9);
vx2=X(10);
vy2=X(11);
vz2=X(12);

%-----------universal gravitational constant------------------%

G=6.67e-20 ;  %[km^3/Kg/s^2]

%-------------------------------------------------------------%

R1=[x1 y1 z1];
R2=[x2 y2 z2];

Rmod=norm(R1-R2);


%force acting on the fisrt mass

dvx1_dt=-((x1-x2)./Rmod.^3)*G*m2;
dvy1_dt=-((y1-y2)./Rmod.^3)*G*m2;
dvz1_dt=-((z1-z2)./Rmod.^3)*G*m2;

%force acting on the second mass

dvx2_dt=-((x2-x1)./Rmod.^3)*G*m1;
dvy2_dt=-((y2-y1)./Rmod.^3)*G*m1;
dvz2_dt=-((z2-z1)./Rmod.^3)*G*m1;

%position of the first mass

dx1_dt=vx1;
dy1_dt=vy1;
dz1_dt=vz1;

%position of the second mass

dx2_dt=vx2;
dy2_dt=vy2;
dz2_dt=vz2;

dX_dt=[dx1_dt dy1_dt  dz1_dt    ...
       dvx1_dt dvy1_dt  dvz1_dt ...
       dx2_dt dy2_dt dz2_dt     ...
       dvx2_dt dvy2_dt  dvz2_dt]';
end






