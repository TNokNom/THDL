import numpy as np
import matplotlib.pyplot as plt

sample_rate = 44100
duration = 0.02
t = np.linspace(0, duration, int(sample_rate * duration), endpoint=False)

base_freq = 440  # 8' reference

octaves = {
    "16'": base_freq * 0.5,
    "8'": base_freq * 1.0,
    "4'": base_freq * 2.0,
    "2'": base_freq * 4.0
}

for label, freq in octaves.items():
    y = (t * freq) % 1   # range now 0 → 1

    plt.figure()
    plt.plot(t, y)
    plt.title(f"Sawtooth Wave - {label} Octave ({freq} Hz)")
    plt.xlabel("Time (seconds)")
    plt.ylabel("Amplitude (0 to 1)")
    plt.show()
