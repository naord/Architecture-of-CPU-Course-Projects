library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity TB_Aritmetic is
end TB_Aritmetic;

architecture behav_test of TB_Aritmetic is
component AritmeticEntity
	generic (n: positive := 8);
	port (
	op: in std_logic_vector (3 downto 0);
  a:	in std_logic_vector (n-1 downto 0);
	b:	in std_logic_vector (n-1 downto 0);
	clock: in std_logic;
	status:	out std_logic_vector(5 downto 0) := (others => '0');
	result:	out std_logic_vector(2*n-1 downto 0));
end component;

constant numOfClockCounter: integer := 10000;
signal op : std_logic_vector (3 downto 0);
signal a , b: std_logic_vector (7 downto 0);
signal result : std_logic_vector (15 downto 0);
signal status:	 std_logic_vector(5 downto 0);
signal clk :std_logic;

begin
  Test: AritmeticEntity
   generic map(8)
   port map(op,a,b,clk,status,result);
     
    TB: process
    begin
      ------------------------------------------------------------------------------
      --                               SUB - TEST
      ------------------------------------------------------------------------------
       --
      op <= "1001"; 
      a <= "00000010";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00000000") report "ans error" severity error;
      
      op <= "1001"; 
      a <= "00000011";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00000001") report "ans error" severity error;

      
      op <= "1001"; 
      a <= "00000101";
      b <= "00001000" ;
      wait for 1 ns;
      assert(result="11111101") report "ans error" severity error;
      
      op <= "1001"; 
      a <= "00000001";
      b <= "11111011" ;
      wait for 1 ns;
      assert(result="00000100") report "ans error" severity error;

      op <= "1001"; 
      a <= "00000001";
      b <= "11111011" ;
      wait for 1 ns;
      assert(result="00000100") report "ans error" severity error;

      
      
      ------------------------------------------------------------------------------
      --                               ADD - TEST
      ------------------------------------------------------------------------------
      op <= "1000"; 
      a <= "00000010";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00000100") report "ans error" severity error;
      
      op <= "1000"; 
      a <= "00000011";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00000101") report "ans error" severity error;

      
      op <= "1000"; 
      a <= "00000101";
      b <= "11111101" ;
      wait for 1 ns;
      assert(result="00000000") report "ans error" severity error;
      
      op <= "1000"; 
      a <= "00000001";
      b <= "11111101" ;
      wait for 1 ns;
      assert(result="11111100") report "ans error" severity error;

      op <= "1000"; 
      a <= "11111100";
      b <= "11111011" ;
      wait for 1 ns;
      assert(result="11110111") report "ans error" severity error;
      
      ------------------------------------------------------------------------------
      --                               MAX - TEST
      ------------------------------------------------------------------------------
      op <= "0011"; 
      a <= "00000010";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00000010") report "ans error" severity error;
      
      op <= "0011"; 
      a <= "00000011";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00000011") report "ans error" severity error;

      
      op <= "0011"; 
      a <= "11111101";
      b <= "11111101" ;
      wait for 1 ns;
      assert(result="11111101") report "ans error" severity error;
      
      op <= "0011";op <= "0011"; 
      a <= "00000001";
      b <= "11111101" ;
      wait for 1 ns;
      assert(result="00000001") report "ans error" severity error; 
      

      op <= "0011"; 
      a <= "11111100";
      b <= "11111011" ;
      wait for 1 ns;
      assert(result="11111100") report "ans error" severity error;
        ------------------------------------------------------------------------------
      --                               MIN - TEST
      ------------------------------------------------------------------------------
      op <= "0100"; 
      a <= "00000010";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00000010") report "ans error" severity error;
      
      op <= "0100"; 
      a <= "00000011";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00000010") report "ans error" severity error;

      
      op <= "0100"; 
      a <= "11111101";
      b <= "11111101" ;
      wait for 1 ns;
      assert(result="11111101") report "ans error" severity error;
      
      op <= "0100"; 
      a <= "00000001";
      b <= "11111101" ;
      wait for 1 ns;
      assert(result="11111101") report "ans error" severity error;

      op <= "0100"; 
      a <= "11111100";
      b <= "11111011" ;
      wait for 1 ns;
      assert(result="11111011") report "ans error" severity error;
      
      ------------------------------------------------------------------------------
      --                               MAC - TEST
      ------------------------------------------------------------------------------
      op <= "0010"; 
      a <= "00000010";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00000100") report "ans error" severity error;
      
      op <= "0010"; 
      a <= "00000011";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00001010") report "ans error" severity error;

      
      op <= "0010"; 
      a <= "11111101";
      b <= "11111101" ;
      wait for 1 ns;
      assert(result="00010011") report "ans error" severity error;
      
      op <= "0010"; 
      a <= "00000001";
      b <= "11101101" ;
      wait for 1 ns;
      assert(result="00000000") report "ans error" severity error;

      op <= "0010"; 
      a <= "00000001";
      b <= "11111101" ;
      wait for 1 ns;
      assert(result="11111101") report "ans error" severity error;
      
      op <= "0101"; 
      a <= "00000001";
      b <= "11111101" ;
      wait for 1 ns;
      assert(result="00000000") report "ans error" severity error;
      
      
      ------------------------------------------------------------------------------
      --                        ALL Combinations - TEST
      ------------------------------------------------------------------------------
      op <= "0010"; 
      a <= "00000010";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00000100") report "ans error" severity error;
      
      op <= "0111"; 
      a <= "00110000";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00000001") report "ans error" severity error;
      
      op <= "0010"; 
      a <= "00000011";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00001010") report "ans error" severity error;
      
      op <= "0100"; 
      a <= "00000011";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00000010") report "ans error" severity error;
      
      op <= "0010"; 
      a <= "11111101";
      b <= "11111101" ;
      wait for 1 ns;
      assert(result="00010011") report "ans error" severity error;
      
      op <= "0011"; 
      a <= "00000001";
      b <= "11111101" ;
      wait for 1 ns;
      assert(result="00000001") report "ans error" severity error;
      
      op <= "0010"; 
      a <= "00000001";
      b <= "11101101" ;
      wait for 1 ns;
      assert(result="00000000") report "ans error" severity error;
      
      op <= "0010"; 
      a <= "00000010";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00000100") report "ans error" severity error;
      
      op <= "1001"; 
      a <= "00000010";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00000000") report "ans error" severity error;
      
      op <= "0110"; 
      a <= "00000011";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00000001") report "ans error" severity error;
       
      op <= "1001"; 
      a <= "00000011";
      b <= "00000010" ;
      wait for 1 ns;
      assert(result="00000001") report "ans error" severity error;
      
      op <= "0010"; 
      a <= "00000001";
      b <= "11111101" ;
      wait for 1 ns;
      assert(result="11111101") report "ans error" severity error;
      
      op <= "0101"; 
      a <= "00000001";
      b <= "11111101" ;
      wait for 1 ns;
      assert(result="00000000") report "ans error" severity error;
      
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