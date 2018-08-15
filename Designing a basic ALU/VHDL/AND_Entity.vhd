library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all; 

entity AND_Entity is Port(
  X : in std_logic;
  Y : in std_logic;
  ans : out std_logic);
end AND_Entity;

architecture AND_func of AND_Entity is
begin
  ans <= X AND Y;
end AND_func;

