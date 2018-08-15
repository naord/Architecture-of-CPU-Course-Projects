library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity TB_DFF is
end TB_DFF;

architecture behav_test of TB_DFF is
component DFF port(
    enable :in std_logic;
    Clk :in std_logic;  
    reset: in std_logic;  
    D :in  std_logic; 
    Q : out std_logic);
end component;

signal EN , CK, RE, D, ANS : std_logic;
begin
  Test: Xor_Entity port map (a , b , ans);
    
    TB : process
    begin
      a <= '0';
      b <= '1';
      wait for 1 ns;
      assert(ans='0') report "and error" severity error;
      
     
      wait;
    end process TB;
    
  end behav_test;
  

