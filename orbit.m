%%%ORBIT FUNCTION

function dr_dtdt=orbit(t,XX);

%create a state vector with first order equation

x=XX(1);
y=XX(2);
z=XX(3);
vx=XX(4);
vy=XX(5);
vz=XX(6);

mu=4*10^14;

dvx_dt=-x.*mu/(x.^2+y.^2+z.^2)^(3/2);
dvy_dt=-y.*mu/(x.^2+y.^2+z.^2)^(3/2);
dvz_dt=-z.*mu/(x.^2+y.^2+z.^2)^(3/2);
dx_dt=vx;
dy_dt=vy;
dz_dt=vz;

dr_dtdt=[dx_dt dy_dt dz_dt dvx_dt dvy_dt dvz_dt]';
end