library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;


entity ALU_TOP is 
  -- generic parameters decleration
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
end ALU_TOP;

architecture ALUarchitecture of ALU_TOP is
	-- components declaration
	component AritmeticEntity is
		generic (n: positive :=8);
		port (
      op: in std_logic_vector (3 downto 0);
      a:	in std_logic_vector (n-1 downto 0);
     	b:	in std_logic_vector (n-1 downto 0);
	    clock: in std_logic;
	    status:	out std_logic_vector(5 downto 0) := (others => '0');
	    result:	out std_logic_vector(2*n-1 downto 0));
		end component;

	component ShiftEntity is
		generic (n: positive :=8);
		port (
      op: in std_logic_vector (3 downto 0);
      a:	in std_logic_vector (n-1 downto 0);
	    b:	in std_logic_vector (n-1 downto 0);
      result:	out std_logic_vector ((2*n-1) downto 0));
	end component;
	
	component SelectorEntity is
		generic (n: positive :=8);
		 port (
	     op: in std_logic_vector (3 downto 0);
       aritmetic:	in std_logic_vector (2*n-1 downto 0);
	     shift:	in std_logic_vector (2*n-1 downto 0);
	     ArStatus:	in std_logic_vector(5 downto 0);
	     SelStatus:	out std_logic_vector(5 downto 0):=(others=>'0');
	     lo:	out std_logic_vector(n-1 downto 0);
	     hi:	out std_logic_vector(n-1 downto 0));
	end component;

	-- signals decleration
	signal aritmeticOut, shiftOut: std_logic_vector(2*n-1 downto 0);
	signal aritmeticSigOut : std_logic_vector(5 downto 0);
	begin	
	  
		-- components mapping
		ARITMETIC	:	AritmeticEntity
			generic map (n)
			port map (op, a, b,CLK ,aritmeticSigOut, aritmeticOut);
			
		SHIFT	:	ShiftEntity
			generic map (n)
			port map (op, a, b, shiftOut);
			  
		SELECTOR	:	SelectorEntity
			generic map (n)
			port map (op, aritmeticOut, shiftOut, aritmeticSigOut,statusFlag,lo,hi);
				
	end ALUarchitecture;