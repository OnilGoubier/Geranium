rendering
renderClimateConsumptionIndicatorsSaved
	| consumption temperature humidity |
	consumptionLabel
		ifNotNil: [ mapView view
				removeElement: consumptionLabel;
				removeElement: temperatureLabel;
				removeElement: humidityLabel ].
	consumption := (self consumptionHistoryCumSumAt: step + 1) first/1000
		printShowingDecimalPlaces: 1.	"The total"
	temperature := (self temperatureAt: step + 1)
		printShowingDecimalPlaces: 1.
	humidity := (self humidityAt: step + 1) printShowingDecimalPlaces: 1.
	temperatureLabel := ((RTLabel new
		color: Color red;
		height: 5) elementOn: temperature asString , '°C')
		translateTo: (self relativeToBoundingBox: 17 @ 13).
	humidityLabel := ((RTLabel new
		color: Color blue;
		height: 4) elementOn: humidity asString , '% Hr')
		translateTo: (self relativeToBoundingBox: 19 @ 21).
	self renderMinMaxConsumption.
	self renderArealLegend.
	"should be se by the dsl normally"
	"edge := (RTLine new color: Color orange; width: 1) edgeFrom: a to: b"	"width: 2; color: Color orange."
	consumptionLabel := ((RTLabel new
		color: Color black;
		height: 3) elementOn: consumption asString , 'MWh')
		translateTo: (self relativeToBoundingBox: 17 @ 38).
	mapView view
		add: temperatureLabel;
		add: humidityLabel;
		add: consumptionLabel.
	tempContinue = false
		ifTrue: [ mapView view signalUpdate ]	"there is an additional signal update from animation -- should animate more cleanly"