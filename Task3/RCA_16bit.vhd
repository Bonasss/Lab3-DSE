LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY RCA_16bit IS
PORT (a, b: IN SIGNED(15 DOWNTO 0);
rsn, clock: IN STD_LOGIC;
c: OUT SIGNED(15 DOWNTO 0);
ovrf: OUT STD_LOGIC);
END RCA_16bit;

ARCHITECTURE structural OF RCA_16bit IS

SIGNAL logic_a, logic_b, logic_c: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL c4, c8, c12: STD_LOGIC;

COMPONENT RCA_4bit IS
    PORT (SW: IN STD_LOGIC_VECTOR(8 DOWNTO 0); -- b (7 downto 4) a(3 downto 0) sw 8 for subtraction
    KEY0: IN STD_LOGIC; -- active low asynchronous reset input
    KEY1: IN STD_LOGIC; -- manual clock input
    LEDR: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
    LEDR4, LEDR9: OUT STD_LOGIC); -- overflow bit
END COMPONENT;

BEGIN
logic_a <= STD_LOGIC_VECTOR(a);
logic_b <= STD_LOGIC_VECTOR(b);
ca0: RCA_4bit PORT MAP (SW =>('0' & b(3 DOWNTO 0) & a(3 DOWNTO 0)), KEY0 => rsn, KEY1 => clk, LEDR => logic_c(3 DOWNTO 0), LEDR4 => c4, LEDR9 => open);
ca1: RCA_4bit PORT MAP (SW =>(c4 & b(7 DOWNTO 4) & a(7 DOWNTO 4)), KEY0 => rsn, KEY1 => clk, LEDR => logic_c(7 DOWNTO 4), LEDR4 => c8, LEDR9 => open);
ca2: RCA_4bit PORT MAP (SW =>(c8 & b(11 DOWNTO 8) & a(11 DOWNTO 8)), KEY0 => rsn, KEY1 => clk, LEDR => logic_c(11 DOWNTO 8), LEDR4 => c12, LEDR9 => open);
ca3: RCA_4bit PORT MAP (SW =>(c12 & b(15 DOWNTO 12) & a(15 DOWNTO 12)), KEY0 => rsn, KEY1 => clk, LEDR => logic_c(15 DOWNTO 12), LEDR4 => open, LEDR9 => ovrf);
c <= SIGNED(logic_c);
END structural;