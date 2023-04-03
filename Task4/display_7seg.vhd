LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY display_7seg IS
PORT(input: IN std_logic_vector(3 downto 0); output: OUT std_logic_vector(0 to 6));
END display_7seg;

ARCHITECTURE behavioural OF display_7seg IS
BEGIN
PROCESS(input) is
BEGIN
IF (input = "0000") THEN
output <= "0000001"; -- 0
elsif (input = "0001") THEN
output <= "1001111"; --1
elsif (input = "0010") THEN
output<= "0010010"; --2
elsif (input = "0011") THEN
output <= "0000110"; -- 3
elsif (input = "0100") THEN
output<= "1001100"; -- 4
elsif (input = "0101") THEN
output<= "0100100"; --5
elsif(input = "0110") THEN
output <= "0100000"; -- 6
elsif(input = "0111") then
output <= "0001111"; -- 7
elsif(input = "1000") then
output <= "0000000"; -- 8
elsif(input = "1001") then
output <= "0000100"; -- 9
elsif(input = "1010") then
output <= "0001000"; -- 10->A
elsif(input = "1011") then
output <= "1100000"; -- 11->B
elsif(input = "1100") then
output <= "0110001"; -- 12->C
elsif(input = "1101") then
output <= "1000010"; -- 13->D
elsif(input = "1110") then
output <= "0110000"; -- 14->E
elsif(input = "1111") then
output <= "0111000"; -- 15->F
end if;
end process;
end behavioural;
