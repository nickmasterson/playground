function [r, v] = orbital_vectors(p, e, theta)
% this function will return the position and velocity vectors of an orbit
% given the orbital elements
earth_radius = 6371000; % meters
mu_earth = 3.986004418e14; 
p = p*earth_radius; % ensure the input periapsis had Earth-normalised units, otherwise this step is unecessary.
r_scalar = p / (1+e*cosd(theta));
r = [r_scalar*cosd(theta) r_scalar*sind(theta)];
v = sqrt(mu_earth/p).*[-sind(theta) (e+cosd(theta))];
end