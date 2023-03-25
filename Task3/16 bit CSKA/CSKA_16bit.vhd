LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY CSKA_16bit IS
PORT (a, b: IN SIGNED(15 DOWNTO 0);
rsn, clock: IN STD_LOGIC;
c: OUT SIGNED(15 DOWNTO 0);
ovrf: OUT STD_LOGIC);
END CSKA_16bit;

ARCHITECTURE structural OF CSKA_16bit IS

SIGNAL logic_a, logic_b, logic_c: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL swt1, swt2, swt3, swt4: STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL c4, c_out1, c8, c_out2,  c12, c_out3, c_out4: STD_LOGIC;

COMPONENT RCA_4bit IS
    PORT (SW: IN STD_LOGIC_VECTOR(8 DOWNTO 0); -- b (7 downto 4) a(3 downto 0) sw 8 for subtraction
    KEY0: IN STD_LOGIC; -- active low asynchronous reset input
    KEY1: IN STD_LOGIC; -- manual clock input
    LEDR: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
    LEDR4, LEDR9: OUT STD_LOGIC); -- overflow bit
END COMPONENT;


COMPONENT carry_prop is
	PORT (	c_in, c4	: IN	STD_LOGIC;
		c_out		: OUT	STD_LOGIC;
		a, b		: IN 	STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
END COMPONENT;

BEGIN
	logic_a <= STD_LOGIC_VECTOR(a);
	logic_b <= STD_LOGIC_VECTOR(b);
	swt1 <= ('0' & logic_b(3 DOWNTO 0) & logic_a(3 DOWNTO 0));
	swt2 <= (c4 & logic_b(7 DOWNTO 4) & logic_a(7 DOWNTO 4));
	swt3 <= (c8 & logic_b(11 DOWNTO 8) & logic_a(11 DOWNTO 8));
	swt4 <= (c12 & logic_b(15 DOWNTO 12) & logic_a(15 DOWNTO 12));
	ca0	: RCA_4bit 	PORT MAP (SW => swt1, KEY0 => rsn, KEY1 => clock, LEDR => logic_c(3 DOWNTO 0), LEDR4 => c_out1, LEDR9 => open);
	prop0	: carry_prop 	PORT MAP (c_in => swt1(8), c4 => c_out1, c_out => c4, b => swt1(7 DOWNTO 4), a => swt1(3 DOWNTO 0) );
	
	ca1	: RCA_4bit 	PORT MAP (SW =>swt2, KEY0 => rsn, KEY1 => clock, LEDR => logic_c(7 DOWNTO 4), LEDR4 => c_out2, LEDR9 => open);
	prop1	: carry_prop 	PORT MAP (c_in => swt2(8), c4 => c_out2, c_out => c8, b => swt2(7 DOWNTO 4), a => swt2(3 DOWNTO 0) );	
	
	ca2	: RCA_4bit 	PORT MAP (SW =>swt3, KEY0 => rsn, KEY1 => clock, LEDR => logic_c(11 DOWNTO 8), LEDR4 => c_out3, LEDR9 => open);
	prop2	: carry_prop 	PORT MAP (c_in => swt3(8), c4 => c_out3, c_out => c12, b => swt3(7 DOWNTO 4), a => swt3(3 DOWNTO 0) );
	
	ca3	: RCA_4bit 	PORT MAP (SW =>swt4, KEY0 => rsn, KEY1 => clock, LEDR => logic_c(15 DOWNTO 12), LEDR4 => c_out4, LEDR9 => ovrf);
	prop3	: carry_prop 	PORT MAP (c_in => swt4(8), c4 => c_out4, c_out => open, b => swt4(7 DOWNTO 4), a => swt4(3 DOWNTO 0) );


c <= SIGNED(logic_c);
END structural;
