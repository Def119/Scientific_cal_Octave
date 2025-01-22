function calculator()
    % Create a figure window for the calculator
    fig = figure('Name', 'Scientific Calculator', ...
                 'NumberTitle', 'off', ...
                 'Position', [500, 100, 400, 600]);

    % Create a text box for the display
    displayBox = uicontrol('Style', 'edit', ...
                           'Position', [20, 640, 270, 40], ...
                           'FontSize', 12, ...
                           'HorizontalAlignment', 'right', ...
                           'String', '0'), ...
                           'BackgroundColor', [.17, .18, .24], ...
                           'ForegroundColor', [.17, .18, .24];

    % Button properties
    buttonWidth = 60;
    buttonHeight = 40;
    buttonSpacing = 10;
    buttonXStart = 20;
    buttonYStart = 480;
  % Define colors for different types of buttons
    numColor = [0.8, 0.8, 1];       % Light blue for numbers
    opColor = [1, 0.6, 0.6];        % Light red for operators
    funcColor = [0.6, 1, 0.6];      % Light green for functions

    % Layout for buttons
    buttons = {
        '7', '8', '9', '/', 'Ans'
        '4', '5', '6', '*', 'cos'
        '1', '2', '3', '-', 'tan'
        '0', '.', '=', '+', 's'
        'sin', 'cos', 'tan', 'Deg', 'del'
        '(', ')', 'C', 'CE', 'del'
    };

    % Create buttons
    for i = 1:size(buttons, 1)
        for j = 1:size(buttons, 2)
            bgColor = funcColor; % Function buttons
            uicontrol('Style', 'pushbutton', ...
                      'String', buttons{i, j}, ...
                      'Position', [buttonXStart + (j-1)*(buttonWidth + buttonSpacing), ...
                                   buttonYStart - (i-1)*(buttonHeight + buttonSpacing), ...
                                   buttonWidth, buttonHeight], ...
                      'FontSize', 12, ...
                      'BackgroundColor', bgColor, ...
                      'Callback', @(src, event)button_callback(buttons{i, j}, displayBox));
        end
    end
end

function button_callback(button, displayBox)
    % Callback function for buttons
    currentText = get(displayBox, 'String');
    switch button
        case '='
            % Evaluate the expression in the display
            try
                result = eval(currentText);
                set(displayBox, 'String', num2str(result));
            catch
                set(displayBox, 'String', 'Error');
            end
        case 'C'
            % Clear the display
            set(displayBox, 'String', '0');
        case 'CE'
            % Remove the last character from the display
            if length(currentText) > 1
                set(displayBox, 'String', currentText(1:end-1));
            else
                set(displayBox, 'String', '0');
            end
        case 'Deg'
            if strcmp(currentText, '0')
                newText = '!! insert trig. func. first !!';
            else
                % Extract the last 3 characters of the current text
                lastThreeChars = currentText(max(1, end-2):end);

                % Check if it matches any trig function
                if any(strcmp(lastThreeChars, {'sin', 'cos', 'tan'}))
                    newText = [currentText, 'd']; % Append 'd' to switch to degree mode
                else
                    newText = '!! switch to deg after trig. func. is inserted !!';
                end
            end
            set(displayBox, 'String', newText);
        otherwise
            % Append the button's text to the display
            if strcmp(currentText, '0')
                newText = button;
            else
                newText = [currentText, button];
            end
            set(displayBox, 'String', newText);
    end
end

