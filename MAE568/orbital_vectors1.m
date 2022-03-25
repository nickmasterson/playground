function [r, v] = orbital_vectors1(p, e, theta, OMEGA, omega, i)
% this function will return the position and velocity vectors of an orbit
% given the orbital elements
% Perifocal frame only
earth_radius = 6371000; % meters
mu_earth = 3.986004418e14; 
p = p*earth_radius; % ensure the input periapsis(p) had Earth-normalised units, otherwise this step is unecessary.
r_scalar = p / (1+e*cosd(theta));
r_pqw = [r_scalar*cosd(theta); r_scalar*sind(theta); 0];
v_pqw = sqrt(mu_earth/p).*[-sind(theta); (e+cosd(theta)); 0];
R = peri2geo(OMEGA, omega, i);
r = R*r_pqw;
v = R*v_pqw;
end