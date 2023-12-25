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
chunkSize = 100;
sampleRate = 10; % Adjust the sample rate (samples per second) accordingly

% Initialize variables
allData = [];
totalSamples = 0;

% Read and plot data in real-time
try
    while ishandle(ax)
        % Read data from serial port
        newData = zeros(chunkSize, 1);
        for i = 1:chunkSize
            % Read and convert data from string to double
            newData(i) = str2double(readline(s));
        end

        % Concatenate new data to the existing data
        allData = [allData; newData];

        % Update the total number of samples
        totalSamples = totalSamples + chunkSize;

        % Plot all past data
        plot(ax, (1:totalSamples), allData);
        
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

