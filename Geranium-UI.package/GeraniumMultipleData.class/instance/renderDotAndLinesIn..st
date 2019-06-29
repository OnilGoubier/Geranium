rendering
renderDotAndLinesIn: aView
	
	| myElements|
	myElements := (elements select: [:e | e model isKindOf: Point]).
	builder view addAll: myElements.
	"interaction setUpElements: elements."
	
	"self halt."
	RTMetricNormalizer new
		elements: myElements;
		normalizeElementX: [ :anElement | x rtValue: anElement ]
			min: 0
			max: builder extent x
			minValue: (xScale rtValue: minX)
			maxValue: (xScale rtValue: maxX)
			using: xScale.
	RTMetricNormalizer new
		elements: myElements;
		normalizeElementY: [ :anElement | y rtValue: anElement ]
			min: 0
			max: builder extent y negated
			minValue: (yScale rtValue: minY)
			maxValue: (yScale rtValue: maxY)
			using: yScale.
	"self renderLinesFor: elements in: aView.
	self executeUserDeclaredActions"