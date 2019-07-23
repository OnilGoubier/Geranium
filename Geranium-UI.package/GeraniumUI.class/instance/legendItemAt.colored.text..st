rendering
legendItemAt: y colored: aColor text: aText
	
	^ {(self boxColored: aColor height: 3 width: 3 bWidth: 2) translateTo: (self relativeToBoundingBox: -87 @ y).
	  (self label: aText colored: #black height: 2) translateTo: (self relativeToBoundingBox: -64 @ y+0.3)}.