building
codeInSaved: a
	^ (self codePresentationIn: a)
		title: [ :page | 
			GTPlaygroundEditableTabLabel new
				text: page title;
				when: #accepted
					do: [ :text | page setTitleAndEnsureInStash: text asString ];
				yourself ];
		format: [ :page | page content ];
		act: [ :text :page |
				text selectionInterval: (1 to: text text size).
				self class compiler evaluate: text text.
				"text highlightEvaluateAndDo: [ :result | text selection: result]."
				"self geraniumUI update."
				self update ]
			icon: GLMUIThemeExtraIcons glamorousGo
			on: $G
			entitled: 'Do it all and go';
		act: [ :text :page | page publish ]
			iconName: #glamorousSaveToUrl
			entitled: 'Remote publish';
		addAction:
			(GLMPopupAction new
				action: [ :text :page :popup | 
					GTPlaygroundBindingsList new
						on: self currentBindingsSorted;
						when: #bindingRemoved
							do: [ :binding | self removeBinding: binding ];
						when: #inspect do: [ :binding | binding value inspect ];
						when: #go do: [ :binding | text selection: binding value ];
						yourself ];
				iconName: #glamorousTable;
				title: 'Bindings';
				yourself);
		addAction:
			(GLMPopupAction new
				action: [ :text :page :popup | 
					GTPlaygroundPlayPagesList new
						on: GTPlayBook instance;
						when: #pageAccepted
							do: [ :playPage | 
							text entity saveContent: playPage content.
							text update ];
						yourself ];
				iconName: #glamorousMore;
				title: 'Play pages';
				yourself);
		with: [ :presentation | self pageActionsIn: presentation ];
		dynamicActionsOnSelection: [ self contextMenuActions ];
		onChangeOfPort: #text
			act: [ :text :page | 
			page saveContent: text text.
			text clearUserEdits ]