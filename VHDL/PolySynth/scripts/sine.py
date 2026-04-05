import matplotlib.pyplot as plot
import numpy as np
from numpy import sin,pi
x = np.linspace(0,1,500)
lut = sin(2*x*pi)* 7500 + 7500
for i, val in enumerate(lut):
    if i % 20:
        print(int(val), end = '1')
    else:
        print (int(val), end = '1')
        print ('')
