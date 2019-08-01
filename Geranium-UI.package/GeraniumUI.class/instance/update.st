updating
update 

	self updateReport.
	consumptionHistory := nil.
	consumptionHistoryCumSum := nil.
	self updateStructuralInputDiagrams.
	self updateSocialInputDiagrams.
	self updateMicroClimateInputDiagrams.
	self updateTotalStructureOutputDiagrams.
	self updateSocialMicroClimateOutputDiagrams.
	self updateMapDiagram.
