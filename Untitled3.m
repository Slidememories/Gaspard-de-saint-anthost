% Draw the introduction text in the middle of the screen
Screen('TextSize', window, 60);
Screen('TextFont', window, 'Courier');
DrawFormattedText(window, 'Choose Right or Left', 'center',...
    screenYpixels * 0.25, white);

% 
ResultsFolder = 'C:\toolbox\results\'; %put the results in the \results folder
RightorLeftList = [1, 0]; %1 for right and 0 for left
StimDuration = 5;
ISI = .5; %Interstimulus interval
NTrials = length(StimList); %total number of trials is the length of the list of stimuli.

%%
 %------------Open the Two framed rectangles-----------------
    %Screen X positions of our two rectangles
    squareXpos = [screenXpixels * 0.25 screenXpixels * 0.75];
    numSqaures = length(squareXpos);

    % Make our rectangle coordinates
    allRects = nan(4, 3);
        for i = 1:numSqaures
    allRects(:, i) = CenterRectOnPointd(baseRect, squareXpos(i), yCenter);
        end

    %Draw the rect on the screen
    Screen('FrameRect', window, allColor, allRects, 5);

    %Flip to the screen
    Screen('Flip', window);

    % This is the cue which determines whether we exit the demo
    exitDemo = false;
    
    % Loop the animation until the escape key is pressed
    while exitDemo == false

    % Check the keyboard to see if a button has been pressed
    [keyIsDown,secs, keyCode] = KbCheck;

    % Depending on the button press, either move ths position of the square
    % or exit the demo
    if keyCode(escapeKey)
        exitDemo = true;
    elseif keyCode(leftKey)
        %Screen X positions of our filled left rectangle
        squareXpos = [screenXpixels * 0.25];
        numSquares = length(squareXpos);

        %Make our rectangle coordinates
        leftRect = nan(4, 3);
        for i = 1:numSquares
            leftRect(:, i) = CenterRectOnPointd(baseRect, squareXpos(i), yCenter);
        end
        
        %Draw the rect on the screen
        Screen('FillRect', window, allColor, leftRect);
        
        %Flip to the screen
        Screen('Flip', window);
        

    elseif keyCode(rightKey)
        %Screen X positions of our filled left rectangle
        squareXpos = [screenXpixels * 0.75];
        numSquares = length(squareXpos);

        %Make our rectangle coordinates
        rightRect = nan(4, 3);
        for i = 1:numSquares
            rightRect(:, i) = CenterRectOnPointd(baseRect, squareXpos(i), yCenter);
        end

        %Draw the rect on the screen
        Screen('FillRect', window, allColor, rightRect);
        
        %Flip to the screen
        Screen('Flip', window);

    end