LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY RCA_4bit IS
	PORT (SW: IN STD_LOGIC_VECTOR(8 DOWNTO 0); -- b (7 downto 4) a(3 downto 0) sw 8 for subtraction
	KEY0: IN STD_LOGIC; -- active low asynchronous reset input
	KEY1: IN STD_LOGIC; -- manual clock input
	LEDR: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
	LEDR9: OUT STD_LOGIC); -- overflow bit
END RCA_4bit;

ARCHITECTURE structural OF RCA_4bit IS
SIGNAL a, q1, b, q2, c, q3: SIGNED(3 DOWNTO 0);
SIGNAL cn, cn1: STD_LOGIC;

COMPONENT regn IS
	GENERIC ( N : integer:=4); 
	PORT (R : IN SIGNED(N-1 DOWNTO 0);
	Clock, Resetn : IN STD_LOGIC; 
	Q : OUT SIGNED(N-1 DOWNTO 0));
END COMPONENT;


COMPONENT flipflop IS
	PORT (D, Clock, Resetn : IN STD_LOGIC;
	Q : OUT STD_LOGIC);
END COMPONENT;

COMPONENT signed_adder IS
	PORT (in1, in2: IN SIGNED(3 DOWNTO 0);
	cin: IN STD_LOGIC;
	cout, sgn: OUT STD_LOGIC;
	s: OUT SIGNED(3 DOWNTO 0));
END COMPONENT;

BEGIN
	a<=SIGNED(SW(3 DOWNTO 0));
	PROCESS(SW, b)
		BEGIN
		IF SW(8) = '1' THEN
		b<=SIGNED(SW(7 DOWNTO 4));
		b<=-b;
		ELSE
		b<=SIGNED(SW(7 DOWNTO 4));
		END IF;
	END PROCESS;
	regA:  regn PORT MAP (R => a, Clock => KEY1, Resetn => KEY0, Q =>q1);
	regB:  regn PORT MAP (R => b, Clock => KEY1, Resetn => KEY0, Q =>q2);
	regC:  regn PORT MAP (R => c, Clock => KEY1, Resetn => KEY0, Q =>q3);
	rca: signed_adder PORT MAP (in1=>q1, in2=>q2, cin=>'0', cout=>cn, sgn=> cn1, s=>c);
	LEDR9 <= (cn XOR cn1);
	LEDR<=STD_LOGIC_VECTOR(q3);
END structural;