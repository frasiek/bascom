$sim
'******************************
'***    Program Wyswietlacz ***
'***    Grupa III inf       ***
'***    KIMK UP 2015        ***
'******************************
Dim Nap As Byte

Config Lcdpin = Pin , Db4 = P3.4 , Db5 = P3.5 , Db6 = P3.6 , Db7 = P3.7 , E = P3.3 , Rs = P3.1
Deflcdchar 0 , 2 , 4 , 14 , 17 , 17 , 17 , 14 , 32 `ó
Deflcdchar 1 , 32 , 32 , 31 , 17 , 31 , 16 , 31 , 2           'ê
Deflcdchar 2 , 2 , 4 , 31 , 16 , 31 , 1 , 31 , 32             ' œ
Deflcdchar 3 , 2 , 4 , 31 , 16 , 16 , 16 , 31 , 32            'æ

Cursor Off

Cls
Lcd "  Witam Pan" ; Chr(0) ; "w"
Locate 2 , 1
Lcd "  na zaj" ; Chr(1) ; "ciach"

Wait 1
Cls

Locate 1 , 1
Lcd "    SYSTEMY"
Locate 2 , 1
Lcd "   WBUDOWANE"

Wait 1
Nap = 0
Gosub Disp

Do
    If P0.0 = 0 Then
      If Nap < 250 Then
         Nap = Nap + 10
         Gosub Disp
      End If
    End If
    If P0.1 = 0 Then
      If Nap > 0 Then
         Nap = Nap - 10
         Gosub Disp
      End If
    End If

Loop




End


Disp:
   Cls
   Locate 1 , 1
   Lcd "Warto" ; Chr(2) ; Chr(3) ; ": " ; Nap
   waitms 300

Return