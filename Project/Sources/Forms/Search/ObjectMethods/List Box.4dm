Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		// Load the selected document in the 4D Write Pro area
		Form:C1466.WParea:=WP New:C1317(Form:C1466.currentItem.document.WP)
		GOTO OBJECT:C206(*; "WParea")
		// Select the text range defined by startOffset and endOffset
		WP SELECT:C1348(Form:C1466.WParea; Form:C1466.currentItem.startOffset; Form:C1466.currentItem.endOffset)
		
End case 