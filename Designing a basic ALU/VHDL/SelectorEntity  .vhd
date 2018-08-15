library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity SelectorEntity is 
  -- generic parameters decleration
	generic (n: positive := 8);
	port (
	op: in std_logic_vector (3 downto 0):=(others=>'0');
  aritmetic:	in std_logic_vector (2*n-1 downto 0):=(others=>'0');
	shift:	in std_logic_vector (2*n-1 downto 0):=(others=>'0');
	ArStatus:	in std_logic_vector(5 downto 0):=(others=>'0');
	SelStatus:	out std_logic_vector(5 downto 0):=(others=>'0');
	lo:	out std_logic_vector(n-1 downto 0):=(others=>'0');
	hi:	out std_logic_vector(n-1 downto 0):=(others=>'0'));
end SelectorEntity;

architecture StructuralSelector of SelectorEntity is
 	------ components declaration----------------
	------------- signals decleration-----------------------
	begin	
		-------- components mapping-------------
		process(op,aritmetic,shift,ArStatus)
      begin
        case op is
          when "0001" => --1 Mul
             lo <= aritmetic(n-1 downto 0);
             hi <= aritmetic(2*n-1 downto n);
             SelStatus <= (others=>'0');
          when "0010" =>  --2 Mac
             lo <= aritmetic(n-1 downto 0);
             hi <= aritmetic(2*n-1 downto n);
             SelStatus <= (others=>'0'); 
          when "0011" =>--3 Max
             lo <= aritmetic(n-1 downto 0);
             hi <= aritmetic(2*n-1 downto n);
             SelStatus <= (others=>'0');
          when "0100" =>--4 Min
             lo <= aritmetic(n-1 downto 0);
             hi <= aritmetic(2*n-1 downto n);
          when "0101" => --5 MacReset
             lo <= aritmetic(n-1 downto 0);
             hi <= aritmetic(2*n-1 downto n);
             SelStatus <= (others=>'0');
          when "0110" =>--6 Shr
             lo <= shift(n-1 downto 0);
             hi <= shift(2*n-1 downto n);
             SelStatus <= (others=>'0');
          when "0111" => --7 Shl
             lo <= shift(n-1 downto 0);
             hi <= shift(2*n-1 downto n);
             SelStatus <= (others=>'0');
          when "1000" => --8 Add
   		        lo <= aritmetic(n-1 downto 0);
             hi <= aritmetic(2*n-1 downto n);
             SelStatus <= (others=>'0');
          when "1001" =>--9 Sub
		         lo <= aritmetic(n-1 downto 0);
             hi <= aritmetic(2*n-1 downto n);
             SelStatus <= ArStatus;
          when others =>
             lo <= (others => '0');--return 0
             hi <= (others => '0');--return 0
             SelStatus <= (others=>'0');
        end case;
    end process;
	end StructuralSelector;
