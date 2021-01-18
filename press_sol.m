%we need a function to solve the pressure difference inside the bottle

%%%%%%boundary conditions for the problem%%%%
rho_w=998;          %[Kg/m^3]
p_atm=1.0135*10^5;    %[Pa]
p0=8* 1.0135*10^5;    %[Pa]
V0_w=0.412*10^-4 ;    %[m^3]
V0_bot=1.5*10^-3; %[m^3]
 
r1=4*10^-2 ;         %[m]
r_e=1*10^-2;
A1=r1^2*pi; 
A_e=r_e^2*pi;
veff_0= sqrt(2*(p0-p_atm)/rho_w*(1/(1-(A_e/A1)^2)));
h_cone=9*10^-2;          %[m]
V_cone=(1/3*pi*h_cone*(r1^2+r_e*r1*r_e^2));%[m^3]
V0_gas=V0_bot-V0_w;     %[m^3] % that is the volume remaining

%%% We need to find the initial area A to start with %%

if V0_w>=V_cone
    A0=A1;
else
   syms h
   d=-3*V0_w/pi;
   a=1/9;
   b=(-8/3+r_e^2);
   c=(16-1/3*r_e-4*r_e)
   C=[a b c d];
   [sol1 sol2 sol3]=roots(C);
end

   