'************************
'***    Program LED 3 ***
'***    Grupa III inf ***
'***    KIMK UP 2015  ***
'************************

Dim N As Byte

P2 = 0
P0 = 0
Wait 1
Do
  Do

      For N = 0 To 7
         If P3.7 = 0 Then Exit Do
         P2.n = 1
         Waitms 50
      Next N

      For N = 7 Downto 0
         If P3.7 = 0 Then Exit Do
         P2.n = 0
         Waitms 50
      Next N

    Loop
    P0 = 0
    P2 = 0

    Do


   For N = 0 To 7
      If P3.0 = 0 Then Exit Do
      P0.n = 1
      Waitms 50
      P0.n = 0
      Waitms 50
   Next N

   For N = 6 Downto 1
      If P3.0 = 0 Then Exit Do
      P0.n = 1
      Waitms 50
      P0.n = 0
      Waitms 50
   Next N

    Loop
    P0 = 0
    P2 = 0

Loop
End