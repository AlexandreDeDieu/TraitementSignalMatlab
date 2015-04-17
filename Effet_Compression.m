function Effet_Compression(x,Fe)

comp = -0.5; % On définit la compression
a = 0.5;

%[x,Fe]=wavread('mario.wav');


% Compressor/expander
% comp	- compression: 0>comp>-1, expansion: 0<comp<1
% a		    - filter parameter <1
h=filter([(1-a)^2],[1.0000 -2*a a^2],abs(x)); % Filtre de détection de l'enveloppe du signal
h=h/max(h); % Normalise le filtre
h=h.^comp; % Applique le facteur de compression

y=x.*h; % Applique la courbe de compression au signal d'entrée

y=y*max(abs(x))/max(abs(y)); % Normalise le signal de sortie a maximum du signal d'entrée

trace(y,Fe);
% On joue le son
sound(y,Fe);

end