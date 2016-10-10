function dydf[ r, theta ] = dydf_rhs( f, y );
%Function file for ER3BP numerical integration
%   Magical shit, yo

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
dydf(2) = r1*dtheta1^2+2*r1*dtheta1+(1/(1+epcos(f)))*(r1(1-mu/r2^3)-(1-mu)/(r1^2)+mu*cos(theta1)*(1/(r2^3)));



end