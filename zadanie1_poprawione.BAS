$sim
Dim n As byte
P0 = 0
wait 1
do

   For n=0 to 7
      P0.n = 1
      waitms 50
      P0.n = 0
      waitms 50
   next n

   For n=6 downto 1
      P0.n = 1
      waitms 50
      P0.n = 0
      waitms 50
   next n

loop