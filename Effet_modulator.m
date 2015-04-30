function Effet_modulator(x,Fs)

% ring_mod.m


index = 1:length(x);

% Ring Modulate with a sine wave frequency Fc

Fc = 440;

carrier= sin(2*pi*index*(Fc/Fs))'; 


ya = x.*carrier;
trace(ya,Fs);
sound(ya,Fs);


%create a modulator sine wave frequency Fx

Fx = 200;

modulator = sin(2*pi*index*(Fx/Fs))'; 


% ring modulate with sine wave, freq. Fc

y = modulator.*carrier;

%trace(y,Fs);
%sound(y,Fs);