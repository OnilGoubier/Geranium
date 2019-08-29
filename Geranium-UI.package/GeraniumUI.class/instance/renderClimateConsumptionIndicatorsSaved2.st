rendering
renderClimateConsumptionIndicatorsSaved2
	| consumption temperature humidity currentConsumption |
	
	'indicator' logCr.
	consumptionLabel
		ifNotNil: [ mapView view
				removeElement: consumptionLabel;
				removeElement: temperatureLabel;
				removeElement: humidityLabel;
				removeElement: currentConsumptionLabel ].
	consumption := (self consumptionHistoryCumSumAt: step + 1) first/1000
		printShowingDecimalPlaces: 1.	"The total"
	temperature := (self temperatureAt: step + 1)
		printShowingDecimalPlaces: 1.
	humidity := (self humidityAt: step + 1) printShowingDecimalPlaces: 1.
	currentConsumption := (self consumptionHistory collect: [:e| ((e at: step +1)"/1000")] from: 2 to: 6) sum printShowingDecimalPlaces: 1. currentConsumption asString logCr.
	temperatureLabel := ((RTLabel new
		color: Color red;
		height: 3) elementOn: temperature asString , '°C')
		translateTo: (self relativeToBoundingBox: 24 @ 15).
	humidityLabel := ((RTLabel new
		color: Color blue;
		height: 3) elementOn: humidity asString , '% Hr')
		translateTo: (self relativeToBoundingBox: 27 @ 21).
	currentConsumptionLabel := ((RTLabel new
		color: Color black;
		height: 3) elementOn: currentConsumption asString , 'kWh')
		translateTo: (self relativeToBoundingBox: 28 @ 46).
	self renderMinMaxConsumption.
	self renderArealLegend.
	"should be se by the dsl normally"
	"edge := (RTLine new color: Color orange; width: 1) edgeFrom: a to: b"	"width: 2; color: Color orange."
	consumptionLabel := ((RTLabel new
		color: Color black;
		height: 3) elementOn: consumption asString , 'MWh')
		translateTo: (self relativeToBoundingBox: -50 @ 46).
	mapView view
		add: temperatureLabel;
		add: humidityLabel;
		add: consumptionLabel;
		add: currentConsumptionLabel.
	tempContinue = false
		ifTrue: [ mapView view signalUpdate ]	"there is an additional signal update from animation -- should animate more cleanly"