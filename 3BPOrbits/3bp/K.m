function K = proc(X)

global m0 m1 m2 EE

x1=X(1); x2=X(2); y1=X(3); y2=X(4);
p1=X(5); p2=X(6); q1=X(7); q2=X(8);

xx=x1^2+x2^2; yy=y1^2+y2^2;
pp=p1^2+p2^2; qq=q1^2+q2^2;

r0=xx*yy;
r2=((x1+y1)^2+(x2+y2)^2)*((x1-y1)^2+(x2-y2)^2)/4;
r1=((x1-y2)^2+(x2+y1)^2)*((x1+y2)^2+(x2-y1)^2)/4;

a=2*(p1*q1+p2*q2)*(x1*y1+x2*y2);
b=2*(p2*q1-p1*q2)*(x2*y1-x1*y2);

apb = a+b;
amb = a-b;
L0=r0*(pp*xx+qq*yy-apb);
L1=r1*(pp*yy+qq*xx-amb);
L2=r2*(pp*yy+qq*xx+amb);

m01 = m0*m1;
m12 = m1*m2;
m20 = m2*m0;

K=L0/32/m0+L1/32/m1+L2/32/m2-m01*r0*r1-m12*r1*r2-m20*r2*r0-EE*r0*r1*r2;
