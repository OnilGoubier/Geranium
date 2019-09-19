specs
defaultSpec
	<spec: #default>
	^ SpecLayout composed
			newColumn: [ :row | 
						row
							add: #successProbabilitiesPlot top: 0.0 bottom: 0.50;
							addSplitter;
							add: #awarenessCampaignCostPlot top:0.50 bottom: 1.0
			]; 						
		yourself