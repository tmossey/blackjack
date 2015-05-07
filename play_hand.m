function [ p,bet ] = play_hand( hand,p,d,bet )
%PLAY_HAND this function [...]

%Play hand
while value_norm(p) < 21
    if ~isempty(hand)
        %Call function show_hand
        show_hand(hand,p)
        show_hand('Dealer',d)
        %Call function button_click
        strat = button_click('hit',length(p) > 2);
    end
    switch strat
        case 0
            %Stay
            break
        case 1
            %Hit
            p = [p card_deal];
        case 2
            %Double
            bet = 2 * bet;
            p = [p card_deal];
            break
        otherwise
            break
    end
end

end