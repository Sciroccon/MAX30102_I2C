% Create a serial object
s = serial('/dev/ttyUSB0', 'BaudRate', 921600, 'Terminator', 'LF');
fopen(s);

% Number of samples to read in each iteration
numSamplesPerIteration = 32;

% Initialize array to store received data
receivedData = [];

% Continuous loop to read and plot data
while true
    % Read data from USART
    rawData = fread(s, numSamplesPerIteration, 'float32');

    % Append received data to the array
    receivedData = [receivedData, rawData];

    % Plot the received data
    plot(1:length(receivedData), receivedData, '-o');
    title('Received Data from Microcontroller (Float)');
    xlabel('Sample Index');
    ylabel('Received Value');
    drawnow;  % Update the plot

    % Pause for a short duration (adjust as needed)
    pause(0.5);
end

% Close the serial port (this won't be reached in the infinite loop)
fclose(s);
