function calculator()
    % window of the calculator
    fig = figure('Name', 'Scientific Calculator', ...
                 'NumberTitle', 'off', ...
                 'Position', [400, 0, 515, 380], ...
                 'Color',[.17, .18, .24])
                 ;

    % display box
    displayBox = uicontrol('Style', 'edit', ...
                           'Position', [20, 305, 480, 50], ...
                           'FontSize', 18, ...
                           'HorizontalAlignment', 'right', ...
                           'String', '0', ...
                           'BackgroundColor', [0.54,0.71,0.935], ...
                           'ForegroundColor', [1,1,1]);

    % Button properties/postions
    buttonWidth = 60;
    buttonHeight = 40;
    buttonSpacing = 10;
    buttonXStart = 20;
    buttonYStart = 240;

  % colors for different types of buttons
    numColor = [0.8, 0.8, 1];       % Light blue for numbers
    opColor = [1, 0.38, 0.59];        % Light red for operators
    funcColor = [0.6, 1, 0.6];      % Light green for functions
    greyColor = [0.172,0.188,0.24]
    white = [1,1,1]
    lightGrey = [0.2,0.2,0.22]
    lightblue = [0.65,0.78,0.98]
    blue = [0.54,0.71,0.935]
    darkblue=[0.185,0.27,0.64]
    blue2=[0.23,0.55,0.86]
    black = [0,0,0]
    b2=[0.141,0.141,0.265]
    fontColor = white

    %BUtton layout
    buttons = {
        ',','[','7', '8', '9', '/', 'Ans'
        ';',']','4', '5', '6', '*', 'sin'
        'fac','(','1', '2', '3', '-', 'cos'
        'Inv',')','0', '.', '=', '+', 'tan'
         '&','e','π','C', 'CE','^' 'Deg'

    };

    % buttons
    for i = 1:size(buttons, 1)
        for j = 1:size(buttons, 2)
            bgColor='red'
            if ismember(buttons{i,j},{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'})
              bgColor=greyColor;
              fontColor=white;
            elseif ismember(buttons{i,j}, {'+', '-', '*', '/', '(', ')','[',']',';','e','π','^','fac','!','&',',',})
              bgColor =lightGrey;
              fontColor=white;
              %opColor;
            %elseif ismember(buttons{i,j}, {'Ans','C','CE'})
             % bgColor = []
            elseif ismember(buttons{i,j}, {'sin','cos','tan','Inv','Deg'})
              bgColor = b2;
              fontColor=white;
            elseif
              bgColor = opColor;
              fontColor = black;
            end
            %bgColor = funcColor;
            % Function buttons
            uicontrol('Style', 'pushbutton', ...
                      'String', buttons{i, j}, ...
                      'Position', [buttonXStart + (j-1)*(buttonWidth + buttonSpacing), ...
                                   buttonYStart - (i-1)*(buttonHeight + buttonSpacing), ...
                                   buttonWidth, buttonHeight], ...
                      'FontSize', 12, ...
                      'BackgroundColor', bgColor, ...
                      'ForegroundColor',fontColor, ...
                      'Callback', @(src, event)button_callback(buttons{i, j}, displayBox));
        end
    end
end

function button_callback(button, displayBox)  % Callback function for buttons
    persistent Ans;
    if isempty(Ans)
      Ans=0
   endif
    currentText = get(displayBox, 'String');
    switch button
        case '='
            % Evaluate the expression in the display
            try
                result = eval(currentText);
                Ans = result;
                set(displayBox, 'String', num2str(result));
            catch
                set(displayBox, 'String', 'Error');
            end
        case 'C'
            % Clearing the display
            set(displayBox, 'String', '0');
        case 'CE'
            % Remove last character from the display
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

                if any(strcmp(lastThreeChars, {'sin', 'cos', 'tan'}))
                    newText = [currentText, 'd']; % Append 'd' at the end to switch to degree mode
                else
                    newText = '!! switch to deg after trig. func. is inserted !!';
                end
            end
            set(displayBox, 'String', newText);
          case 'Inv'
            if strcmp(currentText, '0')
                newText = '!! insert trig. func. first !!';
            else
                % Extract the last 3 characters of the current text
                lastThreeChars = currentText(max(1, end-2):end);
                last4char = currentText(max(1, end-3):end);

                if any(strcmp(lastThreeChars, {'sin', 'cos', 'tan'}))
                    newText = ['a',currentText]; % Append 'a' at the beginning to switch to inverse mode
                elseif any(strcmp(last4char, {'sind', 'cosd', 'tand'}))
                    newText = ['a',currentText]; % Append 'a' at the beginning to switch to inverse mode
                else
                    newText = '!! switch to deg after trig. func. is inserted !!';
                end
            end
            set(displayBox, 'String', newText);
         case 'fac'
            if any(strcmp(currentText, {'Error', '0'}))
                newText = 'factorial(';
            else
                    lastchar = currentText(max(1, end));
                    if any(strcmp(lastchar, {'*', '+', '-','^','/','&'}))
                      newText = [currentText,"factorial("]
                    else
                      newText = [currentText,"*factorial("]
                    end
            end
            set(displayBox, 'String', newText);
        case 'π'
            if any(strcmp(currentText, {'Error', '0'}))
                newText = 'pi';
            else
                    lastchar = currentText(max(1, end));
                    if any(strcmp(lastchar, {'*', '+', '-','^','/','&'}))
                      newText = [currentText,"pi"]
                    else
                      newText = [currentText,"*pi"]
                    end
            end
            set(displayBox, 'String', newText);
        case 'e'
            if any(strcmp(currentText, {'Error', '0'}))
                newText = 'e';
            else
                    lastchar = currentText(max(1, end));
                    if any(strcmp(lastchar, {'*', '+', '-','^','/','&'}))
                      newText = [currentText,"e"]
                    else
                      newText = [currentText,"*e"]
                    end
            end
            set(displayBox, 'String', newText);
        case 'Ans'
            if any(strcmp(currentText, {'Error', '0'}))
                newText = num2str(Ans);
            else
                newText = [currentText, num2str(Ans)];
            end
            set(displayBox, 'String', newText);
        otherwise
            % Append the button text to the display
            if any(strcmp(currentText, {'Error','0'}))
                newText = button;
            else
                newText = [currentText, button];
            end
            set(displayBox, 'String', newText);
    end
end

