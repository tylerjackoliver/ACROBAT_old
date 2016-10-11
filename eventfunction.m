function [value,isterminal,direction] = eventfunction(y,f,mu,ep)
%UEvent function for 3BP
%   Contains the stopping criteria for the ODE integration:
%Locate a time at which any of the following criteria are met:
% a) The S/C's Kepler Energy changes from < 0 to 0 >
% b) The S/C enters a disc of radius < r_eq
% c) The S/C exceeds its integration time.

value = [y(1)-1e-005, y(3)-1e-005, 0.5*y(4)-mu/(y(3)*(1+ep*cos(f)))]; % Detect radii or Kepler energy
isterminal = [1, 1, 1];   % Stops the integration when conditions are met
direction = [-1, -1, 1];   % Prescribes direction of stopping conditions


end

