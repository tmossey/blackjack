function black_jack( n )
%BLACK_JACK this function provides the basic functionality of the game.

%Get user info
s = get(gcf,'userdata');

%Initialize variables
n = 1;
bet = 10;
play = n;
t = length(s);

%Construct user interface
if play
    %Clear figure text
    delete(findobj(gcf,'type','axes'))
    axes('pos',[0 0 1 1])
    axis([-5 5 -5 5])
    axis off
    %Call function blackjack_button
    blackjack_button('play');
    %Track score
    pot = sum(s);
    if pot >= 0
        sig = '+'; 
    else
        sig = '-'; 
    end
    %Print score
    score = sprintf('Played: %d hands   Won: $%c%d',t,sig,abs(pot));
    board = text(-2.4,4.5,score,'fontsize',15);
    t0 = t + 1;
    t1 = t0;
else
    %Call function blackjack_button
    blackjack_button('off');
    payout = [-4:1 1.5 2:4] * bet;
    t0 = t + 1;
    t1 = ceil((t0) / n) * n;
end
s = [s zeros(1,t1 - t0 + 1)];

%Play
for t = t0:t1
    bet1 = bet;
    %Player hand
    p = card_deal;
    %Dealer hand
    d = card_deal;
    p = [p card_deal];
    %Hide hole card
    d = [-card_deal d];
      
    %Split pair
    split = mod(p(1),13) == mod(p(2),13);
    if split
        if play
            %Call function show_hand
            show_hand('Player',p)
            show_hand('Dealer',d)
            %Call function button_click
            split = button_click('split',split + 1);
        end
    end
    if split
        p2 = p(2);
        if play
            %Call function show_hand
            show_hand('Split',p2);
        end
        p = [p(1) card_deal];
        bet2 = bet1;
    end

    %Play player hand
    if play
        [p,bet1] = play_hand('Player',p,d,bet1);
        %Call function show_hand
        show_hand('Player',p)
        if split
            p2 = [p2 card_deal];
            show_hand('Split',p2)
            [p2,bet2] = play_hand('Split',p2,d,bet2);
        end
    else
        %Call function play_hand
        [p,bet1] = play_hand('',p,d,bet1);
        if split
            p2 = [p2 card_deal];
            [p2,bet2] = play_hand('',p2,d,bet2);
        end
    end
      
    %Play dealer hand
    %Show hole card
    d(1) = -d(1);
    while value_norm(d) <= 16
        d = [d card_deal];
    end
      
    %Payout
    if play
        %Call function show_hand
        show_hand('Dealer',d)
        show_hand('Player',p)
        %Call function pay_out
        r = pay_out('Player',p,d,split,bet1);
        if split
            %Call function show_hand
            show_hand('Split',p2)
            %Call function pay_out
            r = r + pay_out('Split',p2,d,split,bet2);
        end
    else
        %Call function pay_out
        r = pay_out('',p,d,split,bet1);
        if split
            %Call function pay_out
            r = r + pay_out('',p2,d,split,bet2);
        end
    end
    s(t) = r;
    if play
        %Track score
        pot = pot + r;
        if pot >= 0
            sign = '+'; 
        else
            sign = '-';
        end
        %Print score
        score = sprintf('Played: %d hands   Won: $%c%d',t,sign,abs(pot));
        set(board,'string',score)
    end

end

%Update user info
set(gcf,'userdata',s);
