library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity SuperMux is 
  -- generic parameters decleration
	generic (n: positive :=8);
  -- ports declerations
	port (
	 op: in std_logic_vector (3 downto 0);
   a:	in std_logic_vector (n-1 downto 0);
	 b:	in std_logic_vector (n-1 downto 0);
	 ab:	in std_logic_vector (2*n-1 downto 0);
	 mac:	in std_logic_vector (2*n-1 downto 0);
   C:	out std_logic_vector (2*n-1 downto 0);
   D:	out std_logic_vector (2*n-1 downto 0));
end SuperMux;

architecture Mux_architecture of SuperMux is
	-- components declaration
	-- signals decleration
	begin	
	  process(op, a, b, ab, mac)
	     begin
	       if (op = "0010") then--010 = '2' =>MAC
	         C <= ab;
	         D <= mac;
		     else
		       C((n-1) downto 0) <= a;
		       C((2*n-1) downto n) <= (others => a(n-1));
	         D((n-1) downto 0) <= b;
		       D((2*n-1) downto n) <= (others => b(n-1));
			   end if;
		end process;
					
	end Mux_architecture;