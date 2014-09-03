Type=StaticCode
Version=3.82
B4A=true
@EndOfDesignText@
'	Code module
'written by Leo & Gibby
'Copyright (c) 2014 Texas Instruments Inc.
'
'Permission Is hereby granted, free of charge, To any person obtaining a copy
'of this software AND associated documentation files (the "Software"), To deal
'In the Software without restriction, including without limitation the rights
'To use, copy, modify, merge, publish, distribute, sublicense, AND/OR sell
'copies of the Software, AND To permit persons To whom the Software Is
'furnished To Do so, subject To the following conditions:
'
'The above copyright notice AND this permission notice shall be included In
'all copies OR substantial portions of the Software.
'
'THE SOFTWARE Is PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
'IMPLIED, INCLUDING BUT Not LIMITED To THE WARRANTIES OF MERCHANTABILITY,
'FITNESS For A PARTICULAR PURPOSE AND NONINFRINGEMENT. In NO EVENT SHALL THE
'AUTHORS OR COPYRIGHT HOLDERS BE LIABLE For ANY CLAIM, DAMAGES OR OTHER
'LIABILITY, WHETHER In AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
'OUT OF OR In CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS In
'THE SOFTWARE.
'
'	Subs in this code module will be accessible from all modules.
Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.
End Sub

Sub question As String
	Dim cmd As String
	cmd = "?" & Chr(13)
	Log("cmd " & cmd)
	If Main.blnSpeech = True Then
		Main.TTS1.Speak(cmd, True)
	End If
	Main.TextWriter1.write(cmd)
	Main.TextWriter1.Flush
	Return cmd = "sent"
End Sub

Sub read As String
	Dim cmd As String
	cmd = "read" & Chr(13)
	Log("cmd " & cmd)
	If Main.blnSpeech = True Then
		Main.TTS1.Speak(cmd, True)
	End If
	Main.TextWriter1.write(cmd)
	Main.TextWriter1.Flush
	Return cmd = "sent"
End Sub

'Sub learn As String
'	Dim cmd As String
'	cmd = "learn" & Chr(13)
'	Log("cmd " &cmd)
'	If Main.blnSpeech = True Then
'		Main.TTS1.Speak(cmd, True)
'	End If
'	Main.TextWriter1.write(cmd)	
'	Main.TextWriter1.Flush
'	Return cmd = "sent"
'End Sub

Sub run As String					' Can't use "do" changed to run
	Dim cmd As String
	cmd = "do" & Chr(13)
	Log("cmd " & cmd)
	If Main.blnSpeech = True Then
		Main.TTS1.Speak(cmd, True)
	End If
	Main.TextWriter1.write(cmd)
	Main.TextWriter1.Flush
	Return cmd = "sent"
End Sub

Sub quiet As String
	Dim cmd As String
	cmd = "quiet" & Chr(13)
	Log("cmd " & cmd)
	If Main.blnSpeech = True Then
		Main.TTS1.Speak(cmd, True)
	End If
	Main.TextWriter1.write(cmd)
	Main.TextWriter1.Flush
	Return cmd = "sent"
End Sub

Sub put(OverflowCharachter As String, Pin As String,Value As String) As String
	Dim cmd As String
	cmd = "put" & OverflowCharachter & " " & Pin & " " & Value & Chr(13)
	Log("cmd " & cmd)
	If Main.blnSpeech = True Then
		Main.TTS1.Speak(cmd, True)
	End If
	Main.TextWriter1.write(cmd)
	Main.TextWriter1.Flush
	Return cmd = "sent"
End Sub

Sub get(OverflowCharacter As String, Pin As String) As String
	Dim cmd As String
	cmd = "get" & OverflowCharacter & " " & Pin & Chr(13)
	Log("cmd " & cmd)
	If Main.blnSpeech = True Then
		Main.TTS1.Speak(cmd, True)
	End If
	Main.TextWriter1.write(cmd)	
	Main.TextWriter1.Flush
	Return cmd = "sent"
End Sub

Sub sleep(value As String) As String
	Dim cmd As String
	cmd = "sleep " & value & Chr(13)
	Log("cmd " & cmd)
	If Main.blnSpeech = True Then
		Main.TTS1.Speak(cmd, True)
	End If
	Main.TextWriter1.write(cmd)	
	Main.TextWriter1.Flush
	Return cmd = "sent"
End Sub

Sub move(Pin As String,Pin2 As String) As String
	Dim cmd As String
	cmd = "move " &  Pin & " " & Pin2 & Chr(13)
	Log("cmd " & cmd)
	If Main.blnSpeech = True Then
		Main.TTS1.Speak(cmd, True)
	End If
	Main.TextWriter1.write(cmd)
	Main.TextWriter1.Flush
	Return cmd = "sent"
End Sub

Sub condIf(lessORgreater As String, Pin As String, value As String) As String
	Dim cmd As String
	cmd = "if" & lessORgreater & " " & Pin & " " & value & Chr(13)
	Log("cmd " & cmd)
	If Main.blnSpeech = True Then
		Main.TTS1.Speak(cmd, True)
	End If
	Main.TextWriter1.write(cmd)
	Main.TextWriter1.Flush
	Return cmd = "sent"
End Sub

Sub endif As String
	Dim cmd As String
	cmd = "endif" & Chr(13)
	Log("cmd " & cmd)
	If Main.blnSpeech = True Then
		Main.TTS1.Speak(cmd, True)
	End If
	Main.TextWriter1.write(cmd)
	Main.TextWriter1.Flush
	Return cmd = "sent"
End Sub

Sub write(Pin As String) As String
	Dim cmd As String
	cmd = "write "& Pin & Chr(13)
	Log("cmd " & cmd)
	If Main.blnSpeech = True Then
		Main.TTS1.Speak(cmd, True)
	End If
	Main.TextWriter1.write(cmd)
	Main.TextWriter1.Flush
	Return cmd = "sent"
End Sub

Sub erase As String
	Dim cmd As String
	cmd = "erase" & Chr(13)
	Log("cmd " & cmd)
	If Main.blnSpeech = True Then
		Main.TTS1.Speak(cmd, True)
		sleep(200)
	End If
	Main.TextWriter1.write(cmd)
	Main.TextWriter1.Flush
	Return cmd = "sent"
End Sub





