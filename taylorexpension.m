clc;
clear;
close all;
x=-3:.1:3;
y=exp(x);

figure,
plot(x,y,'r-','LineWidth',2);
xlabel('X')
ylabel('Y')
grid on; 
hold on

%% Taylor Series Expension

y_predict = zeros(size(y));
for n=0:N
    y_predict = y_predict+(x.^n)./factorial(n); 
end
hold on

tv_total = sum(y);
ev_total = sum(y_predict);
total_error = abs((tv_total-ev_total)/tv_total)*100;

N=1;
ev=0;
xx=1;
for n=0:N
    ev = ev+(xx^n)./factorial(n); 
end
tv=exp(xx);
err = (tv-ev)/tv*100;

msg = sprintf('Error = %f Total error = %f',err, total_error);
disp(msg)
% title(['Error = ',num2str(err),'%'])
title(msg)
plot(x,y_predict,'b--','LineWidth',2)
plot(xx,tv,'or','MarkerSize',10,'LineWidth',2)
plot(xx,ev,'og','MarkerSize',10,'LineWidth',2)

legend('True Value','Estimated Value')
