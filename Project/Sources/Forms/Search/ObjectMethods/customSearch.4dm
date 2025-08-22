If (Form:C1466.Trace)
	TRACE:C157
End if 

If (Form:C1466.customPrompt#"")
	Form:C1466.chunks:=cs:C1710.VectorManagement.new().calculate(Form:C1466.customPrompt; Form:C1466.apiKey)
End if 
