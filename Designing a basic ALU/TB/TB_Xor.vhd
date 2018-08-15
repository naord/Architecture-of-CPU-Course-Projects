library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity TB_Xor is
end TB_Xor;

architecture behav_test of TB_Xor is
component Xor_Entity port(
  X : in std_logic;
  Y : in std_logic;
  ans : out std_logic);
end component;

signal a , b, ans : std_logic;
begin
  Test: Xor_Entity port map (a , b , ans);
    
    TB : process
    begin
      a <= '0';
      b <= '1';
      wait for 1 ns;
      assert(ans='0') report "and error" severity error;
      
      a <= '1';
      b <= '1';
      wait for 1 ns;
      assert(ans='0') report "and error" severity error;
      wait;
    end process TB;
    
  end behav_test;
  
