
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;


entity MAC is
  generic (n: positive := 8);
  port(
    toSave : in std_logic_vector (2*n-1 downto 0):=(others=>'0');
    enableM: in std_logic := '0';
    resetM : in std_logic := '0';
    clkM   : in std_logic := '0';
    Qout   : out std_logic_vector (2*n-1 downto 0):=(others=>'0'));
  end MAC;

  
  
architecture behavior of MAC is
  
begin
  process (clkM,enableM,resetM) is
  begin 
  if rising_edge(clkM) then
      if resetM = '1' then
       Qout <= (others => '0'); 
      else
        if enableM = '1' then  
		      Qout <= toSave ;
        end if;
  end if;
end if;
end process;

end behavior;  
