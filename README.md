# OLD VERSION: ACROBAT - Ballistic Capture Orbit Analysis Tool

## Please Note: this version is old, and incorrect. It was meant as a 'proving ground' for the numerical integration. The new, working version will be pushed to master when complete.

## Using ACROBAT

Pull the contents of the repo to ~/ACROBAT. Launch MATLAB using:

/usr/local/MATLAB/R201xx/bin/ && ./matlab

Set the desired computation grid resolution by altering ires, jres.

## ACROBAT computation

ACROBAT integrates the elliptic restricted three-body problem equations of motion, regularised by Levi-Cevita transformations and converted to polar form. 

Running the code invokes a self-coded rkf45 implementation with adaptive step size control. The source code is free-to-use and can be found in rkf45.m.

The computation at full resolution - 354000 initial conditions - will take multiple days to run. More limited runs will yield unsatisfactory results.

## Planned Progress

Implementation of geometric filters; point optimisation per mission criteria; connection to multi-swingby low-thrust trajectory optimiser (to follow).

## Acknowledgements

The software suite is based largely off of research undertaken by the following: Topputo, F.; Gomez, G.; Belbruno, E., and those cited by the above.

## Licenses

All rights reserved. 
