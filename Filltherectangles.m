
% This is the cue which determines whether we exit the demo
exitDemo = false;

%Open the Two framed rectangles
TwoFrameSquares

% Loop the animation until the escape key is pressed
while exitDemo == false

    % Check the keyboard to see if a button has been pressed
    [keyIsDown,secs, keyCode] = KbCheck;

    % Depending on the button press, either move ths position of the square
    % or exit the demo
    if keyCode(escapeKey)
        exitDemo = true;
    elseif keyCode(leftKey)
        Leftfilledrectangle;
    elseif keyCode(rightKey)
        Rightfilledrectangle;
    end
end

