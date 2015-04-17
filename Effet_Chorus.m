function Effet_Chorus(x,Fe)

%[x,Fe]=wavread('mario.wav');

% On applique une d�calage de 600ms entre notre signal original et notre
% sigal modul�
decalage=0.6*Fe;

% Boucle de modification
for i=round(decalage+1):length(x)
    y(i)=x(i) + x(i-decalage); % On somme les deux signaux pour obtenir le chorus
    % x(i) signal normal
    % x(i-decalage) signal d�cal�
end

trace(y,Fe);
soundsc(y,Fe);

end