*Geranium-Distributions
identityHistogramWithCenteredLabelWithColor
"
#('hello' 'hello' 'bonjour') identityHistogramWithCenteredLabelWithColor
"
	| b ds histDict|
b := RTGrapher new.
b extent: self vizSize.
"We defien the size of the charting area"
ds := GeraniumBarData new.
"When the mouse is above a bar, say which class we are point at"
ds interaction popup.

histDict := self frequencies.

"Each subclass of RTShape will be a bar"
[ds points: histDict keys sorted] on: Error do: [ds points: histDict keys].

"The height of a bar will be the number of methods (defined in the instance side)"
ds y: [:x | histDict at: x].

"We set a color of the rectangle"
ds dotShape rectangle.

"Set the width of a bar"
ds barShape
	color: Color red;
	width: 20.
b add: ds.
ds barChartWithBarCenteredTitle: [:x | 
	x isFloat 
		ifTrue: [ x printShowingDecimalPlaces: 2 ]
		ifFalse: [ 
			(x class = Association and: [x key isFloat and: [x value isFloat]])
				ifTrue: [ (x key printShowingDecimalPlaces: 2) , ' - ' , (x value printShowingDecimalPlaces:2)]
				ifFalse: [ x asString ]
		]
	].
"ds barChartWithBarCenteredTitleAndColor: (self collect: [ :e | e first ])."
b axisY.
b axisX
	noTick;
	noLabel.
^ b