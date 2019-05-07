% Make a base Rects of 300 by 300 pixels
baseRect = [0 0 300 300];

%set the color of the rect
allColor = [1 1 1; 1 1 1; 1 1 1]; 

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


