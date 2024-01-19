import numpy as np
from scipy.signal import butter, sosfreqz, sos2tf, freqz
import matplotlib.pyplot as plt

def butter_bandpass(lowcut, highcut, fs, order=1):
    nyquist = 0.5 * fs
    low = lowcut / nyquist
    high = highcut / nyquist
    sos = butter(order, [low, high], btype='band', output='sos')
    return sos

def plot_frequency_response(sos, fs):
    w, h = freqz(*sos.T, fs=fs)
    magnitude = 20 * np.log10(np.abs(h))
    phase = np.angle(h, deg=True)

    plt.figure(figsize=(10, 6))

    plt.subplot(2, 1, 1)
    plt.plot(w, magnitude, 'b')
    plt.title('IIR Bandpass Filter Frequency Response')
    plt.xlabel('Frequency [Hz]')
    plt.ylabel('Gain [dB]')
    plt.grid()

    plt.subplot(2, 1, 2)
    plt.plot(w, phase, 'b')
    plt.xlabel('Frequency [Hz]')
    plt.ylabel('Phase [degrees]')
    plt.grid()

    plt.tight_layout()
    plt.show()

# Define filter specifications
lowcut = 0.67  # Lower cutoff frequency in Hz
highcut = 8.0  # Upper cutoff frequency in Hz
fs = 50.0  # Sampling frequency in Hz
order = 1  # Filter order (first-order)

# Design the bandpass filter
sos = butter_bandpass(lowcut, highcut, fs, order)

# Display filter coefficients
print("Filter Coefficients (Second-Order Sections):\n", sos)

# Plot frequency response
plot_frequency_response(sos, fs)
