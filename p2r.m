% Convert polar to rectangular
%% Parameters:
% 1 - The vector in polar coordinates:
% 1.1 - Absolute value
% 1.2 - Phase
% 2 - A binary value (true or false) indicating if the phase is degrees or not
%% Solution:
% 1 - x = polar(1)*cos(theta);
% 2 - y = polar(1)*sin(theta)

function rect = p2r(polar,is_deg)
    
    if is_deg == true
        theta = d2r(polar(2));
    else
        theta = polar(2);
    end
    x = polar(1)*cos(theta);
    y = polar(1)*sin(theta);

    rect = x+(y*1j);
        