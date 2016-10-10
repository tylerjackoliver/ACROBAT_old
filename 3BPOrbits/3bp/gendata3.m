% Orbits in the Planar Three-Body Problem
%
% this M-file will generate the data necessary (data3.mat) for
% the figures, use figdata3.m to view the results
%
% the ode integrations may take some time,
% hence we will store the results of the ode
% calls in the file data3.mat. In particular there are the
% matrices T1,Y1,S and Z.

%-- Equations of Motion in Physical Coordinates

global m0 m1 m2 EE;
m0 = 5; m1 = 3; m2 = 4; 
x00 = [1;-1]; x10 = [1;3]; x20 = [-2;-1]; xp0 = [0;0];

%! attention: the following commands use some time. Notice that 
%! f is both given as a MEX file and a regular MATLAB function.
options= odeset('RelTol',1e-10,'AbsTol',1e-10);
tic;
[T1,Y1] = ode113('f', [0 63], [x00;xp0;x10;xp0;x20;xp0], options);
toc

%-- The Pythagorean Three-Body Problem

m0 = 5; m1 = 3; m2 = 4;
p10 = 0; q10 = 0; p20 = 0; q20 = 0;
x10 = 1.5594395315555318362;  x20 = 1.0087804965427521214;
y10 = 0.13280847188730666477; y20 = 1.1966000386838271256;
EE = -769/60;

%! Notice that the procedure threebp is given both as a MEX file
%! and a regular MATLAB file.
options= odeset('RelTol',1e-10,'AbsTol',1e-10);
tic;
[S,Z] = ode113('threebp', [0 8.26], ...
   [x10 x20 y10 y20 p10 p20 q10 q20 0],options);
toc
           
%-- save integration data to data3.mat

save data3.mat T1 Y1 S Z

