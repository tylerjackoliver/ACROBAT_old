% Viewing Orbits in the Planar Three-Body Problem

% Let's first load the data file which was generated 
% by gendata3.m

load 'data3.mat'

%-- Equations of Motion in Physical Coordinates

global m0 m1 m2 EE
m0 = 5; m1 = 3; m2 = 4; 
x00 = [1;-1]; x10 = [1;3]; x20 = [-2;-1]; xp0 = [0;0];

% the orbits over the whole time interval:
plot(Y1(:,1),Y1(:,2),'-',Y1(:,5),Y1(:,6),':', Y1(:,9),Y1(:,10),'-.')
title('The Orbits over the whole Interval');
pause

% the figures in the book
R1 = 1:1893;
plot(Y1(R1,1),Y1(R1,2),'-', ...
   Y1(R1,5),Y1(R1,6),':', Y1(R1,9),Y1(R1,10),'-.')
axis image
title('Figure 4.3');
pause

R2 = 1894:3605;
plot(Y1(R2,1),Y1(R2,2),'-', ...
   Y1(R2,5),Y1(R2,6),':', Y1(R2,9),Y1(R2,10),'-.')
axis image
title('Figure 4.4');
pause

R3 = 8440:10447;
plot(Y1(R3,1),Y1(R3,2),'-', ...
   Y1(R3,5),Y1(R3,6),':', Y1(R3,9),Y1(R3,10),'-.')
axis image
title('Figure 4.5');  
pause

[m,k] = min(diff(T1));
m
T1(k)
pause

%-- The Pythagorean Three-Body Problem

m0 = 5; m1 = 3; m2 = 4;
p10 = 0; q10 = 0; p20 = 0; q20 = 0;
x10 = 1.5594395315555318362;  x20 = 1.0087804965427521214;
y10 = 0.13280847188730666477; y20 = 1.1966000386838271256;
EE = -769/60;

size(Z)
Z(ans(1), ans(2))
x = Z(:,1)+i*Z(:,2);
y = Z(:,3)+i*Z(:,4);
X = (x.^2-y.^2).^2/4;
Y = (x.^2+y.^2).^2/4;
x0 = - (m1*X+m2*Y) / (m0+m1+m2);
x1 = x0 + X;
x2 = x0 + Y;
clf;
axis([-3.3361 3.4907 -4.9904 8.5989]);
hold on
[n,e]=size(x1);
for k=1:n-1,
   plot(x0(k:k+1),'r-','EraseMode','none');
   plot(x1(k:k+1),'g:','EraseMode','none');
   plot(x2(k:k+1),'b--','EraseMode','none');
   drawnow
end
hold off
pause

R = 820:1252;
plot(x0(R),'r-')
hold on
plot(x1(R),'g:')
plot(x2(R),'b-.')
axis image
hold off
title('Figure 4.6');
pause

R = 1252:1622;
plot(x0(R),'r-')
hold on
plot(x1(R),'g:')
plot(x2(R),'b-.')
axis image
hold off
title('Figure 4.8a');
pause

R = 1622:2156;
plot(x0(R),'r-')
hold on
plot(x1(R),'g:')
plot(x2(R),'b-.')
axis image
hold off
title('Figure 4.8b');
pause

R = 2116:2825;
plot(x0(R),'r-')
hold on
plot(x1(R),'g:')
plot(x2(R),'b-.')
axis([-3 3 -4 7])
axis image
hold off
title('Figure 4.9');
pause


T2=Z(:,9);
plot(T2, abs(X))
title('Figure 4.7a');
pause

plot(T2, abs(Y))
title('Figure 4.7b');
pause

[m,k]=min(abs(Y))
T2(k)
pause

xbar = Z(:,1)-i*Z(:,2);
ybar = Z(:,3)-i*Z(:,4);
p = Z(:,5)+i*Z(:,6);
q = Z(:,7)+i*Z(:,8);
P = (p ./ xbar - q ./ ybar) ./ (2*(xbar.^2 - ybar.^2));
Q = (p ./ xbar + q ./ ybar) ./ (2*(xbar.^2 + ybar.^2));
vx1 = P/m1;
vx2 = Q/m2;
vx0 = - (m1*vx1+m2*vx2)/m0;

[v,k]=max(abs(vx0))
[v,k]=max(abs(vx2))
abs(vx1(k))

% easier approximation for the velocities as quotients
% of the position and the time differences between two
% consecutive integration steps.
vx0 = abs(diff(x0)) ./ diff(T2);
vx1 = abs(diff(x1)) ./ diff(T2);
vx2 = abs(diff(x2)) ./ diff(T2);
[v,k0] = max(vx0)
[v,k2] = max(vx2)
T2(k2)
vx1(k2)

[m,k] = min(diff(T1));
R = k-200:k+200;
plot(Y1(R,1),Y1(R,2),'-', ...
     Y1(R,5),Y1(R,6),':',Y1(R,9),Y1(R,10),'-.')
hold on
plot(Y1(k,1), Y1(k,2), '+')
plot(Y1(k,9), Y1(k,10), '+')
axis([-0.60 -0.59 -0.33 -0.32])
hold off
title('Figure 4.10');
pause

[m,p]=max(diff(S));
m
Z(p,9)

[m,p]=min(diff(S(101:2600)));
m
Z(p+100,9)
pause

plot(diff(T1))
axis([0,11015,0,0.07])
pause

plot(diff(S))
axis([0,2767,0,0.03])

[n,e]=size(Z);
for k=1:n, KK(k) = K(Z(k,1:8)); end;
norm(KK,inf)




