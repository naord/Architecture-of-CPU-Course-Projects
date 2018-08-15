
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity TB_MAC is
end TB_MAC;

architecture behavior of TB_MAC is
  component MAC 
  generic (n: positive := 8);
  port(
    toSave : in std_logic_vector (2*n-1 downto 0);
    enableM: in std_logic;
    resetM : in std_logic;
    clkM    : in std_logic;
    Qout   : out std_logic_vector (2*n-1 downto 0));
  end component;
  
  constant numOfClockCounter: integer := 1000;
  signal Cin , ANS : std_logic_vector(3 downto 0);
  signal EN , CLK , RESET : std_logic;
  begin
  Test: MAC
    generic map (2)
    port map (Cin,EN,RESET,CLK,ANS);
      
  TB:process
    begin 
      
      Cin   <= "0000";
      EN    <= '1';
      RESET <= '1';
      wait for 1 ns;
      assert(ANS="0000") report "sum error" severity error;
      
      Cin   <= "0000";
      EN    <= '1';
      RESET <= '0';
      wait for 1 ns;
      assert(ANS="0000") report "sum error" severity error;
  
      Cin   <= "0001";
      EN    <= '1';
      RESET <= '0';
      wait for 1 ns;
      assert(ANS="0000") report "sum error" severity error;

      Cin   <= "0001";
      EN    <= '1';
      RESET <= '0';
      wait for 1 ns;
      assert(ANS="0001") report "sum error" severity error;
      
      Cin   <= "0010";
      EN    <= '1';
      RESET <= '0';
      wait for 1 ns;
      assert(ANS="0001") report "sum error" severity error;
  
      Cin   <= "0010";
      EN    <= '1';
      RESET <= '0';
      wait for 1 ns;
      assert(ANS="0010") report "sum error" severity error;

      Cin   <= "0011";
      EN    <= '1';
      RESET <= '0';
      wait for 1 ns;
      assert(ANS="0010") report "sum error" severity error;
      
      Cin   <= "0011";
      EN    <= '1';
      RESET <= '0';
      wait for 1 ns;
      
      Cin   <= "0100";
      EN    <= '1';
      RESET <= '1';
      wait for 1 ns;
      assert(ANS="0100") report "sum error" severity error;
      
      Cin   <= "0100";
      EN    <= '1';
      RESET <= '1';
      wait for 1 ns;
      assert(ANS="0000") report "sum error" severity error;

      wait;
      end process TB;
      
      
       clock: process 
      begin
          CLK <= '0';
              for i in 0 to numOfClockCounter loop 
                  wait for 10 ps;
                  CLK <= not CLK;			
              end loop;
            wait;
      end process clock;
      
      
  end behavior;
  
  
  
  
  
  
  
  
  