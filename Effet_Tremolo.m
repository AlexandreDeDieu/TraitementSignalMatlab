function Effet_Tremolo(x,Fe)

%[x,Fe]=wavread('mario.wav');
index = 1:length(x); % On récupère la taille de notre échantillon

% On utilise une courbe cosinus. On aurait aussi pu utiliser un signal
% triangulaire, ou autre...

Fc = 10;
alpha = 0.9;

trem=(1+ alpha*cos(2*pi*index*(Fc/Fe)))';    % cos(2pi*fa/fs)

y = trem.*x;

trace(y,Fe);
sound(y,Fe);
end
