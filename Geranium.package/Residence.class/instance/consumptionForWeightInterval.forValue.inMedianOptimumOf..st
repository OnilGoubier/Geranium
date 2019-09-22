accessing
consumptionForWeightInterval: weightInterval forValue: aValue inMedianOptimumOf: aRange

"
ex. weightInterval : -5 -> 5
aValue (current temperature or temperature at time t) : 12
aRange : -5 -> 35 (comfort 20)
If the difference between the current temperature (aValue) and the comfort temperature (self medianOf: aRange) <= ((self halfRadiusOf: aRange) * 0.1), impactPercentage := -5, else impactPercentage := 5.
With our example: 
(12 - 20) abs = 8.
((self halfRadiusOf: aRange) * 0.1) = 35 - (-5) / 4 *0.1 = 1
8 > 1, impactPercentage = 5.
impact := impactPercentage * ((aValue - (self medianOf: aRange)) abs / ((self halfRadiusOf: aRange)/2)) = 5 * (12 - 20) abs / (35 - (-5))/4/2 = 40/5 = 8
"

	|fInterval impactPercentage impact|
	
	fInterval := self category fluctuationInterval.
	(aValue - (self medianOf: aRange)) abs <= ((self halfRadiusOf: aRange) * 0.1)
		ifTrue: [ impactPercentage := weightInterval key  ]
		ifFalse: [ impactPercentage := weightInterval value ]. "(self medianOf: aRange) is a comfort temperature"
	impact := impactPercentage * ((aValue - (self medianOf: aRange)) abs / ((self halfRadiusOf: aRange)/2)).
	^ fInterval * impact
	