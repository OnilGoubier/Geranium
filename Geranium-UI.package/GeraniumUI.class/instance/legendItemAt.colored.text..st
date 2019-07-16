rendering
legendItemAt: y colored: aColor text: aText
	
	^ {(self boxColored: aColor height: 3 width: 3 bWidth: 3) translateTo: (self relativeToBoundingBox: -83 @ y).
	  (self label: aText colored: #black height: 2) translateTo: (self relativeToBoundingBox: -60 @ y+0.3)}.