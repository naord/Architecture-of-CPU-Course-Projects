library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity TB_MUX is
end TB_MUX;

architecture behav_test of TB_MUX is
component SuperMux
 generic (n: positive :=8);
 Port(
   op: in std_logic_vector (3 downto 0);
   a:	in std_logic_vector (n-1 downto 0);
	 b:	in std_logic_vector (n-1 downto 0);
	 ab:	in std_logic_vector (2*n-1 downto 0);
	 mac:	in std_logic_vector (2*n-1 downto 0);
   C:	out std_logic_vector (2*n-1 downto 0);
   D:	out std_logic_vector (2*n-1 downto 0));
end component;

signal a, b : std_logic_vector (3 downto 0);
signal op : std_logic_vector (3 downto 0);
signal ab, mac, C, D : std_logic_vector (7 downto 0);

begin
  Test: SuperMux
   generic map(4)
   port map(op,a,b,ab,mac,C,D);
    TB: process
    begin
      op <= "0110";
      a <= "0011";
      b <= "0001";
      ab <= "00001001";
      mac <= "00000110";
      wait for 5 ns;
      
      op <= "0010";
      a <= "0011";
      b <= "0001";
      ab <= "00001001";
      mac <= "00000110";
      wait;
    end process TB;
  end behav_test;
