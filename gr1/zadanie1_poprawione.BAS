'$sim
Dim N As Byte
P0 = 0
Wait 1

Do

   For N = 0 To 7
      P0.n = 1
      Waitms 50
      P0.n = 0
      Waitms 50
   Next N

   For N = 6 Downto 1
      P0.n = 1
      Waitms 50
      P0.n = 0
      Waitms 50
   Next N

Loop