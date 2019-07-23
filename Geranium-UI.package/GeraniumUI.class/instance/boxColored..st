helper
boxColored: boxColor

	^ (RTBox new 
			height: 4;
			width: 23;
			color: (boxColor isSymbol ifTrue: [Color perform: boxColor] ifFalse: [boxColor]); 
			borderColor: Color black;
			borderWidth: 2 "5"; 
			element) "embed: {(RTLabel new text: text; color: (Color perform: aFontColor); height: 1) element.}
			vertically: 0."
	