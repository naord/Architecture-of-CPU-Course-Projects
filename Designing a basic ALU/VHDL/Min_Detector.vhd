
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Min_Detector is
  generic (n: positive := 8);
 port(
   A  :	in std_logic_vector (n-1 downto 0);
	 B  :	in std_logic_vector (n-1 downto 0);
	 The_Minimum:	out std_logic_vector(n-1 downto 0));
end Min_Detector;

architecture behavior of Min_Detector is
  signal mini :std_logic_vector(n-1 downto 0);
  begin
    max: process(A,B,mini)
    variable A_value : integer;
    variable B_value : integer;
    begin
     A_value := to_integer(signed(A));
     B_value := to_integer(signed(B));
      if (B_value > A_value) then
        mini <= A;
      else
        mini <= B;
      end if;
    end process; 
     The_Minimum <= mini;
end behavior;
                 


