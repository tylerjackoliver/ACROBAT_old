% This is a script that simulates two bodies of the same mass orbiting each
% other, with a third mass at the barycenter.
format long;
G = 6.673e-11; % Universal gravitation constant
m = [2 2 2]; % Setting the masses as 2 kg
time = [0 1087763]; % running for 1 period worth of seconds
x0 = [-1 0 0 1 0 0 0 0 0 0 -5.775e-6 0 0 5.775e-6 0 0 0 0];
% Starting positions and velocities
[t,x] = ode45(@nBodyf,time,x0,m,G);
figure();
hold on;
plot(x(:,1),x(:,2));
plot(x(:,4),x(:,5),'r');
plot(x(:,7),x(:,8),'*');