library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all; 

entity Full_Adder_Entity is Port(
 X : in std_logic;
 Y : in std_logic;
 Cin : in std_logic;
 S : out std_logic;
 Cout : out std_logic);
end Full_Adder_Entity;
 
architecture FullAdderArchi of Full_Adder_Entity is
 -- components declaration
 component XOR_Entity Port(
   X : in std_logic;
   Y : in std_logic;
   ans : out std_logic);
 end component;

 component OR_Entity Port(
   X : in std_logic;
   Y : in std_logic;
   ans : out std_logic);
 end component;
 
 component AND_Entity Port(
   X : in std_logic;
   Y : in std_logic;
   ans : out std_logic);
 end component;
 
 signal xor1, xor2, and1, and2, or1 : std_logic;

begin
  xor_gate  : XOR_Entity port map(X,Y,xor1);      -- X XOR Y = A
  xor_gate1 : XOR_Entity port map(xor1,Cin,xor2); -- A XOR Cin = S
  and_gate  : AND_Entity port map(X,Y,and1);      -- X AND Y = and1
  and_gate1 : AND_Entity port map(Cin,xor1,and2); -- Cin AND (X XOR Y) = C
  or_gate   : OR_Entity  port map(and1,and2,or1); -- and1 OR C = Cout
  S     <= xor2;
  Cout  <= or1;

end FullAdderArchi;
