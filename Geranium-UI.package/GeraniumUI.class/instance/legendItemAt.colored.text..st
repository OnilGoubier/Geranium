rendering
legendItemAt: y colored: aColor text: aText
	
	^ {(self boxColored: aColor height: 1.5 width: 1.5 bWidth: 1.5) translateTo: (self relativeToBoundingBox: -53 @ y).
	  (self label: aText colored: #black height: 1) translateTo: (self relativeToBoundingBox: -44 @ y+0.3)}.