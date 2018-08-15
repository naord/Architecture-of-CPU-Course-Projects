library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity TB_shift is
end TB_shift;

architecture behav_test of TB_shift is
component ShiftEntity
 generic (n: positive :=8);
 Port(
  op: in std_logic_vector (3 downto 0):=(others=>'0');
   a:	in std_logic_vector (n-1 downto 0):=(others=>'0');
	 b:	in std_logic_vector (n-1 downto 0):=(others=>'0');
   result:	out std_logic_vector ((2*n-1) downto 0):=(others=>'0'));
end component;

signal a, b : std_logic_vector (3 downto 0);
signal op : std_logic_vector (3 downto 0);
signal ans : std_logic_vector (7 downto 0);

begin
  Test: ShiftEntity
   generic map(4)
   port map(op,a,b,ans);
    TB: process
    begin
      a <= "0011";
      b <= "0001";
      op <= "0110";
      wait for 10 ns;
      assert( ans = "0101") report "and error" severity error;
      
      a <= "0011";
      b <= "0010";
      op <= "0110";
      wait for 10 ns;
      assert( ans = "0101") report "and error" severity error;
      
      a <= "0011";
      b <= "0001";
      op <= "0111";
      wait for 10 ns;
      assert( ans = "0101") report "and error" severity error;

      a <= "0011";
      b <= "0010";
      op <= "0111";
      wait for 10 ns;
      assert( ans = "0101") report "and error" severity error;

      wait;
    end process TB;
  end behav_test;