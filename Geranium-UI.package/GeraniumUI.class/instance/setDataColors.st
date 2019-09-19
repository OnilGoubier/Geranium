initialization
setDataColors

	self typesColors isEmpty ifTrue: [ self defaultDataColors.].
	structuralInputDiagrams setDataColors: self typesColors.
	socialInputDiagrams setDataColors: self typesColors.
	microClimateInputDiagrams setDataColors: self typesColors.
	outputDiagramsTotStructure setDataColors: self typesColors.
	"outputDiagramsSocialMicroClimate setDataColors: self typesColors."
	outputDiagramsAwarenesscampaign setDataColors: self typesColors.
	"self halt."
	'setDataColor' logCr.

	