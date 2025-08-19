*.option converge = 0
*.option RUNLVL = 6
*.option METHOD=GEAR
.option INGOLD=1

*param Vselect = 1.28
*.param Vset = 1.3
*.param Vreset = -1.3
*.param Vread = 0.1
*.param trises = 15
*.param tfalls = 15
*.param trisere = 15
*.param tfallre = 15
*.param twidth = 80n
*.param ttotal = trises+tfalls+trisere+tfallre

.subckt memdiode2 p n
	.param H0 = 0 beta = 0.308
	*Transition parameters
	.param T0s = 1796000 V0s = 0.0899 T0r = 132 V0r = 0.1905
	
	*I-V parameters
	
	.param imin = 1.8e-6 imax = 1.23e-3 alphamin = 3e+0 alphamax = 3.8 rsmin = 117 rsmax = 256
	.param I0(x) = 'imax*x + imin*(1-x)'
	.param A(x) = 'alphamax*x + alphamin*(1-x)'
	.param Rss(x) = 'rsmax*x + rsmin*(1-x)'
	
	*********H-V*********
	EV A 0 vol = 1
	RH H A R = 'T0s*exp(-V(p,n)/V0s)'
	RD H 0 R = 'T0r*exp(V(p,n)/V0r)'
	CH H 0 C = 1IC = 'H0'
	*********I-V*********
	RS p D R = 'Rss(V(H))'
	GD D n cur = 'I0(V(H))*(exp(beta*A(V(H))*V(D,n))-exp(-(1-beta)*A(V(H))*V(D,n)))'
.ends memdiode2

X_RRAM3 1 0 memdiode2
Vin13 1 0
.end






*M1 d g 0 0 compl_trans
*vg g 0 1
*.model compl_trans nmos LEVEL=1 vto=0.5 kp=0.0010 lambda=0.2
*Vin 1 0 pwl 0 0 trises Vset trises+tfalls 0 trises+tfalls+trisere Vreset ttotal 0

*.tran 'trises/1000' ttotal 0 'trises/500' UIC

*.print PAR('I(Vin)')
*.print V(1)
*.print V(X_RRAM.H)

