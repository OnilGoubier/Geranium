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
	tab presenter: outputDiagramsAwarenesscampaign.
	tab
		label: 'Awareness Campaign';
		closeable: false;
		icon: (self appIcon: #'social' size: 30 @ 30).
	tabmgrOutput addTab: tab