
' Check if there is any arguments being sent to the script. We require one.
args = WScript.Arguments.Count
If args <> 1 Then
  Wscript.Echo "usage: AutoRemoteVBScript.vbs Message"
  wscript.Quit
End If

' Define some variables that we need. And set the values.
' myKey and myPass needs to reflect those of your AutoRemote device.
message = WScript.Arguments.Item(0)
myKey = ""
myPass = ""
URL = "http://autoremotejoaomgcd.appspot.com/sendmessage?message=" & message & "&password=" & myPass & "&key=" & myKey

' Fetches the contents of URL and returns it.
Function GetContentsFromURL (URL)
	Set http = CreateObject("Microsoft.XmlHttp")
	http.open "GET", URL, FALSE
	http.send ""
	GetContentsFromURL = http.responseText
	Set http = Nothing
End Function

' Call the function that fetches the URL
GetContentsFromURL URL