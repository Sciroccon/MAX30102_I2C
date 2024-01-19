% Create a serialport object
s = serialport('/dev/ttyUSB0', 921600); % Adjust baud rate accordingly

% Create a figure and axis for plotting
figure;
ax = axes;

% Set up plot properties
xlabel('Sample Index');
ylabel('Data');
title('Real-time Data Plot');

% Define the number of samples to read at a time
chunkSize = 200;
sampleRate = 10; % Adjust the sample rate (samples per second) accordingly

% Buffer size for storing the entire history
bufferSize = 1000;
dataBuffer = zeros(bufferSize, 1);

% Fixed Y-axis range for better visualization of variations
yAxisRange = 1000;  % Set this based on your preference

% Initialize plot with NaN values
plotHandle = plot(ax, NaN, NaN);

% Read and plot data in real-time
try
    while ishandle(ax)
        % Read data from serial port
        newData = zeros(chunkSize, 1);
        for i = 1:chunkSize
            % Read and convert data from string to double
            newData(i) = str2double(readline(s));
        end

        % Shift the existing data in the buffer
        dataBuffer = circshift(dataBuffer, -chunkSize);
        
        % Update buffer with new data
        dataBuffer(end - chunkSize + 1:end) = newData;

        % Plot all past data as rounded integers
        set(plotHandle, 'XData', 1:bufferSize, 'YData', round(dataBuffer));

        % Set Y-axis limits to show variations within the specified range
        currentMax = max(dataBuffer);
        currentMin = max(0, currentMax - yAxisRange);
        ylim(ax, [currentMin, currentMax]);

        % Set X-axis limits to show all samples
        xlim(ax, [1, bufferSize]);

        % Update the plot
        drawnow;
    end
catch
    % Clear the serial port connection when done or in case of an error
    closePort(s);
    disp('Serial port closed.');
end

% Function to close the serial port
function closePort(s)
    fclose(s);
    delete(s);
    clear s;
end

