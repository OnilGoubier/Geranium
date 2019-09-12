specs
defaultSpec
	<spec: #default>
	^ SpecLayout composed
		newRow: [ :row | 
						row 
							add: #transportModeGraph left: 0.0 right: 0.66;
							addSplitter; 
							add: #consumptionChoiceGraph left:0.33 right: 0.33;
							addSplitter;
							add: #peakHoursGraph left: 0.66 right: 0.0
			]; 						
		yourself