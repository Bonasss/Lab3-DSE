LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY array_multiplier_tb IS
END array_multiplier_tb;

ARCHITECTURE mytest OF array_multiplier_tb IS

COMPONENT array_multiplier IS
PORT(SW: IN std_logic_vector(7 downto 0);
     prod: OUT std_logic_vector(7 downto 0));
END component;

SIGNAL SW_tb, prod_tb: std_logic_vector(7 downto 0);

BEGIN
uut: array_multiplier PORT MAP(SW => SW_tb, prod => prod_tb);
PROCESS
BEGIN
SW_tb <= "10111100";
WAIT FOR 100 ns;
SW_tb <= "01001001";
WAIT FOR 100 ns;
WAIT;
END process;
END mytest;

