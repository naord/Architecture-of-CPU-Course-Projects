
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity TB_FullAdder is
end TB_FullAdder;

architecture behav_test of TB_FullAdder is
component Full_Adder_Entity Port(
 X : in std_logic;
 Y : in std_logic;
 Cin : in std_logic;
 S : out std_logic;
 Cout : out std_logic);
end component;

signal a , b, ans, CarryOut , CarryIn : std_logic;
begin
  Test: Full_Adder_Entity port map(a,b,CarryIn,ans,CarryOut);
    TB: process
    begin
      a <= '1';
      b <= '1';
      CarryIn <= '1';
      wait for 10 ns;
      assert(ans='1') report "and error" severity error;
      assert(CarryOut='1') report "and error" severity error;
      
      a <= '0';
      b <= '1';
      CarryIn <= '1';
      wait for 10 ns;
      assert(ans='1') report "and error 1" severity error;
      assert(CarryOut='0') report "and error 2" severity error;
      
      a <= '1';
      b <= '1';
      CarryIn <= '0';
      wait for 10 ns;
      assert(ans='1') report "and error 1" severity error;
      assert(CarryOut='0') report "and error 2" severity error;
      
      a <= '0';
      b <= '0';
      CarryIn <= '0';
      wait for 10 ns;
      assert(ans='0') report "and error 1" severity error;
      assert(CarryOut='0') report "and error 2" severity error;
      wait;
    end process TB;
  end behav_test; 