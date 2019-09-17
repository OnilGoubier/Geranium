*Geranium-Distributions
multiGrapherWithColors: someColors withLabels: someStrings

"
#(#(3 4 6) #(20 30 60))
		multiGrapherWithColors: { Color red . Color blue} withLabels: {'red'. 'blue'} 
"

|g g1 g2 ds1 ds2|
g := RTMultiGrapher new.

g1 := RTGrapher new.
ds1 := RTData new.
ds1 label: 'Red'.
ds1 dotShape color: (someColors at: 1).
ds1 connectColor: (someColors at: 1).
ds1 points: (self at: 1).
ds1 interaction highlightDataset: Color black.
g1 add: ds1.

g2 := RTGrapher new.
ds2 := RTData new.
ds2 label: 'Blue'.
ds2 dotShape color: (someColors at: 2).
ds2 connectColor: (someColors at: 2).
ds2 points: (self at: 2).
ds2 interaction highlightDataset: Color purple.
g2 add: ds2.

g1 axisY
	title: 'y 1';
	color: Color red.
	
g2 axisY
	title: 'y 2';
	color: Color blue.

g add: g1.
g add: g2.
g legend.

^ g