$sim
'******************************
'***    Program regulator   ***
'***    Grupa III inf       ***
'***    KIMK UP 2015        ***
'******************************

Dim Obr As Integer
Dim Nap As Byte
Config Lcdpin = Pin , Db4 = P3.4 , Db5 = P3.5 , Db6 = P3.6 , Db7 = P3.7 , E = P3.3 , Rs = P3.1
Gosub Prnt
P2.7 = 0
Do
   If P0.0 = 0 Then Gosub Speed_up
   If P0.1 = 0 Then Gosub Slow_down

   P2.7 = 0
   Nap = 150 - Obr
   Waitms Nap
   P2.7 = 1
   Obr = Obr + 50
   Waitms Obr
   Obr = Obr - 50
Loop

End

Slow_down:
      If Obr > 0 Then
         Obr = Obr - 10
         Gosub Prnt
         Waitms 150
      End If
Return

Speed_up:
      If Obr < 100 Then
         Obr = Obr + 10
         Gosub Prnt
         Waitms 150
      End If
Return


Prnt:
      Cls
      Locate 1 , 1
      Obr = Obr * 10
      Lcd "Obroty: " ; Obr
      Obr = Obr / 10
Return