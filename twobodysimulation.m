% this scripts simulates the two body motion using the function twobody3d %
%  ---------------------------------------------------------------------- %


clc
clear all
clf


m1=10^26;                                       %Kg
m2=10^29;                                       %Kg
t_span=[0 1000000];                                     %s
X0=[0 0 0 10 70 -30 3000000 0 0 0 40 0]';                %[Km] and [Km/s]
[t,STATE]=ode45(@(t,X)twobody3d(t,X,m1,m2),t_span ,X0);
xlim([min(min(STATE(:,1)),min(STATE(:,7))),max(max(STATE(:,1)),max(STATE(:,7)))])
ylim([min(min(STATE(:,2)),min(STATE(:,8))),max(max(STATE(:,2)),max(STATE(:,8)))])
zlim([min(min(STATE(:,3)),min(STATE(:,9))),max(max(STATE(:,3)),max(STATE(:,9)))])
hold on

casa=animatedline('Color','r','linewidth',3);
hold on %it is fundamental top take this value in "on " ...
        %so that the first handle is not deleted automatically
c4=animatedline('Color','k','linewidth',3);
hold on
view(70,18)
Rbar=zeros(length(STATE(:,1)),3);
for j=1:length(STATE(:,1))
    R1=[STATE(j,1),STATE(j,2),STATE(j,3)];
    R2=[STATE(j,7),STATE(j,8),STATE(j,9)];
    Rbar(j,:)=(R1*m1+R2*m2)/(m1+m2);
end
cbar=animatedline('Color','y','linewidth',3)
 hold on

for i=1:length(STATE(:,1))
    addpoints(casa,STATE(i,1),STATE(i,2),STATE(i,3))
    head1=scatter3(STATE(i,1),STATE(i,2),STATE(i,3),'filled');
    addpoints(c4,STATE(i,7),STATE(i,8),STATE(i,9))
    head2=scatter3(STATE(i,1),STATE(i,2),STATE(i,3),'filled');
    addpoints(c4,STATE(i,7),STATE(i,8),STATE(i,9))
    head3=scatter3(Rbar(i,1),Rbar(i,2),Rbar(i,3),'filled');
    drawnow
    delete(head1)
    delete(head2)
    delete(head3)

end


   

    


