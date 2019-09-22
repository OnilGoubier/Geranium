building
codeIn: a
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
				self update ]
			icon: GLMUIThemeExtraIcons glamorousGo
			on: $G
			entitled: 'Do it all and go';
		act: [ :text :page |
				text selectionInterval: (1 to: text text size).
				self writeOnAFile: text text.]
			icon: GLMUIThemeExtraIcons glamorousSave
			on: $S
			entitled: 'Save';
		act: [ :text :page |
				text text: self openFile.
				text update.]
			icon: GLMUIThemeExtraIcons glamorousOpen
			on: $O
			entitled: 'Open File';
		with: [ :presentation | self pageActionsIn: presentation ];
		dynamicActionsOnSelection: [ self contextMenuActions ];
		onChangeOfPort: #text
			act: [ :text :page | 
			page saveContent: text text.
			text clearUserEdits ]