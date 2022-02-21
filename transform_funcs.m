%% coordinate transforaming practice

peri2geo(30, 30, 23.5)
topo2geo(20, 10)

function peri2geo(OMEGA, omega, i)
% perifocal coordinate frame transform into geocentric coordinate frame 
R = [...
    (cos(OMEGA)*cos(omega) - sin(OMEGA)*sin(omega)*sin(i)), -cos(OMEGA)*sin(omega) - sin(OMEGA)*cos(omega)*cos(i), sin(OMEGA)*sin(i);...
    (cos(OMEGA)*cos(omega) + sin(OMEGA)*sin(omega)*sin(i)), -cos(OMEGA)*sin(omega) + sin(OMEGA)*cos(omega)*cos(i), -cos(OMEGA)*cos(i);...
    sin(omega)*sin(i), cos(omega)*sin(i), cos(i)...
    ];
disp(R)
end

function topo2geo(L, theta) 
% theta is also called 'sidereal'
% topocentric-horizon coordinate frame transform into geocentric coordinate
% frame
D = [...
    sin(L)*cos(theta), sin(L)*sin(theta), -cos(L);...
    -sin(theta), cos(theta), 0;...
    cos(L)*cos(theta), cos(L)*sin(theta), sin(L)...
    ];
disp(D)
end

