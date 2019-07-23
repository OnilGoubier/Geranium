visualization
renderTemperatureHumidityDecorationSaved2

	| el tempOrHumidity|
	tempOrHumidity := { 
		RTEllipse new color: (Color red alpha: 0.01); size: "10" "8" 20. 
		RTEllipse new color: (Color blue alpha: 0.01); size: "10" "8" 20. } % { 60 . 40 }. 
	tempContinue := true.
	tempAnimation := [ :e | tempContinue ifTrue: [mapView view addAnimation: (RTLinearMove new to: self atRandomInsideBoundingBox during: 2 on: e; after: [tempAnimation value: e]) ]].
	100 "make depended to the temperature"
		timesRepeat: [ el := tempOrHumidity next element translateTo: self atRandomInsideBoundingBox.
			el @ RTDraggable.
			mapView view add: el.
		 	tempAnimation value: (mapView decorationElements add: el) ].
	tempContinue := false.