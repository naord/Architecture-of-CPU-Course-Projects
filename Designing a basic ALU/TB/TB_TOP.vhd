library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity TB_TOP is
end TB_TOP;

architecture behav_test of TB_TOP is
component ALU_TOP
 generic (n: positive := 8);
  -- ports declerations
	port ( 
	CLK : std_logic;
	op: in std_logic_vector (3 downto 0):=(others=>'0');
  a:	in std_logic_vector (n-1 downto 0):=(others=>'0');
	b:	in std_logic_vector (n-1 downto 0):=(others=>'0');
	statusFlag:	out std_logic_vector (5 downto 0):=(others=>'0');
	hi:	out std_logic_vector(n-1 downto 0):=(others=>'0');
	lo:	out std_logic_vector(n-1 downto 0):=(others=>'0'));
end component;

constant numOfClockCounter: integer := 10000;
signal op : std_logic_vector (3 downto 0);
signal a , b: std_logic_vector (7 downto 0);
signal SFlag : std_logic_vector (5 downto 0);
signal resultHi, resultLo : std_logic_vector (7 downto 0);
signal clk :std_logic;

begin
  Test: ALU_TOP
   generic map(8)
   port map(clk,op,a,b,SFlag,resultHi,resultLo);
     
    TB: process
    begin
       --TEST 1
      op <= "0101"; --5
      a <= "00000010";
      b <= "00000010" ;
      wait for 1 ns;
      
      
      a <= "00111111";--6
      b <= "00000101";
      op <= "0110";
      wait for 1 ns;
      
      a <= "10011111";--6
      b <= "00000011";
      op <= "0110";
      wait for 1 ns;

      a <= "00001111";--7
      b <= "00001000";
      op <= "0111";
      wait for 1 ns;
      
      a <= "00001111";--7
      b <= "00000100";
      op <= "0111";
      wait for 1 ns;

      ------------------------------------------------------------------------------
      --                               SUB - TEST
      ------------------------------------------------------------------------------
       --
      op <= "1001"; 
      a <= "00000010";
      b <= "00000010" ;
      wait for 1 ns;
      
      
      op <= "1001"; 
      a <= "00000011";
      b <= "00000010" ;
      wait for 1 ns;
      

      
      op <= "1001"; 
      a <= "00000101";
      b <= "00001000" ;
      wait for 1 ns;
     
      
      op <= "1001"; 
      a <= "00000001";
      b <= "11111011" ;
      wait for 1 ns;
   

      op <= "1001"; 
      a <= "00000001";
      b <= "11111011" ;
      wait for 1 ns;
    

      
      
      ------------------------------------------------------------------------------
      --                               ADD - TEST
      ------------------------------------------------------------------------------
      op <= "1000"; 
      a <= "00000010";
      b <= "00000010" ;
      wait for 1 ns;
      
      
      op <= "1000"; 
      a <= "00000011";
      b <= "00000010" ;
      wait for 1 ns;
   

      
      op <= "1000"; 
      a <= "00000101";
      b <= "11111101" ;
      wait for 1 ns;
      
      
      op <= "1000"; 
      a <= "00000001";
      b <= "11111101" ;
      wait for 1 ns;
      

      op <= "1000"; 
      a <= "11111100";
      b <= "11111011" ;
      wait for 1 ns;
      
      
      ------------------------------------------------------------------------------
      --                               MAX - TEST
      ------------------------------------------------------------------------------
      op <= "0011"; 
      a <= "00000010";
      b <= "00000010" ;
      wait for 1 ns;
      
      
      op <= "0011"; 
      a <= "00000011";
      b <= "00000010" ;
      wait for 1 ns;
      

      
      op <= "0011"; 
      a <= "11111101";
      b <= "11111101" ;
      wait for 1 ns;
      
      
      op <= "0011";op <= "0011"; 
      a <= "00000001";
      b <= "11111101" ;
      wait for 1 ns;
     
      

      op <= "0011"; 
      a <= "11111100";
      b <= "11111011" ;
      wait for 1 ns;
      
        ------------------------------------------------------------------------------
      --                               MIN - TEST
      ------------------------------------------------------------------------------
      op <= "0100"; 
      a <= "00000010";
      b <= "00000010" ;
      wait for 1 ns;
      
      
      op <= "0100"; 
      a <= "00000011";
      b <= "00000010" ;
      wait for 1 ns;
      

      
      op <= "0100"; 
      a <= "11111101";
      b <= "11111101" ;
      wait for 1 ns;
     
      
      op <= "0100"; 
      a <= "00000001";
      b <= "11111101" ;
      wait for 1 ns;
     

      op <= "0100"; 
      a <= "11111100";
      b <= "11111011" ;
      wait for 1 ns;
      
      
      ------------------------------------------------------------------------------
      --                               MAC - TEST
      ------------------------------------------------------------------------------
      op <= "0010"; 
      a <= "00000010";
      b <= "00000010" ;
      wait for 1 ns;
     
      
      op <= "0010"; 
      a <= "00000011";
      b <= "00000010" ;
      wait for 1 ns;
     

      
      op <= "0010"; 
      a <= "11111101";
      b <= "11111101" ;
      wait for 1 ns;
      
      
      op <= "0010"; 
      a <= "00000001";
      b <= "11101101" ;
      wait for 1 ns;
     

      op <= "0010"; 
      a <= "00000001";
      b <= "11111101" ;
      wait for 1 ns;
      
      
      op <= "0101"; 
      a <= "00000001";
      b <= "11111101" ;
      wait for 1 ns;
      
      
      
      ------------------------------------------------------------------------------
      --                        ALL Combinations - TEST
      ------------------------------------------------------------------------------
      op <= "0010"; 
      a <= "00000010";
      b <= "00000010" ;
      wait for 1 ns;
      
      
      op <= "0010"; 
      a <= "00000011";
      b <= "00000010" ;
      wait for 1 ns;
      
      
      op <= "0100"; 
      a <= "00000011";
      b <= "00000010" ;
      wait for 1 ns;
      
      
      op <= "0010"; 
      a <= "11111101";
      b <= "11111101" ;
      wait for 1 ns;
      
      
      op <= "0011"; 
      a <= "00000001";
      b <= "11111101" ;
      wait for 1 ns;
      
      
      op <= "0010"; 
      a <= "00000001";
      b <= "11101101" ;
      wait for 1 ns;
      
      
      op <= "0010"; 
      a <= "00000010";
      b <= "00000010" ;
      wait for 1 ns;
     
      
      op <= "1001"; 
      a <= "00000010";
      b <= "00000010" ;
      wait for 1 ns;
     
      
      op <= "1001"; 
      a <= "00000011";
      b <= "00000010" ;
      wait for 1 ns;
      
      
      op <= "0010"; 
      a <= "00000001";
      b <= "11111101" ;
      wait for 1 ns;
    
      
      op <= "0101"; 
      a <= "00000001";
      b <= "11111101" ;
      wait for 1 ns;
      
      
      
      wait;
    end process TB;
      
    clock: process 
      begin
          clk <= '0';
              for i in 0 to numOfClockCounter loop 
                  wait for 500 ps;
                  clk <= not clk;			
              end loop;
            wait;
      end process clock;
        
    
  end behav_test;