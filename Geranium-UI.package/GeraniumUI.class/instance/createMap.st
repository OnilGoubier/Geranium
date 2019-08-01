initialization
createMap
	mapDiagram := RoassalModel new.
	mapDiagram
		script: [ :view :canvas |  |catColorDistribution|
			mapView := GeraniumUIOsmView new. 
			catColorDistribution := (report inputVisitor residences collect: [ :r | (report scenarioEntityOf: r) name ]) typeFrequenciesAsColorDistributionWithColors: self typesColors.
			mapView
				renderInView: view;
				mapWithBuildingsCenteredAroundBoundingBox: (self report input areaOfInterest coordinates) 
				colored: catColorDistribution
				"geraniumAreaMapExample". 
			self boundingBox: mapView boundingBox.
			"self renderTemperatureHumidityDecoration." " we better do this decoration with the real value, we stop it temporarily"
			"self renderKiviatIn: view. ""should do it only once"
			"self renderArealLegend.
			self renderMinMaxConsumption."
			self renderClimateConsumptionIndicators.		
			 ] 