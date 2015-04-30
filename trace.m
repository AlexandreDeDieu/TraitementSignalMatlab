function trace(x,Fe)
N=length(x);
%S=fft(x)/N;
%f=-Fe/2:Fe/N:Fe/2-Fe/N;
t=[0:(N-1)]*(1/Fe);
% Cette fonction permet de visualiser le signal temporel x (l'utilisation de cette fonction suppose que x soit réel).
% Te : Période d'échantillonnage
% titre : titre de la figure affichée
plot(t,x);
xlabel('temps');
ylabel('Amplitude');
grid on;

%graph end
