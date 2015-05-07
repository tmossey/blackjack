function Blackjack( n )
%BLACKJACK(n) plays n hands with an initial bet of $10 per hand. The
%payout is $0 for a push, $10 on a hand that has not been split or doubled,
%$15 on a hand of blackjack, $20 on a hand that has been split or doubled,
%and $30 or $40 on a hand that has been doubled after it has been split.


%Clear and show figure
clc
shg
clf
clear all

%Format figure
set(gcf,'name','Blackjack','menu','none','numbertitle','off','double','on','color',[0 1/2 0],'userdata',[])
%Initialize random number generator
rng('shuffle')
%Check function input
if nargin == 0
    k = 1;
else
    if ischar(n)
        n = str2double(n);
    end
    %Call function black_jack
    black_jack(n)
    k = 2;
end
%Start game
while k > 0
    %Call function button_click
    k = button_click(k);
    switch k
        %Close
        case 0
            break
        %Play
        case 1
            black_jack(1)
    end

end

%Close figure
close(gcf)
