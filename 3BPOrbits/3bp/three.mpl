restart;

x := x1 + I*x2: 
y := y1 + I*y2:
X := ((x^2-y^2)/2)^2:
Y := ((x^2+y^2)/2)^2:
r0 := factor(evalc(abs(Y-X))):
r0 := simplify(r0, power, symbolic);

r1 := factor(evalc(abs(Y)));

r2 := factor(evalc(abs(X)));

read `reduce`;
r1 := reduce(r1);

r2 := reduce(r2);

# Derivation of the gradient of the regularized Hamiltonian K
restart;
read `K`;
eval(K);
SK := codegen[split](K);
GRADK := codegen[GRADIENT](SK);
codegen[cost](GRADK);
GRADKopt := codegen[optimize](GRADK);
codegen[cost](GRADKopt);

G1 := linalg[grad](K(x1,x2,y1,y2,p1,p2,q1,q2),
                        [x1,x2,y1,y2,p1,p2,q1,q2]):
G2 := [GRADKopt(x1,x2,y1,y2,p1,p2,q1,q2)]:
zip((g1,g2)->expand(g1-g2), convert(G1, list), G2);

# The Pythagorean Three-Body Problem
Digits := 20:
X := 4*I:
Y := -3:
x := sqrt(sqrt(Y)+sqrt(X));

x := map(t->map(radnormal,t),evalc(x));

evalf(%);

y := sqrt(sqrt(Y)-sqrt(X));

y := map(t->map(radnormal,t),evalc(y));

evalf(%);

m0 := 5: m1 := 3: m2 := 4:
radnormal(K(Re(x), Im(x), Re(y), Im(y), 0, 0, 0, 0));
solve(%, EE);

# Derivation of symbolic expressions for P and Q
x := 'x': y := 'y':
B := linalg[matrix](2,2,[[x*(x^2-y^2), -y*(x^2-y^2)],
                         [x*(x^2+y^2), y*(x^2+y^2)]]);

invB := linalg[inverse](transpose(B)):
pq := linalg[vector]([p,q]):
PQ := map(normal,linalg[multiply](invB,pq));

