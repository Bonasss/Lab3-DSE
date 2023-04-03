LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY logic_adder IS
	PORT (in1, in2: IN std_logic_vector(3 DOWNTO 0);
	cin: IN STD_LOGIC;
	cout: OUT STD_LOGIC;
	s: OUT std_logic_vector(3 DOWNTO 0));
END logic_adder;

ARCHITECTURE structural OF logic_adder IS
    SIGNAL co1, co2, co3: std_logic;
    
    COMPONENT full_adder IS
    PORT(a, b, ci: IN std_logic; 
    sum, co: OUT std_logic);
    end component;

BEGIN
    fa0: full_adder PORT MAP(a => in1(0), b=> in2(0), ci => cin,  sum => s(0), co => co1);
    fa1: full_adder PORT MAP(a => in1(1), b=> in2(1), ci => co1,  sum => s(1), co => co2);
    fa2: full_adder PORT MAP(a => in1(2), b=> in2(2), ci => co2,  sum => s(2), co => co3);
    fa3: full_adder PORT MAP(a => in1(3), b=> in2(3), ci => co3,  sum => s(3), co => cout);
END structural;