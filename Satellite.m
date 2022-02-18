function dstatedt = Satellite(t, state)

%stateinitial = [x0;y0;z0;xdot0;ydot0;zdot0];
%x = state(1);
%y = state(2);
%z = state(3);
%xdot = state(4);
%ydot = state(5);
%zdot = state(6);

%inertia and mass
m = 2.6; % kg
%kinematics
vel=state(4:6);
%gravity model
planet
r = state(1:3); % r=[x;y;z]
rnorm = norm(r);
rhat = r / rnorm;
Fgrav = -(G*M*m/rnorm^2)*rhat;
%dynamics
F = Fgrav;
accel = F/m;
%return derivatives vector
dstatedt = [vel;accel];
end
