% Make a base Rects of 300 by 300 pixels
baseRect = [0 0 300 300];

%set the color of the rect
allColor = [1 1 1; 1 1 1; 1 1 1];

%Screen X positions of our filled left rectangle
squareXpos = [screenXpixels * 0.75];
numSquares = length(squareXpos);

%Make our rectangle coordinates
rightRect = nan(4, 3);
for i = 1:numSquares
    rightRect(:, i) = CenterRectOnPointd(baseRect, squareXpos(i), yCenter);
end


