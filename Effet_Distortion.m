function Effet_Distortion(x,Fe)
% y=fuzzexp(x, gain, mix)
% Distortion based on an exponential function
% x    - input
 gain = 5;
 mix  = 1; %to get only the distorded, on peut avoir un melange de 'original et du sons distordu
q=x*gain/max(abs(x));
z=sign(-q).*(1-exp(sign(-q).*q));
y=mix*z*max(abs(x))/max(abs(z))+(1-mix)*x;
y=y*max(abs(x))/max(abs(y));

trace(y,Fe);
sound(y,Fe);