LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY array_multiplier IS
PORT(SW: IN std_logic_vector(7 downto 0);
     HEX0,HEX1,HEX2,HEX3: OUT std_logic_vector(0 to 6));
END array_multiplier;

ARCHITECTURE structural OF array_multiplier IS

COMPONENT summands IS                        --call the summands
PORT(a,b: IN std_logic_vector(3 downto 0);
     s0,s1,s2,s3: OUT std_logic_vector(3 downto 0));
END component;

COMPONENT multiplier IS
PORT(sm0, sm1, sm2, sm3: IN std_logic_vector(3 downto 0); 
     p: OUT std_logic_vector(7 downto 0));
END component;

COMPONENT display_7seg IS
PORT(input: IN std_logic_vector(3 downto 0); output: OUT std_logic_vector(0 to 6));
end component;

SIGNAL prod: std_logic_vector(7 downto 0);
SIGNAL f1,f2, q0, q1, q2, q3: std_logic_vector(3 downto 0); --f1 and f2 are a and b. qi is the i-th summand
--SIGNAL disp0, disp1,disp2,disp3: std_logic_vector(6 downto 0);

BEGIN
f1 <= SW(3 downto 0); -- a
f2 <= SW(7 downto 4); -- b
SUMM: summands PORT MAP(a => f1, b => f2, s0 => q0, s1 => q1, s2 => q2, s3 => q3);
MULT: multiplier PORT MAP(sm0 => q0, sm1 => q1, sm2 => q2, sm3 => q3, p=> prod);

DECODa: display_7seg PORT MAP(input => f1, output => HEX0);
DECODb: display_7seg PORT MAP(input => f2, output => HEX1);
DECODres1: display_7seg PORT MAP(input => prod(3 downto 0), output => HEX2);
DECODres2: display_7seg PORT MAP(input => prod(7 downto 4), output => HEX3);
END structural;
