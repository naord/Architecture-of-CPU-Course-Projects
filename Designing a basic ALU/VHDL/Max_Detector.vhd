
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Max_Detector is
  generic (n: positive := 8);
 port(
   A  :	in std_logic_vector (n-1 downto 0);
	 B  :	in std_logic_vector (n-1 downto 0);
	 The_Maximum:	out std_logic_vector(n-1 downto 0));
end Max_Detector;

architecture behavior of Max_Detector is
  signal maxi :std_logic_vector(n-1 downto 0);
  begin
    max: process(A,B,maxi)
    variable A_value : integer;
    variable B_value : integer;
    begin
     A_value := to_integer(signed(A));
     B_value := to_integer(signed(B));
      if (B_value > A_value) then
        maxi <= B;
      else
        maxi <= A;
      end if;
    end process; 
     The_Maximum <= maxi;
end behavior;
                 

