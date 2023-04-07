LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY RCA4_tb IS
END RCA4_tb;

ARCHITECTURE test OF RCA4_tb IS

SIGNAL a_in, b_in, sum_out: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL switches: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL resetn, ovf: STD_LOGIC;
SIGNAL clk: STD_LOGIC := '0';
SIGNAL res: STD_LOGIC_VECTOR(9 DOWNTO 0);
constant num_cycles : integer := 50;
SIGNAL inputs:STD_LOGIC_VECTOR(1 DOWNTO 0);

COMPONENT RCA_4bit IS
	PORT (SW: IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- b (7 downto 4) a(3 downto 0)
	KEY: IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- active low asynchronous reset input -- manual clock input
	LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	); -- LEDR9 overflow bit
END COMPONENT;

BEGIN
uut: RCA_4bit PORT MAP(SW=>switches, KEY=>inputs, LEDR=>res);
switches<=b_in & a_in;
ovf<=res(9);
inputs <= clk & resetn;
sum_out<=res(3 DOWNTO 0);
PROCESS
	BEGIN
	-- clk <= '0';
	a_in<="0000";
	b_in<="0000";
	-- WAIT FOR clk_period;
	-- clk <= '1';
	-- WAIT FOR clk_period;
	-- clk <= '0';
	WAIT FOR 100 ns;
	a_in<="0001";
	b_in<="0001"; --1+1
	WAIT FOR 100 ns;
	a_in<="0010";
	b_in<="0010"; -- 2+2
	WAIT FOR 100 ns;
	a_in<="0010";
	b_in<="1110";
	-- 2-2
	WAIT FOR 100 ns;
	a_in<="1101";
	b_in<="1111";
	-- -1-3
	WAIT FOR 100 ns;
	a_in<="0111";
	b_in<="0111";
	-- 7+7 check ovf
	WAIT FOR 100 ns;
	a_in<="0110";
	b_in<="0101";
	 -- 6+5 check reset
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
    -- clock period = 40 ns
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