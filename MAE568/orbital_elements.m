function [e, a, i, OMEGA, omega, theta, u0, l0, orbit_type] = orbital_elements(r, v)
% Function to determine orbital elements from r and v vectors 
mu_earth = 3.986e14; % m^3 / s^2
h = cross(r, v);
I = [1 0 0];
J = [0 1 0];
K = [0 0 1];
n = cross(K, h);
first_term = (norm(v)^2 - mu_earth/norm(r)).*r;
second_term = (dot(r, v)).*v;
evect = (first_term-second_term)./mu_earth;
e = norm(evect);
p = norm(h)^2 / mu_earth;
a = norm(p./(1-e^2));
i = acosd(dot(K,h)/norm(h));
if n(2) > 0
    OMEGA = acosd(dot(I, n) / norm(n));
else
    OMEGA = 360 - acosd(dot(I, n) / norm(n));
end
if evect(3) > 0
    t1 = dot(n, evect);
    t2 = norm(n)*e;
    t3 = t1 / t2;
    omega = acosd(t3);
else
    t1 = dot(n, evect);
    t2 = norm(n)*e;
    t3 = t1 / t2;
    omega = 360 - acosd(t3);
end
if dot(r, v) > 0
    term1 = dot(evect, r);
    term2 = e*norm(r);
    term3 = term1 / term2;
    theta = acosd(term3);
else
    term1 = dot(evect, r);
    term2 = e*norm(r);
    term3 = term1 / term2;
    theta = 360 - acosd(term3);
end

true_lon = omega + theta; 

if true_lon < 359.5
    u0 = true_lon;
else 
    u0 = 360 - true_lon;
end
    
true_lat = OMEGA + u0;
if true_lat < 359.5
    l0 = true_lat;
else
    l0 = 360-true_lat;
end

if e == 0
    orbit_type = 'circular';
elseif e < 1
    orbit_type = 'elliptical';
elseif e == 1
    orbit_type = 'parabolic';
elseif e > 1
    orbit_type = 'hyperbolic';
end
