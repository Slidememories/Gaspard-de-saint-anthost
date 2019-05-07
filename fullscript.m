PsychDebugWindowConfiguration;
PsychDefaultSetup(2);

%Get the screen numbers
screens = Screen('Screens');

%Draw to the external screen if possible
screenNumber = max(screens);

%Define black and white 
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

%Open an on screen window
[window,windowRect] = PsychImaging('OpenWindow', screenNumber, black);

%Get the center coordinate of the window in pixels
[screenXpixels,screenYpixels] = Screen('WindowSize', window);

% Get the centre coordinate of the window
[xCenter, yCenter] = RectCenter(windowRect);

% Make a base Rects of 300 by 300 pixels
baseRect = [0 0 300 300];

%set the color of the rect
allColor = [1 1 1; 1 1 1; 1 1 1];

% The available key to press
escapeKey = KbName ('ESCAPE');
leftKey = KbName ('LeftArrow');
rightKey = KbName ('RightArrow');

% Maximum priority level
topPriorityLevel = MaxPriority(window);
Priority(topPriorityLevel);

% This is the cue which determines whether we exit the demo
exitDemo = false;

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
end





