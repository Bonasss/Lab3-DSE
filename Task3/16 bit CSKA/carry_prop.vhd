LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY carry_prop IS
	PORT (  c_in, c4: IN	STD_LOGIC;
		c_out	: OUT	STD_LOGIC;
		a, b	: IN 	STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
END carry_prop;


ARCHITECTURE dataflow of carry_prop IS
	SIGNAL p : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL prop : STD_LOGIC;
	
	
	
	BEGIN
		p(0)  <=  (a(0) XOR b(0));
		p(1)  <=  (a(1) XOR b(1));
		p(2)  <=  (a(2) XOR b(2));
		p(3)  <=  (a(3) XOR b(3));
		
		prop <= (p(0) AND p(1) AND p(2) AND p(3) AND c_in);
		 
		c_out<=(prop OR c4);
	END dataflow;
