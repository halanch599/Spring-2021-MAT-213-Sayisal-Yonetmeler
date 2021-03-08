%% Initialization
clear;
clc;
close all;

% Bisection Initialization
f = @(x)2*x + x.^3 - 15;
xl=-3;
xu=3;

N = 100;
es = 0.0000001;

x = xl:0.1:xu;
y = f(x);
figure(1),
plot(x,y);
grid on
if(f(xl) * f(xu)>0)
    disp('Error: Root cannot be obtained.');
    return;
end

i=0;

while(i<=N)
    %find mid point between xl and xu
    m =  (xl+xu)/2;
    %find error
    ea = abs((xl - m)/xl)*100;
    
    if(f(xl)*f(m)<0)
        xu=m;
    else
        xl=m;
    end
    
    i= i+1;
    msg = sprintf('Iter = %d, Estimation = %f, Error = %f',i,m,ea);
    disp(msg);
    
    figure(1)
    plot(x,y,m,f(m),'o');
    title(msg)
    xlabel('X Values')
    ylabel('f(x)')
    grid on
    pause(0.7);
    % stopping criteria
    if (ea<es)
        break;
    end
end












