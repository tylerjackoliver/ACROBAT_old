    function [value,isterminal,direction] = eventfunction(f, y_init)
    %UEvent function for 3BP
    %   Contains the stopping criteria for the ODE integration:
    %Locate a time at which any of the following criteria are met:
    % a) The S/C's Kepler Energy changes from < 0 to 0 >
    % b) The S/C enters a disc of radius < r_eq
    % c) The S/C exceeds its integration time.

    global mu ep

    mu = 3.226e-006;
    ep = 0.096;


    value = [y_init(1)-1e-005, y_init(3)-1e-005, 0.5*y_init(4)-mu/(y_init(3)*(1+ep*cos(f))), y_init(7)-y_init(7,1)]; % Detect radii or Kepler energy
    isterminal = [1, 1, 1, 0];   % Stops the integration when conditions are met EXCEPT for theta2
    direction = [-1, -1, 1, 1];   % Prescribes direction of stopping conditions


    end

