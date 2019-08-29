computing
successProbabilityFor: aNumber

"
The successProbabilities formule for phone calls based awareness campaign :
p = 0,1446e-0,948 x (Nb of times a user does an awareness campaign by a phone call, nb of calls)
"

	 ^ (self class initialProbability * ( 2.71828 raisedTo: (-0.948 * aNumber)))