function Effet_Rapido(rapide,x,fe)

%[x,fe]=wavread('mario.wav');

trace(x,fe);
sound(x,rapide.*fe);