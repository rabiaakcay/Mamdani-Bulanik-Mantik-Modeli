%*********************************
%*Triangle Membership Function
function mu=triangle(x1,x2,x3,x)
%clear; clg; clc;
a=(x-x1)/(x2-x1);
b=(x3-x)/(x3-x2);
mu=max(min(a,b),0);
plot(x,mu);
xlabel('x kesin sayisi');
ylabel('Uyelik Derecesi');
grid
end
