function [ button ] = blackjack_button( k )
%BLACKJACK_BUTTON this function [...]

button = findobj(gcf,'style','toggle');
if isempty(button)
    for b = 3:-1:1
        button(b,1) = uicontrol('units','normal','style','toggle', ...
            'pos',[0.95-0.18*b 0.02 0.16 0.08],'fontweight','bold');
    end
end
font_size = 10;
set(button,'fore','black')
switch k
    case {1,2}
        switch k
            case 1
                y = .02;
                dy = .08;
            case 2
                y = .01;
                dy = .06;
        end
        for b = 1:3
            set(button(b),'pos',[0.95-0.18*b y 0.16 dy])
        end
        set(button,'val',0,'vis','on','enable','on','fontsize',font_size)
        set(button(1),'string','Close')
        set(button(2),'string','Play')
        set(button(3),'vis','off')
        set(button(k + 1),'fore',[1 0 0])
    case 'play'
        set(button(1:2),'vis','on')
        set(button(3),'vis','off')
        for b = 1:3
            set(button(b),'pos',[0.95-0.18*b 0.02 0.16 0.08])
        end
        set(button,'val',0,'fontsize',font_size)
    case 'off'
        set(button,'vis','off')
    case 'split'
        set(button,'val',0,'fontsize',font_size)
        set(button(1),'string','Keep')
        set(button(2),'string','Split')
    case 'hit'
        set(button,'val',0,'vis','on','fontsize',font_size)
        set(button(1),'string','Stand')
        set(button(2),'string','Hit')
        set(button(3),'string','Double')

end