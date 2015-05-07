function [ v ] = value_norm( x )
%VALUE_NORM this function [...]

%Evaluate hand
x = mod(x - 1,13) + 1;
x = min(x,10);
v = sum(x);

%Convert ace low -> high
if (any(x == 1) && (v <= 11))
    v = v + 10;
end

end