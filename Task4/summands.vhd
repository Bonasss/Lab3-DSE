LIBRARY ieee;
USE ieee.std_logic_1164.all;

--define the summands

ENTITY summands IS
PORT(a,b: IN std_logic_vector(3 downto 0);
     s0,s1,s2,s3: OUT std_logic_vector(3 downto 0)); -- output the 4 summands
END summands;

ARCHITECTURE dataflow OF summands IS
BEGIN
s0 <= "0000" WHEN (b(0) = '0') ELSE a;
s1 <= "0000" WHEN (b(1) = '0') ELSE a;
s2 <= "0000" WHEN (b(2) = '0') ELSE a;
s3 <= "0000" WHEN (b(3) = '0') ELSE a;
END dataflow;

