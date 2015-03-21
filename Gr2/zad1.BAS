'$sim

Dim N As Byte
P2 = 0
Wait 1
Do
   For N = 0 To 7
      P2.n = 1
      Waitms 50
   Next N

   For N = 7 Downto 0
      P2.n = 0
      Waitms 50
   Next N
Loop
End