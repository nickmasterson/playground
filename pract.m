% satellite simulation
disp('sim started')

%planet paramters
planet

% intital conditions
altitude = 254*1.6*1000; 
x0 = R + altitude;
y0 = 0;
z0 = 0;
xdot0 = 0;
inclination = 1; % radians
semi_major_axis = norm([x0;y0;z0]);
vcircular = sqrt(mu/semi_major_axis);
ydot0 = vcircular*cos(inclination);
zdot0 = -vcircular*sin(inclination);
stateinitial = [x0;y0;z0;xdot0;ydot0;zdot0];

%time window
period = 2*pi/sqrt(mu)*semi_major_axis^(3/2);
number_of_orbits = 1;
tspan = [0 period*number_of_orbits];

%integrate equations of motion
[tout, stateout] = ode45(@Satellite, tspan, stateinitial);

%convert state to km
stateout = stateout/1000;

%extract state vector
xout = stateout(:,1);
yout = stateout(:,2);
zout = stateout(:,3);

% make earth
[X, Y, Z] = sphere(100);
X = X*R/1000;
Y = Y*R/1000;
Z = Z*R/1000;

%plotstuff
fig=figure();
set(fig, 'color', 'white')
plot3(xout, yout,zout, 'b-', 'Linewidth', 2)
grid on 
hold on
surf(X, Y, Z, 'EdgeColor', 'none')
axis equal
