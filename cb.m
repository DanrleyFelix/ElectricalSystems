% Base changing
%% Parameters:
% 1 - Old value for voltage
% 2 - Old value for power
% 3 - Old value for impedance
% 4 - New value for voltage
% 5 - New value for power

% Solution: z_new = z_old*((v_old/v_new)^2)*(s_new/s_old);

function z_new = cb(v_old,s_old,z_old,v_new,s_new)

    z_new = z_old*((v_old/v_new)^2)*(s_new/s_old);
    
    
