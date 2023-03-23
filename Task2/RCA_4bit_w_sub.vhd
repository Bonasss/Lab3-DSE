LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY RCA_4bit_w_sub IS
	PORT (SW: IN STD_LOGIC_VECTOR(8 DOWNTO 0); -- b (7 downto 4) a(3 downto 0) sw 8 for subtraction
	KEY: IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- active low asynchronous reset input  -- manual clock input
	LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)); --  RES AND overflow bit
END RCA_4bit_w_sub;

ARCHITECTURE structural OF RCA_4bit_w_sub IS

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
	b<=SIGNED(SW(7 DOWNTO 4));
	regA:  regn PORT MAP (R => a, Clock => KEY(1), Resetn => KEY(0), Q =>q1);
	regB:  regn PORT MAP (R => b, Clock => KEY(1), Resetn => KEY(0), Q =>q2);
	regC:  regn PORT MAP (R => c, Clock => KEY(1), Resetn => KEY(0), Q =>q3);
	rca: signed_adder PORT MAP (in1=>q1, in2=>q2, cin=>SW(8), cout=>cn, sgn=> cn1, s=>c);
	LEDR(9) <= (cn XOR cn1);
	LEDR(8 DOWNTO 4)<="00000";
	LEDR(3 DOWNTO 0)<=STD_LOGIC_VECTOR(q3);
END structural;