/*

  f.C	Sample .MEX file corresponding to threebp.M

  The calling syntax is:

			[yp] = threebp(t, y)

function Ydot = f(t, Y)

global m0 m1 m2

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

*/

#include "math.h"
#include "mex.h"

/* Input Arguments */

#define	T_IN	prhs[0]
#define	Y_IN	prhs[1]


/* Output Arguments */

#define	YP_OUT	plhs[0]

/* Global variables   */
/* global m0 m1 m2 EE */

static	double	m0 = 5;
static	double	m1 = 3;
static	double	m2 = 4;

static
void threebp(
	double	yp[],
	double	*s,
	double	y[]
	)
{
	double  x01,x02,x11,x12,x21,x22,n0,n1,n2,d01,d02,d11,d12,d21,d22;

	x01 = y[0]; x02 = y[1];
	x11 = y[4]; x12 = y[5];
	x21 = y[8]; x22 = y[9];

	n0 = sqrt((x21-x11)*(x21-x11)+(x22-x12)*(x22-x12));
	n1 = sqrt((x01-x21)*(x01-x21)+(x02-x22)*(x02-x22));
	n2 = sqrt((x11-x01)*(x11-x01)+(x12-x02)*(x12-x02));
	d01 = (x21-x11)/(n0*n0*n0); d02 = (x22-x12)/(n0*n0*n0);
	d11 = (x01-x21)/(n1*n1*n1); d12 = (x02-x22)/(n1*n1*n1);
	d21 = (x11-x01)/(n2*n2*n2); d22 = (x12-x02)/(n2*n2*n2);
	
	yp[2] = m1*d21 - m2*d11;
	yp[3] = m1*d22 - m2*d12;
	yp[6] = m2*d01 - m0*d21;
	yp[7] = m2*d02 - m0*d22;
	yp[10] = m0*d11 - m1*d01;
	yp[11] = m0*d12 - m1*d02;
	yp[0] = y[2];
	yp[1] = y[3];
	yp[4] = y[6];
	yp[5] = y[7];
	yp[8] = y[10];
	yp[9] = y[11];
}

void mexFunction(
	int		nlhs,
	mxArray	*plhs[],
	int		nrhs,
	const mxArray	*prhs[]
	)
{
	double	*yp;
	double	*t,*y;
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
		(max(m,n) != 12) || (min(m,n) != 1)) {
		mexErrMsgTxt("threebp requires that Y be a 12 x 1 vector.");
	}


	/* Create a matrix for the return argument */

	YP_OUT = mxCreateDoubleMatrix(m, n, mxREAL);


	/* Assign pointers to the various parameters */

	yp = mxGetPr(YP_OUT);

	t = mxGetPr(T_IN);
	y = mxGetPr(Y_IN);


	/* Do the actual computations in a subroutine */

	threebp(yp,t,y);
	return;
}

