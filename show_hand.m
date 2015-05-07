function show_hand( who,h )
%SHOW_HAND this function [...]

%Display hand
switch who
    case 'Player'
        y = 2.5;
    case 'Split'
        y = 0;
    case 'Dealer'
        y = -2.5;
end

x = -4;
%Expand hand
for j = 1:length(h)
    %Call function card_plot
    card_plot(x,y,h(j),length(h))
    x = x + 1.5;
end

end

