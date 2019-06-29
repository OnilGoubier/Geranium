specs
defaultSpecSaved
	<spec: #default>
	^ SpecLayout composed
		newRow: [ :row | 
						row 
							add: #avSurfaceOcSizePlot left: 0.0 right: 0.66; "remove #scatterplot replace with #avSurfaceOcSizePlot"
							addSplitter; 
							add: #barStack left:0.33 right: 0.33;
							addSplitter;
							add: #pie left: 0.66 right: 0.0
			]; 						
		yourself