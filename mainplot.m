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
sampleRate = 100; % Adst the sample rate (samples per second) accordingly

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

        % Set X-axis limits to show all samples
        xlim(ax, [1, totalSamples]);

        % Dynamically adjust Y-axis limits based on current data
        currentMax = max(allData);
        currentMin = min(allData);
        ylim(ax, [currentMin, currentMax]);

        % Plot all past data
        plot(ax, (1:totalSamples), allData);
        
        % Add a horizontal line at the 0 point on the x-axis
        yline(ax, 0, 'k--'); % 'k--' specifies a black dashed line
        
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
