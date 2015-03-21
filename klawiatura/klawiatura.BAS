$sim
'******************************
'***    Program regulator   ***
'***    Grupa III inf       ***
'***    KIMK UP 2015        ***
'******************************
Config Lcdpin = Pin , Db4 = P3.4 , Db5 = P3.5 , Db6 = P3.6 , Db7 = P3.7 , E = P3.3 , Rs = P3.1
Deflcdchar 0 , 32 , 32 , 31 , 17 , 31 , 16 , 31 , 2           ' replace ? with number (0-7)
Dim N As Byte
Dim Zn As String * 1
Dim Wyraz As String * 15
Dim Liczba As Single
Dim Dl As Byte
Do
   For N = 0 To 3
      P2.n = 0
      Debounce P2.4 , 0 , Klik , Sub
      Debounce P2.5 , 0 , Klik , Sub
      Debounce P2.6 , 0 , Klik , Sub
      Debounce P2.7 , 0 , Klik , Sub
      P2.n = 1
   Next N

Loop


Klik:
   Zn = ""
   If P0 = 238 Then Zn = "1"
   If P0 = 222 Then Zn = "4"
   If P0 = 190 Then Zn = "7"
   If P0 = 126 Then Zn = "."
   If P0 = 237 Then Zn = "2"
   If P0 = 221 Then Zn = "5"
   If P0 = 189 Then Zn = "8"
   If P0 = 125 Then Zn = "0"
   If P0 = 235 Then Zn = "3"
   If P0 = 219 Then Zn = "6"
   If P0 = 187 Then Zn = "9"
   Wyraz = Wyraz + Zn

   If P0 = 123 Then
      Zn = "#"
      Liczba = Val(wyraz)
      Gosub Prntno
      Return
   End If


   If P0 = 183 Then
      Zn = "C"
      Dl = Len(wyraz)
      Dl = Dl - 1
      Wyraz = Left(wyraz , Dl)
   End If

   Gosub Prnt


Return


Prnt:
      Cls
      Locate 1 , 1
      Lcd "Napi" ; Chr(0) ; "cie: " ; Wyraz

Return

Prntno:
       Cls
      Locate 1 , 1
      Lcd "Napi" ; Chr(0) ; "cie: " ; Liczba ; "V"

Return