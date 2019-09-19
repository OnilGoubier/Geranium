updating
update 

	self updateReport.
	consumptionHistory := nil.
	consumptionHistoryCumSum := nil.
	areaLegend := nil.
	minMaxConsumptionLabels := nil.
	self updateStructuralInputDiagrams.
	self updateSocialInputDiagrams.
	self updateMicroClimateInputDiagrams.
	self updateEnvAwarenessInputDiagrams.
	self updateTotalStructureOutputDiagrams.
	"self updateSocialMicroClimateOutputDiagrams."
	self updateAwarenessCampaignOutputDiagrams.
	self updateMapDiagram.
