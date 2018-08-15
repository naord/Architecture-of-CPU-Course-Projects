library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all; 

entity OR_Entity is Port(
  X : in std_logic;
  Y : in std_logic;
  ans : out std_logic);
end OR_Entity;

architecture OR_func of OR_Entity is
begin
  ans <= X OR Y;
end OR_func;
