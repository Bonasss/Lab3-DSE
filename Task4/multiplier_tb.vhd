LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY multiplier_tb IS
end multiplier_tb;

ARCHITECTURE mytest OF multiplier_tb IS
COMPONENT multiplier IS
PORT(sm0, sm1, sm2, sm3: IN std_logic_vector(3 downto 0); 
     p: OUT std_logic_vector(7 downto 0));
end component;

SIGNAL sm0_tb, sm1_tb, sm2_tb, sm3_tb: std_logic_vector(3 downto 0);
SIGNAL p_tb: std_logic_vector(7 downto 0);

BEGIN
dut: multiplier PORT MAP(sm0 => sm0_tb, sm1 => sm1_tb, sm2 => sm2_tb, sm3 => sm3_tb, p => p_tb);
PROCESS
BEGIN
sm0_tb <= "1100";
sm1_tb <= "1100";
sm2_tb <= "0000";
sm3_tb <= "1100";
WAIT FOR 200 ns;
WAIT;
end PROCESS;
end mytest;


