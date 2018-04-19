% Copyright 2012 Borja Fons Albert, H�ctor Usach Molina, Joan Vila Carb�.
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are
% met:
% 
%  1. Redistributions of source code must retain the above copyright
%     notice, this list of conditions and the following disclaimer.
% 
%  2. Redistributions in binary form must reproduce the above copyright
%     notice, this list of conditions and the following disclaimer in the
%     documentation and/or other materials provided with the distribution.
% 
% THIS SOFTWARE IS PROVIDED BY BORJA FONS ALBERT, H�CTOR USACH MOLINA AND
% JOAN VILA CARB� ''AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES,
% INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
% AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
% BORJA FONS ALBERT, H�CTOR USACH MOLINA AND JOAN VILA CARB� OR
% CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
% EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
% PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
% PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
% LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
% NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
% SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
% 
% The views and conclusions contained in the software and documentation are
% those of the authors and should not be interpreted as representing
% official policies, either expressed or implied, of Borja Fons Albert,
% H�ctor Usach Molina and Joan Vila Carb�.


% CESSNA C-172 MODEL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global S b c_bar D_prop g m I_xx I_yy I_zz I_xz elevators_min ailerons_min rudder_max

% Reference Geometry & Mass Data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S      = 174;  % Wing area (ft^2)
b      = 35.8; % Wingspan (ft)
c_bar  = 4.9;  % Mean chord (ft)
D_prop = 6.25; % 75-inch Two-Blade Propeller (ft)

g    = 32.2;   % Gravedad (ft/s^2)
% m    = 2650/g; % Mass (lbs)
I_xx = 948;    % Moment of Inertia (lbf�ft�s^2)
I_yy = 1346;   % Moment of Inertia (lbf�ft�s^2)
I_zz = 1967;   % Moment of Inertia (lbf�ft�s^2)
I_xz = 0;      % Product of Inertia (lbf�ft�s^2)

m_oew  = 743.4;    % Operation Empty Weight (kg)
m_pl   = 135.17;   % Payload (kg)
m_fuel = 71;       % Fuel Weight (kg)
MTOW   = 1156;     % Maximum Take-Off Weight (kg)
if (m_oew + m_pl + m_fuel) > MTOW
    m_fuel = MTOW - m_oew - m_pl;
    fprintf('MTOW Limit\n')
end
m = (m_oew + m_pl + m_fuel)*2.20462/g;  % Mass (kg to lbs)

% Control surfaces deflection %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

elevators_min = 28*0.0175; % M�nima deflexi�n del elevador (rad)
elevators_max = 24*0.0175; % M�xima deflexi�n del elevador (rad)
ailerons_max  = 15*0.0175; % M�xima deflexi�n del aler�n (rad)
ailerons_min  = 20*0.0175; % M�nima deflexi�n del aler�n (rad)
rudder_max    = 17*0.0175; % M�xima deflexi�n del tim�n (rad)
flaps_max     = 30;        % N�xima deflexi�n de los flaps (deg)