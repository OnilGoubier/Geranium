file in/out
chooseFileToOpen

		^ UIManager default
			chooseFullFileNameMatching: nil 
			label: 'Choose a DSL file to open' translated