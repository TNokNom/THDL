import matplotlib.pyplot as plot
import numpy as np

sample_rate = 44100
duration = 0.02  # seconds
t = np.linspace(0, duration, int(sample_rate * duration), endpoint=False)

frequency = 440  # A4
y = 2 * ((t * frequency) % 1) - 1   # sawtooth from -1 to 1

plot.plot(t, y)
plot.title("Sawtooth Wave at 440 Hz")
plot.show()
