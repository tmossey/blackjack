function [ c ] = card_deal
%CARD_DEAL this function [...] 

%Initialize and maintain variables
persistent deck 
persistent n_card

%Deal card
if (isempty(deck) || (n_card < 3))
    %Shuffle deck
    n_deck = 6;
    deck = mod(randperm(52 * n_deck) - 1,52) + 1;
    n_card = length(deck);
end
%Choose without replacement
c = deck(n_card);
n_card = n_card - 1;

end