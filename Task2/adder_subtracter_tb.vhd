LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY RCA_tb IS
END RCA_tb;

ARCHITECTURE test OF RCA_tb IS
SIGNAL switches: STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL resetn, ovf: STD_LOGIC;
SIGNAL clk: STD_LOGIC := '0';
SIGNAL res: STD_LOGIC_VECTOR(3 DOWNTO 0);
constant num_cycles : integer := 50;

COMPONENT RCA_4bit IS
	PORT (SW: IN STD_LOGIC_VECTOR(8 DOWNTO 0); -- b (7 downto 4) a(3 downto 0)
	KEY0: IN STD_LOGIC; -- active low asynchronous reset input
	KEY1: IN STD_LOGIC; -- manual clock input
	LEDR: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
	LEDR9: OUT STD_LOGIC); -- overflow bit
END COMPONENT;

BEGIN
uut: RCA_4bit PORT MAP(SW=>switches, KEY0=>resetn, KEY1=>clk, LEDR=>res, LEDR9=>ovf);
PROCESS
	BEGIN
	switches <='0' & "0000" & "0000"; -- 0+0 expected res: 0000
	WAIT FOR 100 ns;
	switches <= '0' & "0001" & "0001"; -- 1+1 expected res: 0010
	WAIT FOR 100 ns;
	switches <= '0' & "0010" & "0010"; -- 2+2 expected res: 0100
	WAIT FOR 100 ns;
	switches <= '0' & "0010" & "1110"; -- 2-2 expected res: 0000
	WAIT FOR 100 ns;
	switches <= '1' & "1111" & "0011"; -- -1-3 (using subtraction bit sw8) expected res: 1100
	WAIT FOR 100 ns;
	switches <= '0' & "0111" & "0111"; -- 7+7 check ovf expected res: ovf ='1'
	WAIT FOR 100 ns;
	switches <= '0' & "0101" & "0110"; -- 6+5 check reset expected res: 0000
	WAIT FOR 100 ns;
	WAIT;
END PROCESS;

process
begin
  for i in 1 to num_cycles loop
    clk <= not clk;
    wait for 10 ns;
    clk <= not clk;
    wait for 10 ns;
    -- clock period = 20 ns
  end loop;
  wait;  -- simulation stops here
end process;

PROCESS
	BEGIN
	resetn <= '1';
	WAIT FOR 600 ns;
	resetn <= '0';
	WAIT FOR 10 ns;
	WAIT;
END PROCESS;

END test;