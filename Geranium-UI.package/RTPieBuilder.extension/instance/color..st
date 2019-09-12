*Geranium-UI
color: aColorScheme

"
aColorScheme, currently exists : 'Set1', 'Set2' or 'Set3'
"

	elements with:(RTColorPalette qualitative colors: elements size scheme: aColorScheme ) do:
			[ :el :cl| el trachelShape color: cl].