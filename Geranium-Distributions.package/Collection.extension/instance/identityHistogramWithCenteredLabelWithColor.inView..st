*Geranium-Distributions
identityHistogramWithCenteredLabelWithColor: aDictionary inView: aView

"
#('hello' 'hello' 'bonjour') identityHistogramWithLabelWithColor: (Dictionary newFromKeys: #('hello' 'bonjour') andValues: {(Color red) . (Color blue)})
"
	| b ds histDict ar|
b := RTGrapher new.
aView ifNotNil: [ b view: aView ].
"b extent: self vizSize."
"We defien the size of the charting area"
ds := GeraniumBarData new.
"When the mouse is above a bar, say which class we are point at"
"ds interaction popup."

histDict := self frequencies.

"Each subclass of RTShape will be a bar"
[ds points: histDict keys sorted] on: Error do: [ds points: histDict keys].

"The height of a bar will be the number of instances (defined in the instance side)"
ds y: [:x | histDict at: x].

"We set a color of the rectangle"
ds dotShape rectangle color: Color blue.

"Set the width of a bar"
"self halt."
ds barShape
	color: Color red;
	width: 20.
ds interaction popupText: [ :x | (histDict at:x) asString ].
b add: ds.
"self halt."
"ds barChartWithBarCenteredTitle: [:x | 
	x isFloat 
		ifTrue: [ x printShowingDecimalPlaces: 2 ]
		ifFalse: [ 
			(x class = Association and: [x key isFloat and: [x value isFloat]])
				ifTrue: [ (x key printShowingDecimalPlaces: 2) , ' - ' , (x value printShowingDecimalPlaces:2)]
				ifFalse: [ x asString ]
		]
	]."
"ar := OrderedCollection new.
aDictionary associations do: [ :e | ar add: { (e key asString) . (e value) } ]."
"ds  barChartWithBarCenteredTitleAndColor: (self collect: [ :e | e first ])."
ds  barChartWithBarCenteredTitleAndColorFrom: aDictionary.
"self halt."
b axisY.
b axisX
	noTick;
	noLabel.
^ b