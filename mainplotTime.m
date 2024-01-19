s = serialport('/dev/ttyUSB0', 921600); % Adjust baud rate accordingly

% Create a figure and axis for plotting
figure;
ax = axes;

% Set up plot properties
xlabel('Time (seconds)');
ylabel('Data');
title('Real-time Data Plot');

% Define the number of samples to read at a time
chunkSize = 20; 
sampleRate = 100; % Adjust the sample rate (samples per second) accordingly

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

        % Calculate the time corresponding to each sample
        time = (1:totalSamples) / sampleRate;

        % Set X-axis limits to show all samples
        xlim(ax, [time(1), time(end)]);

        % Dynamically adjust Y-axis limits based on current data
        currentMax = max(allData);
        currentMin = min(allData);
        
        % Set Y-axis limits with some buffer to accommodate the horizontal line
        buffer = 0.1 * max(abs(currentMin), abs(currentMax));
        ylim(ax, [currentMin - buffer, currentMax + buffer]);

        % Plot all past data against time
        plot(ax, time, allData);
        
        % Draw a horizontal line at y=0
        line(ax, [time(1), time(end)], [0, 0], 'Color', 'r', 'LineStyle', '--');
        
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

