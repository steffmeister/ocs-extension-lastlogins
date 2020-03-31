'----------------------------------------------------------
' Plugin for OCS Inventory NG 2.x
' Script : Last logins
' Version : 1.0
' Date : 02/18/2020
' Authors : Stefan ZIDAR
'----------------------------------------------------------
' OS checked [X] on	32b	64b	(Professionnal edition)
'	Windows XP		[ ]
'	Windows Vista	[ ]	[ ]
'	Windows 7		[ ]	[X]
'   Windows 8		[ ] [ ]
'	Windows 8.1		[ ]	[ ]	
'	Windows 10		[ ]	[X]
'	Windows 2k8R2		[ ]
'	Windows 2k12R2		[ ]
'	Windows 2k16		[ ]
' ---------------------------------------------------------
Option Explicit
On Error Resume Next

'====================================================

dim counter, strComputer, objWMIService, colLoggedEvents, objEvent, strDateTime, strSID, objAccount, strUserName, strDomainName

' -----------------------------------------------------------------------

strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
 & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")

Set colLoggedEvents = objWMIService.ExecQuery _
 ("Select * from Win32_NTLogEvent Where Logfile = 'System' and SourceName = 'Microsoft-Windows-WinLogon' and eventcode='7001'")


counter = 0

For Each objEvent in colLoggedEvents
	strDateTime = Left(objEvent.TimeWritten, 4) & "-" & Cstr(Mid(objEvent.TimeWritten, 5, 2) & "-" & Mid(objEvent.TimeWritten, 7, 2)  _
			  & " " & Mid (objEvent.TimeWritten, 9, 2) & ":" & _
			  Mid(objEvent.TimeWritten, 11, 2) & ":" & Mid(objEvent.TimeWritten, _
			  13, 2))
	strSID = objEvent.InsertionStrings(1)

	Set objAccount = objWMIService.Get("Win32_SID.SID='" & strSID & "'")
	strUserName = objAccount.AccountName
	strDomainName = objAccount.ReferencedDomainName
	Wscript.echo "<LASTLOGINS>"
	Wscript.Echo "<LL_USERNAME>"& strDomainName & "\" & strUserName & "</LL_USERNAME>"
	Wscript.Echo "<LL_TIMESTAMP>" & strDateTime & "</LL_TIMESTAMP>"
	Wscript.echo "</LASTLOGINS>"
	counter = counter + 1
	if (counter > 9) then 
		exit for
	end if
Next

'===============================================