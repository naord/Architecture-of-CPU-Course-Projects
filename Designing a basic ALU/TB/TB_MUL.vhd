library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity TB_MUL is
end TB_MUL;

architecture behavior of TB_MUL is
component Multiply_Entity  
  generic (n : integer := 8);
  Port(
    A : in std_logic_vector (n-1 downto 0);
    B : in std_logic_vector (n-1 downto 0);
    Answer : out std_logic_vector (2*n-1 downto 0));
  end component;
  
signal a,b:std_logic_vector(3 downto 0);
  signal sum:std_logic_vector(7 downto 0);
  
  begin
    Test: Multiply_Entity
    generic map (4)
    port map (a,b,sum);
      
TB:process
      begin
        a   <= "0010";
        b   <= "0010";
        wait for 2 ns;
        assert(sum="0100") report "sum error" severity error;
        
        a   <= "0000";
        b   <= "0010";
        wait for 2 ns;
        assert(sum="0000") report "sum error" severity error;
        
        a   <= "0011";
        b   <= "0010";
        wait for 2 ns;
        assert(sum="0110") report "sum error" severity error;
       
        a   <= "0011";
        b   <= "0011";
        wait for 2 ns;
        assert(sum="0110") report "sum error" severity error;
        
        
        wait;
      end process TB;
    end behavior;