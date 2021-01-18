%%%% not forced rendezevous
load target.mat
%------------------------%

% We want to extimete the rendezevous time without forcing it to work
% and see the results. for each debris we evaluate the the differential
% semimajor axis

%------------------------------%


index= fliplr([1 2 3 4 5 6]);
semiax=zeros(size(index))
omega_me=zeros(size(index))

for i=1:length(index)
    semiax(i)=target.semi(index(i))
    omega_me(i)=2*pi./target.period(index(i));

end

da=diff(semiax)

%-----------------------%

% We have two different cases
% (1) you are above the target
% (2) you are under the target

%----you are above the target-----%
% you are slower then the target

for k=1:length(da)
   if da(k)<0   %ypu are above the target
       sprintf("you are above")
       time_rende(k)=-pi/(omega_me(k)-omega_me(k+1))/60/60/24
   elseif da(k)>0
       sprintf("you are under")
       time_rende(k)=-pi/(omega_me(k+1)-omega_me(k))/60/60/24
   end
   
end
sum(time_rende)
   
% ASSUMPTION

% you angular distance form the object in only pi as average distance








