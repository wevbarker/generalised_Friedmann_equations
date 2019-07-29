#	this is main

read(`CLIo.mpl`):
with(CLIo):

dit({fyellow,fblink,bold,dunderline},"Run me with the -q flag!");

dit({},"Reading in the equations of motion...");

#	read and define
read(`generalised_Friedmann_equations.mpl`):
equations:=%:

dit({},"...okay, should be done now.");

dit({fgreen,byellow},"We should have a table called equations, with indices X, Y, H and q. The equations[X] and equations[Y] directly correspond to (52a) and (52b) (i.e. torsion equations), whereas equations[H] and equations[q] correspond to (57) and (59) -- all equation numbers as in the paper I gave you on Friday 26 July. Note that K=\\kappa, S1=\\sigma_1, S2=\\sigma_2, but U3=\\upsilon_2. The cosmic time is t. Furthermore Q(t) and U(t) are the same notation as in the paper, but I use a(t)=R(t) to mean the dimensionful scale factor. The dimensionless densities of dust, radiation and dark energy use an obvious notation O_d(t), O_r(t) and O_L(t). Thanks for your help!");

#	put the manipulations here

fin();
