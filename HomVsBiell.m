%   Hohmann transfer vs bielliptic transfer

%------------------------------------------%

% r1= frist small orbit
% r2= second big orbit
% r_t= transfer orbit

%------------------------------------------%

clf
close all
a=1:0.01:40;             % r2/r1
b=1:0.1:100;               % r_t/r1
[A,B]=meshgrid(a,b);

% Bi-elliptic transfer
dv_bi=sqrt(2).*(B-1)./sqrt(B.*(B+1))-(1./sqrt(A)+1)+sqrt(2).*(A+B)./sqrt(A.*B.*(B+A));

% Hohmann
dv_hoh=1./sqrt(A)-sqrt(2).*(1-A)./sqrt(A.*(A+1))-1;


plot(a,dv_hoh(1,:))
hold on
plot(a,dv_bi(478,:))




% 
% figure(1)
% c1=mesh(A,B,dv_bi)
% xlabel('alpha')
% ylabel('beta')
% zlabel("normalized dv")
% 
% figure(2)
% c2=mesh(A,B,dv_hoh)
% xlabel('alpha')
% ylabel('beta')
% zlabel("normalized dv")
% 
% figure(3)
% 
% c3=mesh(A,B,((dv_bi-dv_hoh)./dv_hoh)*100)
% xlabel('alpha')
% ylabel('beta')
% zlabel("normalized dv")
% 
% var=dv_bi-dv_hoh;
% 
% var(var<0)=NaN;
% 
% 
% 
% c4=mesh(A,B,var)
% xlabel('alpha')
% ylabel('beta')
% zlabel("normalized difference between hohmann and bi_el")
% 
% figure(4)
% syms a
% 
% dv_hoh=1./sqrt(a)-sqrt(2).*(1-a)./sqrt(a.*(a+1))-1;
% df=diff(dv_hoh,a);
% fplot(df,[1,200])
% df=matlabFunction(df);
% feval(df,6)
% 
% 
% b=fzero(df,11)