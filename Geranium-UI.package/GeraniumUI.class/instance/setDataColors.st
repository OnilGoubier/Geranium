initialization
setDataColors

	self typesColors isEmpty ifTrue: [ self defaultDataColors.].
	structuralInputDiagrams setDataColors: self typesColors.
	socialInputDiagrams setDataColors: self typesColors.
	microClimateInputDiagrams setDataColors: self typesColors.
	"self halt."
	'setDataColor' logCr.

	