function [dx] = nBodyf(t,x,m,G)
% This is the function that the ode solver needs to solve the n-body problem
% Setting up things
n = length(m); % The number of bodies
dx = zeros(6*n,1); % Holder for the dx
half = 3*n;
% Creating the r matrix
% The idea employed here is that precomputing the repeated values of the
% radius magnitudes cubed saves computation later - and additionally the
% symmetry of the solution may be taken of advantage to reduce the number
% of computations used as well.
r = zeros(n,n);
for i = 1:n
for j = 1:n
if i == j || r(i,j) ~= 0
continue; % The radius between a body and itself is 0
else
    r(i,j) = (((x((3*(j-1))+1)-x((3*(i-1))+1)).^2+(x((3*(j-1))+2)-x((3*(i-1))+2)).^2+(x(3*j)-x(3*i)).^2).^(3/2));
    r(j,i) = r(i,j);
end
end
end

% Filling in the velocities
for i = 1:half
    dx(i) = x(half+i);
end
% Building the accelerations
for i = 1:n
    temp = 0; % resetting the holder
% building the x-component
    for j = 1:n
        if j == i
            continue; % The body has no gravitational effect on itself
        else
            temp = temp + (m(j)/(r(i,j)))*(x((3*(j-1))+1)-x((3*(i-1))+1));
        end
    end
end
temp = G*temp; % adjusting for the gravitational constant
dx(half+(3*(i-1))+1) = temp; % setting the dx
temp = 0; % resetting the temp holder
% building the y-component
for j = 1:n
    if j == i
        continue; % The body has no gravitational effect on itself
    else
        temp = temp + (m(j)/(r(i,j)))*(x((3*(j-1))+2)-x((3*(i-1))+2));
    end
end
temp = G*temp; % adjusting for the gravitational constant
dx(half+(3*(i-1))+2) = temp; % setting the dx
temp = 0; % resetting the temp holder
% building the z-component
for j = 1:n
    if j == i
        continue; % The body has no gravitational effect on itself
    else
        temp = temp + (m(j)/(r(i,j)))*(x(3*j)-x(3*i));
    end
end
temp = G*temp; % adjusting for the gravitational constant
dx(half+(3*i)) = temp; % setting the dx
end