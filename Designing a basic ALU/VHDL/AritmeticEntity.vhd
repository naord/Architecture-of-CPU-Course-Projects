



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity AritmeticEntity is 
  -- generic parameters decleration
	generic (n: positive := 8);
	port (
	op: in std_logic_vector (3 downto 0);
  a:	in std_logic_vector (n-1 downto 0);
	b:	in std_logic_vector (n-1 downto 0);
	clock: in std_logic;
	status:	out std_logic_vector(5 downto 0) := (others => '0');
	result:	out std_logic_vector(2*n-1 downto 0));
end AritmeticEntity;

architecture StructuralAritmetic of AritmeticEntity is
 	------ components declaration----------------
  component AddSubUnit2Compliment
  generic (n: positive := 8);
  port(
   AdderOrSubs : in std_logic;
   A : in std_logic_vector (2*n-1 downto 0);
   B : in std_logic_vector (2*n-1 downto 0);
   Answer : out std_logic_vector (2*n-1 downto 0 );
   carryOut: out std_logic);
	end component;
	
	component SuperMux
	generic (n: positive :=8);  
  port(
   op: in std_logic_vector (3 downto 0);
   a:	in std_logic_vector (n-1 downto 0);
	 b:	in std_logic_vector (n-1 downto 0);
	 ab:	in std_logic_vector (2*n-1 downto 0);
	 mac:	in std_logic_vector (2*n-1 downto 0);
   C:	out std_logic_vector (2*n-1 downto 0);
   D:	out std_logic_vector (2*n-1 downto 0));
	end component;
	
	component Multiply_Entity
	generic (n: positive :=8);
  port(
   A : in std_logic_vector (n-1 downto 0);
   B : in std_logic_vector (n-1 downto 0);
   Answer : out std_logic_vector (2*n-1 downto 0));
	end component;
	
	component Max_Detector
	generic (n: positive :=8);
  port(
   A  :	in std_logic_vector (n-1 downto 0);
	 B  :	in std_logic_vector (n-1 downto 0);
	 The_Maximum:	out std_logic_vector(n-1 downto 0));
	end component;
	
	component Min_Detector
  generic (n: positive :=8);
  port(
   A  :	in std_logic_vector (n-1 downto 0);
	 B  :	in std_logic_vector (n-1 downto 0);
	 The_Minimum:	out std_logic_vector(n-1 downto 0));
	end component;
	
	component MAC
  generic (n: positive :=8);
  port(
    toSave : in std_logic_vector (2*n-1 downto 0):=(others=>'0');
    enableM: in std_logic := '0';
    resetM : in std_logic := '0';
    clkM   : in std_logic := '0';
    Qout   : out std_logic_vector (2*n-1 downto 0):=(others=>'0'));
	end component;

	------------- signals decleration-----------------------
	signal minAns,maxAns  : std_logic_vector (n-1 downto 0);
	signal mulAns, macAns, muxAnsA, muxAnsB, addSubAns : std_logic_vector (2*n-1 downto 0);
	signal opcode : std_logic_vector (3 downto 0);
	signal addOrSub, addSubCout, macEn, macRes, aSign, bSign : std_logic;
	
	begin	
		-------- components mapping-------------
		Mux	:	SuperMux
			generic map (n)
			port map (op,a,b,mulAns,macAns,muxAnsA,muxAnsB);
      
    AddSub	: AddSubUnit2Compliment
      generic map (n)
			port map (addOrSub,muxAnsA,muxAnsB,addSubAns,addSubCout);
			  
		Mul	: Multiply_Entity
      generic map (n)
			port map (a,b,mulAns);
			
		Max :	Max_Detector
      generic map (n)
			port map (a,b,maxAns);
			  
		Min :	Min_Detector
      generic map (n)
			port map (a,b,minAns);
			 
		Mac1:	MAC
      generic map (n)
			port map (addSubAns,macEn,macRes,clock,macAns); 
		
		process(op,addOrSub,addSubCout,macEn,macRes,mulAns,minAns,maxAns,macAns,muxAnsA,muxAnsB,addSubAns,aSign, bSign)
      variable resultVal : integer;
      begin
        case op is
          when "0001" => --1 Mul
             macRes <= '0';
             macEn <= '0';
             result <= mulAns;
          when "0010" =>  --2 Mac
              macEn <= '1';
              macRes <= '0';
		          addOrSub <= '0';
		          result <= macAns;
          when "0011" =>--3 Max
             macRes <= '0';
             macEn <= '0';
             result <= std_logic_vector(resize(signed(maxAns),result'length));
          when "0100" =>--4 Min
             macRes <= '0';
             macEn <= '0';
             result <= std_logic_vector(resize(signed(minAns),result'length));
          when "0101" => --5 MacReset
             macEn <= '0';
             macRes <= '1';
		         result <= macAns;
          when "1000" => --8 Add
             macRes <= '0';
             macEn <= '0';
     		      addOrSub <= '0';
		         result <= addSubAns;
          when "1001" =>--9 Sub
             macRes <= '0';
             macEn <= '0';
             aSign <= a(n-1);
             bSign <= b(n-1);
    		       addOrSub <= '1';
		         result <= addSubAns;
		         resultVal := to_integer(signed(addSubAns));
		         if( resultVal = 0) then
		            status <= "101010";
		         elsif( addSubAns(2*n-1) = '0' ) then
		              status <= "011100";   
		         else 
		              status <= "011100";
		         end if;     
          when others =>
                       macRes <= '0';
                       macEn <= '0';
                       result ((2*n-1) downto 0) <= (others => '0');--return 0
        end case;
    end process;
	end StructuralAritmetic;