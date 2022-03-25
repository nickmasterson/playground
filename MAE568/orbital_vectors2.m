function [r, v] = orbital_vectors2(R_sez, radar_lat, radar_lon, thetag)
% this function will return the position and velocity vectors of an orbit
% given the orbital elements
% topocentric frame only
theta = radar_lon + thetag;
D = topo2geo(radar_lat, theta);
D = D.';
r = D * R_sez;
% no formula for 'v' yet 
end