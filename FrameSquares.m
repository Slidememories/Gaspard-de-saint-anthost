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

% Center the rectangle on the centre of the screen using fractional pixel
% values.
% For help see: CenterRectOnPointd
centeredRect = CenterRectOnPointd(baseRect, xCenter, yCenter);


%set the color of the rect
rectColor = [1 1 1];

%Draw the rect on the screen
Screen('FrameRect', window, rectColor, centeredRect, 5);

%Flip to the screen
Screen('Flip', window);

