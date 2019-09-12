initialization
createInputDiagramTabsSaved
	| tab |
	tab := self newTab.
	tabmgrInput := self newTabManager.
	tab := self newTab.
	tab presenter: structuralInputDiagrams.
	tab
		label: 'Structural';
		closeable: false;
		icon: (self appIcon: #structure size: 28 @ 28).
	tabmgrInput addTab: tab.
	tab := self newTab.
	tab presenter: socialInputDiagrams.
	tab
		label: 'Social';
		closeable: false;
		icon: (self appIcon: #social size: 28 @ 28).
	tabmgrInput addTab: tab.
	tab := self newTab.
	tab presenter: microClimateInputDiagrams.
	tab
		label: 'Micro-Climate';
		closeable: false;
		icon: (self appIcon: #'climate-cloud-sun' size: 28 @ 28).
	tabmgrInput addTab: tab
	"tab := self newTab.
	tab
		label: 'Live-Exploration';
		closeable: false;
		icon: Smalltalk ui icons thumbsUpIcon.
	tabmgrInput addTab: tab."