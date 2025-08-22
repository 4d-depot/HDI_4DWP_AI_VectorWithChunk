If (OBJECT Get style sheet:C1258(*; "input")=Automatic style sheet:K14:12)
	
	OBJECT SET FORMAT:C236(*; "btnShow"; ";path:/FORM/Images/eye.slash.png;;4;1;1;4;0;0;0;0;0;1;1")
	OBJECT SET FONT:C164(*; "input"; "%password")
Else 
	OBJECT SET FORMAT:C236(*; "btnShow"; ";path:/FORM/Images/eye.png;;4;1;1;4;0;0;0;0;0;1;1")
	OBJECT SET STYLE SHEET:C1257(*; "input"; Automatic style sheet:K14:12)
End if 
