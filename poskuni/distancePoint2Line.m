function oD = distancePoint2Line(iL, iP)
%funkcija vrne razdaljo med točko in premico
%vhodni podatki
%   iL = [k,n] k -naklon premice , n- začetna točka
%   iP = [x,y] - koordinate točke
k = iL(1);
n = iL(2);
x = iP(1);
y = iP(2);
zgor = k*x -y +n;
dol = norm([k, -1]);
oD = zgor./dol;



