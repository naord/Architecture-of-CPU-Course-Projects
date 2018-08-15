library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all; 

entity XOR_Entity is Port(
  X : in std_logic;
  Y : in std_logic;
  ans : out std_logic);
end XOR_Entity;

architecture XOR_func of XOR_Entity is
begin
  ans <= X XOR Y;
end XOR_func;