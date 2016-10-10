function Ydot = f(t, Y)

global m0 m1 m2 % masses of the three bodies

x0 = Y(1:2); x1 = Y(5:6); x2 = Y(9:10);
d0 = (x2-x1)/norm(x2-x1)^3;
d1 = (x0-x2)/norm(x0-x2)^3;
d2 = (x1-x0)/norm(x1-x0)^3;

Ydot( 1: 2) = Y( 3: 4);
Ydot( 5: 6) = Y( 7: 8);
Ydot( 9:10) = Y(11:12);
Ydot( 3: 4) = m1*d2 - m2*d1;
Ydot( 7: 8) = m2*d0 - m0*d2;
Ydot(11:12) = m0*d1 - m1*d0;
Ydot = Ydot(:);

