% Convert rectangular to polar in vector form
%% Parameters:
% 1 - The value in rectangular coordinates
% 2 - A binary value (true or false) if the angle is degrees or not
%% Solution:
% 1 - a = abs(rect)
% 2 - theta = angle(rect)
function pol = r2p(rect,return_deg)

    a = abs(rect);
    theta = angle(rect);
    if return_deg == true
        theta = r2d(theta);
    end
    pol = [a theta];
        
    
    
