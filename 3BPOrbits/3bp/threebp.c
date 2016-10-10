/*

  threebp.C	Sample .MEX file corresponding to threebp.M

  The calling syntax is:

			[yp] = threebp(t, y)

*/

#include "mex.h"

/* Input Arguments */

#define	S_IN	prhs[0]
#define	Y_IN	prhs[1]


/* Output Arguments */

#define	YP_OUT	plhs[0]


#define	max(A, B)	((A) > (B) ? (A) : (B))
#define	min(A, B)	((A) < (B) ? (A) : (B))

/* Global variables   */
/* global m0 m1 m2 EE */

static	double	m0 = 5;
static	double	m1 = 3;
static	double	m2 = 4;
static	double	EE = -769/60.0;

static
void threebp(
	double	yp[],
	double	*s,
	double	y[]
	)
{
	double  t1, t9, t10, t11, t8, t6, t7, t4, t5, t2, t3, t16, t17;
	double  t13, t14, t12, yy, t28, xx, t25, t20, t21, t18, t19, s4, t35;
	double  r1, s3, t32, s2, s1, r0, s0, qq, pp, t42, t43, A, t40, t41;
	double  t39, r2, s7, s5, s6, amb, t55, B, t52, t53, t54, t50, t51;
	double  t48, t49, t73, t74, t61, t68, t60, m20, m01, m12, t100;
	double  t101, t104, t105, t108, t109, t110, t111, t112, t94, t120;
	double  t123, t131, t122, t121, t146, t161;
	double  x1,x2,y1,y2,p1,p2,q1,q2;

	x1 = y[0]; x2 = y[1]; y1 = y[2]; y2 = y[3];
	p1 = y[4]; p2 = y[5]; q1 = y[6]; q2 = y[7];

	t1 = x1*x1;
	t2 = x2*x2;
	xx = t1 + t2;
	t3 = y1*y1;
	t4 = y2*y2;
	yy = t3 + t4;
	t5 = p1*p1;
	t6 = p2*p2;
	pp = t5 + t6;
	t7 = q1*q1;
	t8 = q2*q2;
	qq = t7 + t8;
	r0 = xx*yy;
	s0 = x1 - y2;
	s1 = x2 + y1;
	s2 = x1 + y2;
	s3 = x2 - y1;
	t9 = s0*s0;
	t10 = s1*s1;
	t11 = t9 + t10;
	t12 = s2*s2;
	t13 = s3*s3;
	t14 = t12 + t13;
	r1 = 1/4*t14*t11;
	s4 = x1 + y1;
	s5 = x2 + y2;
	s6 = x1 - y1;
	s7 = x2 - y2;
	t16 = s4*s4;
	t17 = s5*s5;
	t18 = t16 + t17;
	t19 = s6*s6;
	t20 = s7*s7;
	t21 = t19 + t20;
	r2 = 1/4*t21*t18;
	t25 = p1*q1 + p2*q2;
	t28 = x1*y1 + x2*y2;
	A = 2*t28*t25;
	t32 = p2*q1 - p1*q2;
	t35 = x2*y1 - x1*y2;
	B = 2*t35*t32;
	amb = A - B;
	t39 = pp*xx + qq*yy - A - B;
	t40 = pp*yy;
	t41 = qq*xx;
	t42 = t40 + t41 - amb;
	t43 = t40 + t41 + amb;
	m01 = m0*m1;
	m12 = m1*m2;
	m20 = m2*m0;
	t68 = -EE*r2;
	t48 = 1/32*1/m2;
	t50 = 1/32*1/m1;
	t52 = 1/32*1/m0;
	t49 = r2*t48;
	t51 = r1*t50;
	t54 = t49 - t51;
	t53 = r0*t52;
	t55 = -t53;
	t100 = -t54 + t55;
	t104 = t54 + t55;
	t60 = t43*t48 - m12*r1 - m20*r0 - EE*r0*r1;
	t61 = t18*t60;
	t120 = 1/2*s7*t61;
	t108 = 1/2*s6*t61;
	t121 = 1/2*t21*s5*t60;
	t109 = 1/2*t21*s4*t60;
	t73 = r0*t68 + t42*t50 - m01*r0 - m12*r2;
	t74 = t11*t73;
	t122 = 1/2*s3*t74;
	t110 = 1/2*s2*t74;
	t123 = 1/2*t14*s1*t73;
	t111 = 1/2*t14*s0*t73;
	t94 = r1*t68 + t39*t52 - m01*r1 - m20*r2;
	t161 = xx*t49 + xx*t51 + yy*t53;
	t146 = yy*t49 + yy*t51 + xx*t53;
	t131 = pp*t49 + pp*t51 + qq*t53 + xx*t94;
	t112 = qq*t49 + qq*t51 + pp*t53 + yy*t94;
	t101 = t32*t100;
	t105 = t25*t104;

	yp[4] = -( -2*y2*t101 + 2*y1*t105 + t108 + t109 + t110 + t111 + 2*x1*t112 );
	yp[5] = -( 2*y1*t101 + 2*y2*t105 + t120 + t121 + t122 + t123 + 2*x2*t112 );
	yp[6] = -( 2*x2*t101 + 2*x1*t105 - t108 + t109 - t122 + t123 + 2*y1*t131 );
	yp[7] = -( -2*x1*t101 + 2*x2*t105 - t120 + t121 + t110 - t111 + 2*y2*t131 );
	yp[0] =  -2*t35*q2*t100 + 2*t28*q1*t104 + 2*p1*t146;
	yp[1] =  2*t35*q1*t100 + 2*t28*q2*t104 + 2*p2*t146;
	yp[2] =  2*t35*p2*t100 + 2*t28*p1*t104 + 2*q1*t161;
	yp[3] =  -2*t35*p1*t100 + 2*t28*p2*t104 + 2*q2*t161;
	yp[8] = r0*r1*r2;
}


void mexFunction(
	int		nlhs,
	mxArray	*plhs[],
	int		nrhs,
	const mxArray	*prhs[]
	)
{
	double	*yp;
	double	*s,*y;
	unsigned int	m,n;

	/* Check for proper number of arguments */

	if (nrhs != 2) {
		mexErrMsgTxt("threebp requires two input arguments.");
	} else if (nlhs > 1) {
		mexErrMsgTxt("threebp requires one output argument.");
	}


	/* Check the dimensions of Y.  Y can be 9 X 1 or 1 X 9. */

	m = mxGetM(Y_IN);
	n = mxGetN(Y_IN);
	if (!mxIsNumeric(Y_IN) || mxIsComplex(Y_IN) || 
		mxIsSparse(Y_IN)  || !mxIsDouble(Y_IN) ||
		(max(m,n) != 9) || (min(m,n) != 1)) {
		mexErrMsgTxt("threebp requires that Y be a 9 x 1 vector.");
	}


	/* Create a matrix for the return argument */

	YP_OUT = mxCreateDoubleMatrix(m, n, mxREAL);


	/* Assign pointers to the various parameters */

	yp = mxGetPr(YP_OUT);

	s = mxGetPr(S_IN);
	y = mxGetPr(Y_IN);


	/* Do the actual computations in a subroutine */

	threebp(yp,s,y);
	return;
}

