LIBRARY ieee;
USE ieee.std_logic_1164.all;

--design of the mux 1 bit 2 to 1

ENTITY MUX2to1_1bit IS
    PORT(input1, input2: IN STD_LOGIC;
    s: IN STD_LOGIC; 
    output: OUT STD_LOGIC);
end MUX2to1_1bit;

ARCHITECTURE behaviour OF MUX2to1_1bit IS
BEGIN
PROCESS(input1, input2, s) IS
    BEGIN
    if(s = '0') then
    output <= input1; --upper signal in the mux symbol
    else
    output <= input2; --lower signal in the mux symbol
    end if;
end process;
end behaviour; 