'$sim
'******************************
'***    Program regulator   ***
'***    Grupa III inf       ***
'***    KIMK UP 2015        ***
'******************************
$large
Config Lcdpin = Pin , Db4 = P3.4 , Db5 = P3.5 , Db6 = P3.6 , Db7 = P3.7 , E = P3.3 , Rs = P3.1

Deflcdchar 1 , 16 , 16 , 16 , 16 , 16 , 16 , 16 , 16          ' replace ? with number (0-7)
Deflcdchar 2 , 24 , 24 , 24 , 24 , 24 , 24 , 24 , 24          ' replace ? with number (0-7)
Deflcdchar 3 , 28 , 28 , 28 , 28 , 28 , 28 , 28 , 28          ' replace ? with number (0-7)
Deflcdchar 4 , 30 , 30 , 30 , 30 , 30 , 30 , 30 , 30          ' replace ? with number (0-7)
Deflcdchar 5 , 31 , 31 , 31 , 31 , 31 , 31 , 31 , 31          ' replace ? with number (0-7)

Cursor Off
Dim Progres As String * 16
Dim J As Byte
Dim I As Byte
Dim Diff As Byte
I = 50
Gosub Prnt

Do
   Bitwait P2.7 , Set
   If P2.5 = 0 Then
      If I > 0 Then I = I - 1
   End If
   If P2.5 = 1 Then
      If I < 64 Then I = I + 1
   End If
   Bitwait P2.7 , Reset
   Bitwait P2.5 , Reset


   Gosub Prnt
Loop

Prnt:
    Cls
       Progres = ""
       Diff = I / 5
       For J = 0 To Diff
          Progres = Progres + Chr(5)
       Next J
       Diff = I Mod 5
       If Diff > 0 Then
          Progres = Progres + Chr(diff)
       End If
       Lcd "Volume - " ; I ; "dB"
       lowerline
      Lcd Progres
Return