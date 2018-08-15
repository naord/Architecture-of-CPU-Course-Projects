library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all; 
use IEEE.numeric_std.all;

entity Multiply_Entity is 
  generic( n : positive := 8);
  port(
     A : in std_logic_vector (n-1 downto 0);
     B : in std_logic_vector (n-1 downto 0);
     Answer : out std_logic_vector (2*n-1 downto 0));
  end Multiply_Entity;
  
architecture Mul_func of Multiply_Entity is
 begin
   Answer <= std_logic_vector(signed(A) * signed(B));
    
end Mul_func;
