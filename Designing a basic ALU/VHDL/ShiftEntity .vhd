library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity ShiftEntity is 
  -- generic parameters decleration
	generic (n: positive :=8);
  -- ports declerations
	port (
	 op: in std_logic_vector (3 downto 0):=(others=>'0');
   a:	in std_logic_vector (n-1 downto 0):=(others=>'0');
	 b:	in std_logic_vector (n-1 downto 0):=(others=>'0');
   result:	out std_logic_vector ((2*n-1) downto 0):=(others=>'0'));
end ShiftEntity;

architecture Shift_architecture of ShiftEntity is
	-- signals decleration
	signal ans : unsigned ((2*n-1) downto 0):=(others=>'0');
	begin	
	  process(op, a, b, ans)
	     begin
	       if (op = "0110") then--110 = '6' =>SHR
	         ans(n-1 downto 0) <= shift_right (unsigned(a),conv_integer(b));
	         ans((2*n-1) downto n) <= (others => '0');
		     elsif (op = "0111") then--111 = '7' =>SHL
		       ans (n-1 downto 0) <= shift_left (unsigned(a),conv_integer(b));
		       ans((2*n-1) downto n) <= (others => '0');
			   else
			     ans (2*n-1 downto 0) <= (others => '0');--return 0
			   end if;
		end process;
		result <= std_logic_vector(ans);			
	end Shift_architecture;