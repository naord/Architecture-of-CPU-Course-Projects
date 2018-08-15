library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all; 

entity AddSubUnit2Compliment is 
  generic (n : integer := 8);
  Port(
    AdderOrSubs : in std_logic;
    A : in std_logic_vector (2*n-1 downto 0);
    B : in std_logic_vector (2*n-1 downto 0);
    Answer : out std_logic_vector (2*n-1 downto 0);
    carryOut : out std_logic);
  end AddSubUnit2Compliment;

architecture behavior of AddSubUnit2Compliment is
  
  --****************** 
  --                   components declaration
  --****************** 
  
  component  Full_Adder_Entity Port(
    X : in std_logic;
    Y : in std_logic;
    Cin : in std_logic;
    S : out std_logic;
    Cout : out std_logic);
  end component;
  
  component AND_Entity Port(
   X : in std_logic;
   Y : in std_logic;
   ans : out std_logic);
  end component;
  
  component XOR_Entity Port(
   X : in std_logic;
   Y : in std_logic;
   ans : out std_logic);
  end component;
  
  --****************** 
  --                   signal declaration
  --******************
  
  signal carry : std_logic_vector (2*n downto 0);
  signal Yxor : std_logic_vector(2*n-1 downto 0);
  signal add_or_sub : std_logic;
  
  
  begin
      --If we want to subtract we need to add 1 to the 1's complement of B.
      add_or_sub <= AdderOrSubs;
      carry(0) <= add_or_sub;
      
      Full_Adder_Chain_1 : for i in 0 to (2*n-1) generate
      --If we want to subtract we need to flip all B's bit.
      --We will do this with xor and 'AdderOrSubs' bit.
      add_or_sub_1: XOR_Entity port map(
          X=>B(i),
          Y=>add_or_sub,
          ans=>Yxor(i));
      --connect all the full adder in chain
          Full_Adder_Chain_i : Full_Adder_Entity port map(
              X=>A(i) ,
              Y=>Yxor(i) ,
              Cin=>carry(i),
              S=>Answer(i),
              Cout=>carry(i+1));
      end generate;
      carryOut <= carry(2*n-1);
      
end behavior;