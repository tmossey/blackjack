function [ v ] = button_click( k,disable )
%BUTTON_CLICK this function [...]

%Call function blackjack_button
button = blackjack_button(k);
%Disable double button after player hit
if (nargin == 2 && disable)
    set(button(3),'enable','off')
end
%Update and print figure
while all(cell2mat(get(button,'val')) == 0)
    drawnow
end
v = find(cell2mat(get(button,'val'))) - 1;

end

