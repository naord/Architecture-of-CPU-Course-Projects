library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity TB_Add is
end TB_Add;

architecture behav_test of TB_Add is
component AddSubUnit2Compliment  
  generic (n : integer := 8);
  Port(
    AdderOrSubs : in std_logic;
    A : in std_logic_vector (2*n-1 downto 0);
    B : in std_logic_vector (2*n-1 downto 0);
    Answer : out std_logic_vector (2*n-1 downto 0);
    carryOut : out std_logic);
  end component;
  
  signal a,b:std_logic_vector(3 downto 0);
  signal sum:std_logic_vector(3 downto 0);
  signal sub,Cout:std_logic;
  begin
    Test: AddSubUnit2Compliment
    generic map (2)
    port map (sub,a,b,sum,Cout);
      
      TB:process
      begin
        a   <= "0010";
        b   <= "0010";
        sub <= '0';
        wait for 2 ns;
        assert(sum="0100") report "sum error" severity error;
        
        a   <= "0010";
        b   <= "0010";
        sub <= '1';
        wait for 2 ns;
        assert(sum="0000") report "sum error" severity error;
        
        a   <= "0110";
        b   <= "0010";
        sub <= '1';
        wait for 2 ns;
        assert(sum="0100") report "sum error" severity error;
        
        a   <= "0001";
        b   <= "0011";
        sub <= '1';
        wait for 2 ns;
        assert(sum="1110") report "sum error" severity error;
        wait;
      end process TB;
    end behav_test;
