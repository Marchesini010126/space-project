function A = outproduct(x,y)
%Outproduct for two  vectors. THE ORDER OF THE INPUT METTERS
% X=matrix one
%Y=matrix two

A=zeros(length(x),length(y));

for i=1:length(x)
    for j=1:length(y)
        A(i,j)=x(i)*y(j);
    end
end

        
end

