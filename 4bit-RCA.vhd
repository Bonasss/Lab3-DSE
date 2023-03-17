LIBRARY IEEE;
use IEEE.std_logic_1164.all_;

ENTITY 4bit_RCA IS
PORT (SW: IN STD_LOGIC_VECTOR(8 DOWNTO 0); -- a (7 downto 4) b(3 downto 0) sw8 subtraction
KEY0: IN STD_LOGIC; -- active low asynchronous reset input
KEY1: IN STD_LOGIC; -- manual clock input
LEDR: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
LEDR9: OUT STD_LOGIC) -- overflow bit
END 4bit_RCA;

ARCHITECTURE structural OF 4bit_RCA IS

COMPONENT regn IS
	GENERIC ( N : integer:=4); 
	PORT (R : IN SIGNED(N-1 DOWNTO 0);
	Clock, Resetn : IN STD_LOGIC; 
	Q : OUT SIGNED(N-1 DOWNTO 0));
END COMPONENT;


COMPONENT flipflop IS
PORT (D, Clock, Resetn : IN STD_LOGIC;
		Q : 					OUT STD_LOGIC);
END COMPONENT;

BEGIN
reg1:  
END structural;