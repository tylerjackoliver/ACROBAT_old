% FUNCTION FILE FOR ER3BP COMPUTATION

%% Initialise variables + integration options

global mu ep distscale theta_l theta_u h_l h_u req sma f maxt
% Unused variables -  r1 r2 theta1 theta mp1 mp2

options = odeset('RelTol',1e-8,'AbsTol',1e-9, 'Events', @eventfunction);

%% Variable computation

% mp1 = 123;  % mass of larger primary
% mp2 = 456;  % mass of smaller primary
mu = 3.226e-006; % mass ratio, check this
ep = 0.0934; % try and grab this from ephemeris too
distscale = 229.4e+006; % S-Mars distance
req = 3397; % Mars equatorial radius
sma = 1.523688;
f = 0; % Initial true anomaly
maxt = 50000;
%% Grab spatial information from ephemeris

xm = 1 - mu;
ym = 0;
rm = (xm^2+ym^2)^0.5;
if xm > 0 && ym > 0,
    thetam = atan(ym/xm);
elif xm > 0 && ym < 0:
    thetam = -atan(ym/xm);
elif xm < 0 && ym > 0:
    thetam = pi-atan(ym/xm);
elif xm < 0 && ym < 0:
    thetam = pi+atan(ym/xm);
end
y = zeros(8, 1, 'uint32');
f = 0;

%% Non-dimensionalise variables

SMdist = 1; %% Fetch this from ephemeris
distCoeff = 1/(SMdist);
SMtime = 2*pi; % Make orbital period of larger primaries equal to 2pi
timeCoeff = 2*pi/(686.980*24*60*60); % Taking sidereal orbit period

    
%% Initial values

for e = 0.95:0.01:0.99
    for i = 1:1:10
        for j = 1:1:10
            h_i = h_l + (i-1)*(h_u-h_l)/(10-1);
            theta_j = theta_l + (j-1)*(theta_u - theta_l)/(10-1);
            r_i  = (req+h_i)/(distscale);
            y(3) = r_i; % r2
            y(7) = theta_j; % theta2
            y(4) = -r_i*ep*sin(f)/(1+ep*cos(f)); %r2'
            y(8) = (((mu)*(1+e))/(r_i^3*(1+ep*cos(f))))^0.5-1; % theta2'
            y(1) = (r_i^2+2*r_i*cos(theta_j)+1)^0.5; % r1
            y(5) = atan((r_i1*sin(theta_j))/((1+r_i*cos(theta_j)))); %theta1
            y(2) = y(4)*cos(theta_j-y(5))-y(3)*y(8)*sin(theta_j-y(5)); %dr1
            y(6) = y(4)/y(1)*sin(theta_j - y(5))+y(3)*y(8)/y(1)*cos(theta_j-y(5)); %theta1'
            [Y , dydf, te, ye, ie] = ode45(@statvec, y, input_args); % Integration + options for termination              
        end
    end
end

%% Plot data in Polar coordinates
