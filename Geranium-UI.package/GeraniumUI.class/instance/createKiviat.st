accessing
createKiviat
	"parametrize as before"
	| b |
	kiviat := RoassalModel new.
	kiviat 
		script: [  :view :canvas |
			b := { #a -> (1 to: 3 ). #b -> (3 to: 6) . #c -> (6 to: 9 ). #d -> (9 to: 12) }
							kiviatForParameters: { #Structure . #Climate . #Social .}
							withCaption: nil 
							inView: view.
			b build
		"self halt."
		"b build.
		b view"
	].
	"whiteBackground := (RTRoundedBox new
		color: Color white trans;
		size: 10;
		borderRadius: 10) element."
"	elementsAndEdges := b view elements , b view edges.
	RTNest new on: whiteBackground nest: elementsAndEdges."

	"e children do: [ :el | 
		el trachelShape extent: el trachelShape extent / 10.
		el trachelShape class = TRLabelShape
			ifTrue: [ el trachelShape fontSize: 2 ]
	]."
	"e color: Color transparent."
	"^ whiteBackground"
	"c := b view canvas color: Color transparent.
	^ (RTBitmap new form: (c buildMorph imageForm scaledToSize: 30 @ 30)) element"