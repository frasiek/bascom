'$sim
'******************************
'***    Program regulator   ***
'***    Grupa III inf       ***
'***    KIMK UP 2015        ***
'******************************
$large
Config Lcdpin = Pin , Db4 = P3.4 , Db5 = P3.5 , Db6 = P3.6 , Db7 = P3.7 , E = P3.3 , Rs = P3.1

Cursor Off

Dim I As Byte
I = 0
Gosub Prnt

Do
   Bitwait P2.7 , Set
   If P2.5 = 0 Then I = I - 1
   If P2.5 = 1 Then I = I + 1
   Bitwait P2.7 , Reset
   Bitwait P2.5 , Reset

   Gosub Prnt
Loop

Prnt:
    Cls
      Lcd "I=" ; I
Return