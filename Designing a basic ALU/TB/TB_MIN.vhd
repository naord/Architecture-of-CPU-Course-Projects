

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity TB_MIN is
end TB_MIN;

architecture behav_test of TB_MIN is
component Min_Detector 
  generic (n: positive := 8);
 port(
   A  :	in std_logic_vector (n-1 downto 0);
	 B  :	in std_logic_vector (n-1 downto 0);
	 The_Minimum:	out std_logic_vector(n-1 downto 0));
end component;

signal a,b,ans:std_logic_vector(3 downto 0);

begin
Test: Min_Detector
    generic map (4)
    port map (a,b,ans);
      
        TB:process
      begin
        a   <= "0100";
        b   <= "0010";
        wait for 5 ns;
        assert(ans="0010") report "ans error" severity error;
        
        a   <= "0100";
        b   <= "0110";
        wait for 5 ns;
        assert(ans="0100") report "ans error" severity error;
        
        a   <= "0111";
        b   <= "0111";
        wait for 5 ns;
        assert(ans="0111") report "ans error" severity error;
        
        a   <= "1111";
        b   <= "0110";
        wait for 5 ns;
        assert(ans="1111") report "ans error" severity error;
        wait;
    end process TB;
  end behav_test;

