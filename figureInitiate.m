function figs = figureInitiate(userSettings)
    % Author: Christopher Miranda, Stanford University, Schnitzer Lab
    % Call once to initialize figure settings. Use figureControl.m to open
    % figures. 
    if nargin < 1 % If no input by user
        userSettings = [];
    end

    defaults.screens   = 1; % Number of screens to plot across
    defaults.cnt       = 1; % Used to incement figure internally
    defaults.rows      = .475; % Row position for 6 figures per screen
    defaults.cols      = .3;   % Column position for 6 figures per screen
    defaults.six       = [0, .5; .31 .5; .62 .5;...
        0, .03; .31 .03; .62 .03;]; % Figure origin positions. 
    defaults.figsGen   = 0; % Used to know how many figures have been generated
    defaults.size      = 'normal'; % Figure shapes: 'normal', 'long', 'tall', 'double','full'
    defaults.trackFigs = 0; % Store figures in figs?
    defaults.plot      = 1; % Set to zero to not plot. Useful for controlling plotting within other functions. 
    defaults.monitorArrangement = 'horizontal'; % Monitor arrangement: 'horizontal' or 'vertical'

    % Used to increment screen position for 6 screen option
    addScreenHorizontal = [1,0; 1,0; 1,0; 1,0; 1,0; 1,0]; % Add to x-coordinate for horizontal arrangement
    addScreenVertical = [0,-1; 0,-1; 0,-1; 0,-1; 0,-1; 0,-1];   % Add to y-coordinate for vertical arrangement
    
    % Copy all defaults into figs.
    figs = defaults;

    % Overwrite with user settings
    if ~isempty(userSettings) % If settings exist
        userFields = fieldnames(userSettings); % Get field names
        for i = 1:numel(userFields) % Increment through field names
            field = userFields{i};
            figs.(field) = userSettings.(field); % Replace defaults with user settings
        end
    end
    figs.matrix = figs.six; % Matrix used in figure plotting
    if figs.screens > 1 % If user has more than 1 screen
        % Select the appropriate screen increment based on monitor arrangement
        if strcmpi(figs.monitorArrangement, 'vertical')
            addScreen = addScreenVertical;
        else % Default to horizontal
            addScreen = addScreenHorizontal;
        end
        
        temp = figs.six+addScreen; % Temp value with incremented positions
        for i = 2 : figs.screens % Loop through all screens
            figs.matrix = [figs.matrix; temp]; % Concatenate matrix
            temp = temp+addScreen; % Adjust temp
        end
    end
end