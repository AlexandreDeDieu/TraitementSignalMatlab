function Effet_WaWa

[x,Fw]=wavread('mario.wav');

% frequence min et max du filtre wah_wah
fmin=400;
fmax=4000;

% frequence de base du filtre wah_wah (fmin+fmax/2)
Fw = 2200;
Fs = 1100;

%delta fr√©quence entre base du filtre et celle du signal audio
delta = Fw/Fs;

% Signal triangle sur frec min - delta(frec filtre/frec sign) - frec max
Fc=fmin:delta:fmax;
while(length(Fc) < length(x) )
    Fc= [ Fc (fmax:-delta:fmin) ];
    Fc= [ Fc (fmin:delta:fmax) ];
end

% Taille de Fc
Fc = Fc(1:length(x(:,1)));
% Coeff Frequence : diffÈrent pour chaque valeur de Fc
F1 = 2*sin((pi*Fc(1))/Fs); 
% Coeff d'amplitude du filtre
Q1 = 2*0.05;                
%vecteur resultat (3 pour correspondre ‡ la frÈquence triangle du wah_wah)
yh=zeros(size(x(:,1)));          
yb(:,1)=zeros(size(x(:,1)));
yl=zeros(size(x(:,1)));
% PremiËre valeur pour pas Ítre nul ‡ cause du retard n-1
yh(1) = x(1,1);
yb(1,1) = F1*yh(1);
yl(1) = F1*yb(1,1);

% Calcul
for n=2:length(x(:,1)),
    yh(n) = x(n,1) - yl(n-1) - Q1*yb(n-1,1);
    yb(n,1) = F1*yh(n) + yb(n-1,1);
    yl(n) = F1*yb(n,1) + yl(n-1);
    F1 = 2*sin((pi*Fc(n))/Fs);
end


%RÈsultat final
maxyb(:,1) = max(abs(yb(:,1)));
y(:,1) = yb(:,1)/maxyb(:,1);
soundsc(y,F1)