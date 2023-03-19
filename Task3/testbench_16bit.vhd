LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY RCA_tb IS
END RCA_tb;

ARCHITECTURE test OF RCA_tb IS
SIGNAL num1: SIGNED(15 DOWNTO 0):= (others => '0');
SIGNAL num2: SIGNED(15 DOWNTO 0):= (others => '0');
SIGNAL res: SIGNED(15 DOWNTO 0);
SIGNAL resetn, ovf: STD_LOGIC;
SIGNAL clk: STD_LOGIC := '0';
constant num_cycles : integer := 50;

COMPONENT RCA_16bit IS
    PORT (a, b: IN SIGNED(15 DOWNTO 0);
    rsn, clock: IN STD_LOGIC;
    c: OUT SIGNED(15 DOWNTO 0);
    ovrf: OUT STD_LOGIC);
END COMPONENT;

BEGIN
uut: RCA_16bit PORT MAP(a => num1, b => num2, rsn => resetn, clock => clk, c => res, ovrf => ovf);
PROCESS
	BEGIN
	WAIT FOR 100 ns; -- 0+0
    num1 <= (2 => '1', -- 1164
             3 => '1',
             7 => '1',
             10 => '1',
             others => '0');
    num2 <= (others => '1'); -- -1
    WAIT FOR 100 ns;
    num1 <= (1 => '1', -- 4098
             12 => '1',
             others => '0');
    num2 <= (2 => '1', -- 12
             3 => '1', 
             others => '0');
    WAIT FOR 100 ns;
    num1 <= (0 => '1', -- 
             15 => '1',
             others => '0');
    num2 <= (0 => '1', -- -16384 most negative value possible
             15 => '1',
             others => '0');
    WAIT FOR 100 ns;
    num1 <= (15 => '0', -- most positive value possible
             others => '1');
    num2 <= (15 => '0',
             others => '1');
    WAIT FOR 100 ns;
    num1 <= (6 => '1', -- 320
             8 => '1', 
             others => '0');
    num2 <= (1 => '0', -- -147
             4 => '0',
             7 => '0',
             others => '1');
    WAIT FOR 100 ns;
    num1 <= (15 => '0', -- most positive value possible
            others => '1');  
    num2 <= (0 => '1', -- -16384 most negative value possible
            15 => '1',
            others => '0'); -- risultato dovrebbe essere -1
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