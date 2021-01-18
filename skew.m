function X = skew(x)
%create a skew symmetric matrix froma simple vector

%x=simple vector column or row


X=[0 -x(3) x(2);x(3) 0 -x(1);-x(2) x(1) 0];
  
end

