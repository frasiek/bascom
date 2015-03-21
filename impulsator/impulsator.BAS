'$sim
'******************************
'***    Program regulator   ***
'***    Grupa III inf       ***
'***    KIMK UP 2015        ***
'******************************
$large
Config Lcdpin = Pin , Db4 = P3.4 , Db5 = P3.5 , Db6 = P3.6 , Db7 = P3.7 , E = P3.3 , Rs = P3.1
Deflcdchar 0 , 16 , 16 , 16 , 16 , 16 , 16 , 16 , 16          ' replace ? with number (0-7)
Deflcdchar 1 , 24 , 24 , 24 , 24 , 24 , 24 , 24 , 24          ' replace ? with number (0-7)
Deflcdchar 2 , 28 , 28 , 28 , 28 , 28 , 28 , 28 , 28          ' replace ? with number (0-7)
Deflcdchar 3 , 30 , 30 , 30 , 30 , 30 , 30 , 30 , 30          ' replace ? with number (0-7)
Deflcdchar 4 , 31 , 31 , 31 , 31 , 31 , 31 , 31 , 31          ' replace ? with number (0-7)
Cursor Off

Dim I As Byte
I = 0
gosub Prnt
Do
   Bitwait P2.0 , Set
   If P2.2 = 0 Then Gosub Up
   If P2.2 = 1 Then Gosub Down
   Bitwait P2.0 , Reset
   Bitwait P2.2 , Reset

   Gosub Prnt
Loop

Prnt:
    Cls
      Lcd "I=" ; I
Return

Up:
    If I < 64 Then I = I + 1
Return

Down:
    If I > 0 Then I = I - 1
Return

