function Effet_shelving(x,Fe)
G=4;
fcb=300;
Q=3;
type='Base_Shelf';
[b a]=shelving(G, fcb, Q, type);
yb=filter(b,a,x);
trace(yb, Fe);
sound(yb,Fe);
end
