Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.trace:=False:C215
		
		var $prompts:=ds:C1482.Prompts.all().toCollection()
		Form:C1466.prompts:={values: $prompts.extract("Description"); index: 0}
		Form:C1466.chunks:=cs:C1710.VectorManagement.new().calculateWithSelectedPrompt($prompts[0])
		
		Form:C1466.WParea:=WP New:C1317
		
		//LISTBOX SELECT ROW(*; "List Box"; 1)
		//WParea:=WP New(Form.chunks[0].document.WP)
		//GOTO OBJECT(WParea)
		
		//WP SELECT(WParea; Form.chunks[0].startOffset; Form.chunks[0].endOffset)
		
		OBJECT SET VISIBLE:C603(*; "configured@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "custom@"; False:C215)
		
End case 