function [ r ] = pay_out( who,p,d,split,bet )
%PAY_OUT this function [...]

%Initialize variables
p_val = value_norm(p);
d_val = value_norm(d);
font_size = 15;
play = ~isempty(who);

if (p_val == 21 && length(p) == 2 && ~(d_val == 21 && length(d) == 2) && ~split)
    r = 1.5 * bet;
    if play
        str = ['BLACKJACK!   $+' int2str(r)];
    end
elseif p_val > 21
    r = -bet;
    if play
        str = ['BUST!   $' int2str(r)]; 
    end
elseif d_val > 21
    r = bet;
    str = ['You win!   $+' int2str(r)];
    if play
        text(min(1.5 * length(d) - 4.5,2.75),-2.5,'BUST!','fontsize',font_size)
    end
elseif d_val > p_val
    r = -bet;
    if play
        str = ['You lose!   $' int2str(r)]; 
    end
elseif d_val < p_val
    r = bet;
    if play
        str = ['You win!   $+' int2str(r)]; 
    end
else
    r = 0;
    if play
        str = 'PUSH';
    end
end

if play
    x = min(1.5 * length(p) - 4.5,2.75);
    if isequal(who,'Player')
        y = 2.5;
    else
        y = 0;
    end
    text(x,y,str,'fontsize',font_size)
end

end