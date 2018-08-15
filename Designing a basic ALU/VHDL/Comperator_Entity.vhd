
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Comperator_Entity is
  generic (n: positive := 8);
 port(
   Max_Or_Min: in std_logic;
   A  :	in std_logic_vector (n-1 downto 0);
	 B  :	in std_logic_vector (n-1 downto 0);
	 Answer:	out std_logic_vector(n-1 downto 0));
end Comperator_Entity;

architecture behavior of Comperator_Entity is
  
  --****************************************************** 
  --                   components declaration
  --****************************************************** 
  
  component Max_Detector 
    generic (n: positive := 8);
    port(
     A  :	in std_logic_vector (n-1 downto 0);
	   B  :	in std_logic_vector (n-1 downto 0);
	   The_Maximum:	out std_logic_vector(n-1 downto 0));
  end component;
  
  component Min_Detector 
    generic (n: positive := 8);
    port(
     A  :	in std_logic_vector (n-1 downto 0);
	   B  :	in std_logic_vector (n-1 downto 0);
	   The_Minimum:	out std_logic_vector(n-1 downto 0));
  end component;
  
  signal min,max,ans : std_logic_vector (n-1 downto 0);
  begin
    find_max : Max_Detector 
    generic map(n)
    port map (A,B,max);
    find_min : Min_Detector 
    generic map(n)
    port map (A,B,min);
   process(A,B)
     variable MaxOrMin : integer;
      begin 
        MaxOrMin <= to_integer(Max_Or_Min);
      if MaxOrMin = 1 then
        Answer <= max;
      else
        Answer <= min;
      end if;
    end process;
    --Answer <= ans;
end behavior;






