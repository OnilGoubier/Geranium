initialization
createMapModelTabs
	| tab |
	tabmgrMap := self newTabManager.
	tab := self newTab.
	tab presenter: mapDiagram.
	tab
		label: 'Map';
		closeable: false;
		icon: (self appIcon: #map size: 30 @ 30).
	tabmgrMap addTab: tab.
	tab := self newTab.
	tab presenter: modelEditor.
	tab
		label: 'Model';
		closeable: false;
		icon: (self appIcon: #model size: 30 @ 30).
	tabmgrMap addTab: tab.
	tab := self newTab.
	tab presenter: kiviat.
	tab
		label: 'Overview';
		closeable: false;
		icon: (self appIcon: #overview size: 30 @ 30).
	tabmgrMap addTab: tab