% Date: 02.03.2021
% Author: Dr. Akhtar Jamil
clc;
clear;
close all;

x=-3:0.1:3;
f = @(x)exp(x);
y = f(x);

figure

plot(x,y,'r--','LineWidth',2);
xlabel('X')
ylabel('Y');

y_predict = zeros(size(y));

N=10;

for n=0:N
    y_predict = y_predict+ (x.^n)./factorial(n);
end

hold on
plot(x,y_predict,'b','LineWidth',2);
err = abs((y - y_predict)./y);
msg =sprintf('Error = %f',sum(err));
title(msg)
legend('True Value','Estimated Value')
grid



