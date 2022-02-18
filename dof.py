# screwy dof
import numpy as np
from scipy import integrate
import matplotlib.pyplot as plt
# ------------------------------
# inputs
m = 1  # mass
L = 1  # length
b = 0  # damper
g = 9.81  # gravity
dt = 0.02  # time step
tmax = 10  # max sim time
theta1_0 = np.pi/2  # radians
theta2_0 = 0  # initial angular velocity, radians/sec
theta_init = (theta1_0, theta2_0)
# get time steps
t = np.linspace(0, tmax, int(tmax/dt))
# ----------------------------------------


def int_pendulum_sim(theta_init, t, L=1, m=1,b=0, g = 9.81):
    theta_dot_1 = theta_init[1]
    theta_dot_2 = -b/m*theta_init[1] - g/L*np.sin(theta_init[0])

    return theta_dot_1, theta_dot_2


theta_vals_int = integrate.odeint(int_pendulum_sim, theta_init, t)
plt.plot(t, theta_vals_int)
plt.xlabel('Time (s)'), plt.ylabel('Magnitude')
plt.legend(['Position', 'Angular Velocity'])
plt.show()

