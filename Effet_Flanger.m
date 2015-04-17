% Effet Flanger
function Effet_Flanger(x,Fe)
%[x,Fe]=wavread('mario.wav');


% Notre son a une fr�quence de 11kHz donc 0-3 ms correspond � 0 - 33 �chantillons
max_time_delay=0.003; % On fixe donc le d�lai max � 3ms
rate=1; % Pourcentage de bride dans la fr�quence

index=1:length(x);

% Sinus de r�f�rence pour cr�er les oscillations
sin_ref = (sin(2*pi*index*(rate/Fe)))';    % sin(2pi*fa/fs);

max_samp_delay=round(max_time_delay*Fe); % Converti le delay de l'�chantillon

y = zeros(length(x),1); % On cr�e un vecteur de sortie

y(1:max_samp_delay)=x(1:max_samp_delay); % Pour les �chantillons n�gatifs

amp=0.7; % Coefficiant

% Pour chaque �chantillon
for i = (max_samp_delay+1):length(x),
    cur_sin=abs(sin_ref(i));    % Valeur asbolue pour le sinus
    cur_delay=ceil(cur_sin*max_samp_delay);  % G�n�re le delay depuis 1-max_samp_delay
    y(i) = (amp*x(i)) + amp*(x(i-cur_delay));   % On ajoute l'�chantillon avec le delay
end

% Visualisation temporelle
%trace_t(y,Fe,'Visualisation temporelle du signal avec effet flanger');
% Visualisation fr�quentielle

%t=[0:N-1]/Fe;

trace(y,Fe);
% On jour l'effet
sound(y,Fe);
end
