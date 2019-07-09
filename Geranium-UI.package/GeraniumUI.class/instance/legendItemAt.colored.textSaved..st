rendering
legendItemAt: y colored: aColor textSaved: aText
	
	^ {(self boxColored: aColor height: 2 width: 2 bWidth: 2) translateTo: (self relativeToBoundingBox: -53 @ y).
	  (self label: aText colored: #black height: 1.1) translateTo: (self relativeToBoundingBox: -45 @ y+0.3)}.