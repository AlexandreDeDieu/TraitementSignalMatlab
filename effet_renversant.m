function effet_renversant(x,fe)

%[x,fe]=wavread('mario.wav');
a=flipud(x);

trace(a,fe);
sound(a,fe)