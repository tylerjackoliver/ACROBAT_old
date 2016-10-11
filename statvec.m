function statvec,[ y, dydf ] = dydf_rhs( f, y, ep, mu );
%Function file for ER3BP numerical integration
%   Magical shit, yo

%% Initialise variables

global mu ep 

%% Set up first state matrix


r1 = y(1);
dr1 = y(2);
r2 = y(3);
dr2 = y(4);
theta1 = y(5);
dtheta1 = y(6);
theta2 = y(7);
dtheta2 = y(8);


%% Set up second d/df state matrix


dydf(1) = dr1;
dydf(2) = r1*dtheta1^2+2*r1*dtheta1+(1/(1+ep*cos(f)))*(r1(1-mu/r2^3)-(1-mu)/(r1^2)+mu*cos(theta1)*(1/(r2^3)));
dydf(3) = dr2;
dydf(4) = r2*dtheta2^2+2*r2*dtheta2+(1/(1+ep*cos(f)))*(r2*(1-(1-mu)/(r1^3))-mu/r2^2+(1-mu)*cos(theta2)*(1/(r1^3)));
dydf(5) = dtheta1;
dydf(6) = ((mu*sin(theta1)/(1+ep*cos(f)))*(1-(1/r2^3))-2*dr1*dtheta1-2*dr1)/r1;
dydf(7) = dtheta2;
dydf(8) = ((((1-mu)*sin(theta2))/(1+ep*cos(f))*((1/r1^3-1)-1)-2*dr2*dtheta2-2*dr2)/r2);


end