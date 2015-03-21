$sim
'******************************
'***    Program regulator   ***
'***    Grupa III inf       ***
'***    KIMK UP 2015        ***
'******************************

Dim SleepTime As Integer
Dim Direction As Byte
Dim P As Byte
Direction = 1
P2 = 0
Do
   If P0.6 = 0 Then Gosub Slow_down
   If P0.7 = 0 Then Gosub Speed_up
   If P0.1 = 0 Then Gosub Go_left
   If P0.0 = 0 Then Gosub Go_right

   If Direction = 1 Then Gosub Rotate_left
   If Direction = 0 Then Gosub Rotate_right


Loop

End

Speed_up:
      If Sleeptime > 0 Then
         SleepTime = SleepTime - 10
      End If
Return

Slow_down:
      If Sleeptime < 200 Then
         Sleeptime = Sleeptime + 10
      End If
Return

Go_left:
   Direction = 1
Return

Go_right:
   Direction = 0
Return

Rotate_left:
   For P = 0 To 3
      P2.p = 1
      Waitms Sleeptime
      P2.p = 0
   Next P
Return

Rotate_right:
   For P = 3 Downto 0
      P2.p = 1
      Waitms Sleeptime
      P2.p = 0
   Next Pin
Return