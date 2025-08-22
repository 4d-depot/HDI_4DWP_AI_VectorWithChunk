var $o:={}
var $win:=Open form window:C675("Request"; Modal form dialog box:K39:7)
DIALOG:C40("Request"; $o)

Form:C1466.apiKey:=$o.apiKey

If (cs:C1710.AIManagement.new($o.apiKey).checkKey())
	OBJECT SET VISIBLE:C603(*; "configured@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "custom@"; True:C214)
Else 
	OBJECT SET VISIBLE:C603(*; "configured@"; True:C214)
	OBJECT SET VISIBLE:C603(*; "custom@"; False:C215)
	ALERT:C41("Incorrect API Key")
End if 