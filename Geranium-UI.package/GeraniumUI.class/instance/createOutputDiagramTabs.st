initialization
createOutputDiagramTabs
	| tab |
	tabmgrOutput := self newTabManager.
	tab := self newTab.
	tab presenter: outputDiagramsTotStructure.
	tab
		label: 'Energy/Structure';
		closeable: false;
		icon: (self appIcon: #'energy-lamp' size: 30 @ 30).
	tabmgrOutput addTab: tab.
	tab := self newTab.
	tab presenter: outputDiagramsSocialMicroClimate.
	tab
		label: 'Social/Climate';
		closeable: false;
		icon: (self appIcon: #'energy-thunder' size: 30 @ 30).
	tabmgrOutput addTab: tab