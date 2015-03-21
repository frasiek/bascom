'$sim
'******************************
'***    Program regulator   ***
'***    Grupa III inf       ***
'***    KIMK UP 2015        ***
'******************************
$large
Config Lcdpin = Pin , Db4 = P3.4 , Db5 = P3.5 , Db6 = P3.6 , Db7 = P3.7 , E = P3.3 , Rs = P3.1
Deflcdchar 0 , 32 , 32 , 31 , 17 , 31 , 16 , 31 , 2           ' ê
Deflcdchar 1 , 32 , 32 , 4 , 10 , 17 , 31 , 32 , 32           ' delta
Dim N As Byte
Dim Zn As String * 1
Dim Wyraz As String * 5
Dim Liczba As Single
Dim Liczbai As Integer
Dim Dl As Byte

Cursor Off

      Cls
      Lcd "Napi" ; Chr(0) ; "cie U="


Do
   For N = 0 To 3
      P0.n = 0
      Debounce P0.4 , 0 , Klik , Sub
      Debounce P0.5 , 0 , Klik , Sub
      Debounce P0.6 , 0 , Klik , Sub
      Debounce P0.7 , 0 , Klik , Sub
      P0.n = 1
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

   If P0 = 183 Then
      Zn = "C"
      Dl = Len(wyraz)
      Dl = Dl - 1
      Wyraz = Left(wyraz , Dl)
      If Dl = 0 Then Wyraz = ""
   End If

   Gosub Prnt

      If P0 = 123 Then
      Zn = "#"
      Liczba = Val(wyraz)

      If Liczba > 24 Then
         Gosub Error
         Return
      End If

      Liczba = Liczba * 10

      Liczbai = Liczba

      If Liczba <> Liczbai Then
         Gosub Error
         Return
      End If

      Gosub Prntno
      Wyraz = ""
         Waitms 120
      Return
   End If

   Waitms 120
Return


Prnt:
      Cls
      Lcd "Napi" ; Chr(0) ; "cie U=" ; Wyraz

Return

Prntno:
      Cls
      Lcd "Napi" ; Chr(0) ; "cie U=" ; Wyraz ; "V"
      Lowerline
      Lcd "Bajt - " ; Liczbai
Return

Error:
     Cls
     Lcd "U= 0-24 V"
     Lowerline
     Lcd Chr(1) ; "=0.1"
     Wait 1
     Wyraz = ""
     Gosub Prnt
Return