function Efet_Expansion(x,Fe)

%[x,Fe]=wavread('mario.wav');
expension = 0.001; % On définit l'expansion
a = 0.2;

% Compressor/expander
% comp	- compression: 0>comp>-1, expansion: 0<comp<1
% a		    - filter parameter <1
h=filter([(1-a)^2],[1.0000 -2*a a^2],abs(x)); % Filtre de détection de l'enveloppe du signal
h=h/max(h); % Normalise le filtre
h=h.^expension; % Applique le facteur d'expansion

y=x.*h; % Applique la courbe d'expansion au signal d'entrée

y=y*max(abs(x))/max(abs(y)); % Normalise le signal de sortie a maximum du signal d'entrée

trace(y,Fe);
% On joue le son
soundsc(y,Fe);
end