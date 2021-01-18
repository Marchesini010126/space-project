%%%% rendenzvous time extimate

%---------------time constratits and other variables--------%
function rende(i)
load target.mat
ngg=5;                 %  number of maximum days that we impose for the catch up
tlim=60*60*24*ngg;     %  [s] the number of days in seconds
theta=pi;              %  [rad] angular distance between me and the object. (pi worst case scenario
mu=3.98*10^5;          %  [km^3/s^2] Gravitational constant
%---------------------------------------%

% the worst case scenario for the catch up is that the debris is exactly at
% pi radiants from me. In this case I can equally accelerate or decelerate

%-------------equations-----------------%

%   t_catch=theta/(omega_me-omega_target);

% we impose the time constarint so we will find the variation in semimajor
% axis needed

%  omega=2*pi/T_orbit;

%  omega_me=sqrt(mu/a_me^3)
%  omega_taget=sqrt(mu/a_target^3)

%  the semimajor axis requested:

%  a_me=(theta/tlim+mu/a_target^3)^-2*mu   

% dv requested for the manoeuvre:

%  dv=abs(sqrt(mu/a_me)-sqrt(mu/a_target))

% we evaluate it but it is already inside the initial code.
% in the starting code we assumed already to reach the final orbit with out
% taking the parking orbit into account
% and so we have dv already there.

% we assume that we wait in the parking orbit and we wait untill the catch
% up. The time limit will make the difference in the validity of the
% assumption. if we are too far apart from the object we can't say that the
% time needed to get in the same angular position is the on dt needed for
% the catch-up. This is because you need to descent this distance and it
% will take a while if your radial distance form the debris is 

%--------------------------------------%

 omega_target=2*pi/target.period(i)                %[rad/s]
 
 a_me=(((theta/tlim+omega_target)^-2)*mu)^(1/3)    %[Km]
 
 Da=ceil(a_me-target.semi(i))                      %[Km]
 
 dv_req=abs(sqrt(mu/a_me)-sqrt(mu/target.semi(i))) %[Km/s]

 acc_worst_case=300*10^-3/1200*10^-3;              %[km/s^2]
 
 
 dt_down=dv_req/acc_worst_case/60/60/24             %[min]
 
 mass_flow=10^-5;                                   %[Kg/s]
 
 total_time=dt_down+ngg                             %[s]
 
 %----------------------------------------%
 
 % is the mass of propellant negligible?
 %is the deltaV negligible?
 
 % we have the deorbit time of the spacecraft and then we are done
 
 %---fancy plot---------%
 
  omega_target=2*pi/target.period(i); 
  da=[1:0.1:400];                           %[km]
  omega_me=sqrt(mu./(target.semi(i)+da).^3);
  omega_me=sqrt(mu./(target.semi(i)-da).^3);
  t_catch_up=-theta./(omega_me-omega_target);
  t_catch_down=theta./(omega_target-omega_me);
  t_catch_up=t_catch_up/60/60/24;
  plot(da,t_catch_up)
  xlabel('radial distance (km)')
  ylabel('catch up time (days)')
  xlim([-70 400])
  axis equal
  hold on
  plot(Da,t_catch_up(da==Da),'*b','Linewidth',5);
  %this is only the catch up with the angular position. then you ad the
  %descent time (totla_time)
  
end
 
