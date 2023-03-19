LIBRARY IEEE;
use IEEE.std_logic_1164.all;

ENTITY two_cmp IS
PORT(input: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
output: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END two_cmp;

ARCHITECTURE behaviour OF two_cmp IS
BEGIN
PROCESS(input)
    BEGIN
    output <= not(input) + "0001";
END PROCESS;
END behaviour;