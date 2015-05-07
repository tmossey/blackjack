function card_plot( x,y,v,g )
%CARD_PLOT this function plots the vth card at position (x,y)

z = exp(0:16 / 16 * pi /  2 * i) / 16;
edge = [z + 1 / 2 + 7 * i / 8 ...
    i * z - 1 / 2 + 7 * i / 8 ...
    -z - 1 / 2 - 7 * i / 8 ...
    -i * z + 1 / 2 - 7 * i / 8 ...
    9 / 16 + 7 * i / 8];
face = {'A','2','3','4','5','6','7','8','9','10','J','Q','K'};

if v <= 0
    %Plot hole card
    patch(real(edge) + x,imag(edge) + y,[1 0 0])
else
    %Set card color
    card_color = [1 1 1];
    if (y == 0 && g == 1)
        card_color = [0.75 0.75 0.75]; 
    end
    %Plot new card
    patch(real(edge) + x,imag(edge) + y,card_color)
    font_size = 20;
    suit = ceil(v / 13);
    v = mod(v - 1,13) + 1;
    x1 = x - 0.35;
    if v == 10
        x1 = x1 - 0.1;
        x = x + 0.1;
    end
    switch suit
        %Set suit color and symbol
        case {1,4}
            suit_color = [0 0 0];
            if suit == 1
                suit_symbol = '\clubsuit';
            else
                suit_symbol = '\spadesuit';
            end
        case {2,3}
            suit_color = [2/3 0 0];
            if suit == 2
                suit_symbol = '\diamondsuit';
            else
                suit_symbol = '\heartsuit';
            end
    end
    text(x1,y,face{v},'fontname','courier','fontsize',font_size,'fontweight','bold','color',suit_color)
    text(x,y + 0.025,suit_symbol,'interpreter','tex','fontsize',font_size,'color',suit_color)
end

end