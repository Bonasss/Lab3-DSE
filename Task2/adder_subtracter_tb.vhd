LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY RCA4sub_tb IS
END RCA4sub_tb;

ARCHITECTURE test OF RCA4sub_tb IS
SIGNAL a_in, b_in, res: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL switches: STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL ledout: STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL resetn, ovf: STD_LOGIC;
SIGNAL subt_en, clk: STD_LOGIC := '0';
constant num_cycles : integer := 50;

COMPONENT RCA_4bit_w_sub IS
	PORT (SW: IN STD_LOGIC_VECTOR(8 DOWNTO 0); -- b (7 downto 4) a(3 downto 0) sw 8 for subtraction
	KEY: IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- active low asynchronous reset input  -- manual clock input
	LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)); --  RES AND overflow bit
END COMPONENT;

BEGIN
uut: RCA_4bit_w_sub PORT MAP(SW=>switches, KEY(0)=>resetn, KEY(1)=>clk, LEDR=>ledout);
switches <= subt_en & b_in & a_in ;
res <= ledout(3 DOWNTO 0);
ovf <= ledout(9);
PROCESS
	BEGIN
	a_in <= "0000";
	b_in <= "0000"; -- 0+0 expected res: 0000
	WAIT FOR 100 ns;
	a_in <= "0001";
	b_in <= "0001";-- 1+1 expected res: 0010
	WAIT FOR 100 ns;
	a_in <= "0010";
	b_in <= "0010";
	 -- 2+2 expected res: 0100
	WAIT FOR 100 ns;
	a_in <= "0010";
	b_in <= "1110";
	 -- 2-2 expected res: 0000
	WAIT FOR 100 ns;
	subt_en <= '1';
	a_in <= "1111";
	b_in <= "0011"; 
	-- -1-3 (using subtraction bit sw8) expected res: 1100
	WAIT FOR 100 ns;
	subt_en <= '0';
	a_in <= "0111";
	b_in <= "0111";
	-- 7+7 check ovf expected res: ovf ='1'
	WAIT FOR 100 ns;
	subt_en <= '1';
	a_in <= "0110";
	b_in <= "0101";
	-- 6-5 check reset expected res: 0000 and check subtraction again
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
	WAIT FOR 50 ns;
	resetn <= '1';
	WAIT FOR 350 ns;
	WAIT;
END PROCESS;

END test;