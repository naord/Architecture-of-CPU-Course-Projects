
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity TB_selector is
end TB_selector;

architecture behav_test of TB_selector is
component SelectorEntity
 generic (n: positive := 8);
	port (
	op: in std_logic_vector (3 downto 0):=(others=>'0');
  aritmetic:	in std_logic_vector (2*n-1 downto 0):=(others=>'0');
	shift:	in std_logic_vector (2*n-1 downto 0):=(others=>'0');
	ArStatus:	in std_logic_vector(5 downto 0):=(others=>'0');
	SelStatus:	out std_logic_vector(5 downto 0):=(others=>'0');
	lo:	out std_logic_vector(n-1 downto 0):=(others=>'0');
	hi:	out std_logic_vector(n-1 downto 0):=(others=>'0'));
end component;

signal aritmetic, shift : std_logic_vector (7 downto 0);
signal op : std_logic_vector (3 downto 0);
signal ArStatus, status :	std_logic_vector(5 downto 0);
signal low, high: std_logic_vector(3 downto 0);

begin
  Test: SelectorEntity
   generic map(4)
   port map(op,aritmetic,shift,ArStatus,status,low, high);
    TB: process
    begin
      aritmetic <= "01011111";
      shift <= "00000001";
      op <= "0001";
      ArStatus <= "011001";
      wait for 2 ns;
      
      aritmetic <= "11111111";
      shift <= "00000001";
      op <= "0010";
      ArStatus <= "011001";
      wait for 2 ns;
      
      aritmetic <= "11111111";
      shift <= "00000001";
      op <= "0011";
      ArStatus <= "011001";
      wait for 2 ns;
      
      aritmetic <= "11111111";
      shift <= "00000001";
      op <= "0100";
      ArStatus <= "011001";
      wait for 2 ns;
      
      aritmetic <= "11111111";
      shift <= "00000001";
      op <= "0101";
      ArStatus <= "011001";
      wait for 2 ns;
      
      aritmetic <= "11111111";
      shift <= "00000001";
      op <= "0110";
      ArStatus <= "011001";
      wait for 2 ns;
      
      aritmetic <= "11111111";
      shift <= "00000001";
      op <= "0111";
      ArStatus <= "011001";
      wait for 2 ns;
      
      aritmetic <= "11111111";
      shift <= "00000001";
      op <= "1000";
      ArStatus <= "011001";
      wait for 2 ns;
      
      aritmetic <= "11111111";
      shift <= "00000001";
      op <= "1001";
      ArStatus <= "011001";
      wait for 2 ns;
        
      wait;
    end process TB;
  end behav_test;