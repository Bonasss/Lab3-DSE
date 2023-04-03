LIBRARY ieee;
USE ieee.std_logic_1164.all;

--define the summations between the the summands

ENTITY multiplier IS
PORT(sm0, sm1, sm2, sm3: IN std_logic_vector(3 downto 0); 
    p: OUT std_logic_vector(7 downto 0)); --input 4 summands, output the sums of the 3 4 bit RCA
END multiplier;

ARCHITECTURE structural OF multiplier IS

COMPONENT logic_adder IS       -- call a 4 bit RCA (std_logic type inputs and outputs)
PORT (in1, in2: IN std_logic_vector(3 DOWNTO 0);
	cin: IN STD_LOGIC;
	cout: OUT STD_LOGIC;
	s: OUT std_logic_vector(3 DOWNTO 0));
END component;

SIGNAL sum1, sum2, sum3: std_logic_vector(3 downto 0);
SIGNAL cout1, cout2, cout3: std_logic; --output carry of each RCA
SIGNAL op0, op1, op2: std_logic_vector(3 downto 0); --array of bits whose MSB is carry out of previous stage and the other 3 bits are previus summand(2 downto 0)
BEGIN

op0(3) <= '0';
op0(2) <= sm0(3);
op0(1) <= sm0(2);
op0(0) <= sm0(1);

op1(3) <= cout1;
op1(2) <= sum1(3);
op1(1) <= sum1(2);
op1(0) <= sum1(1);


op2(3) <= cout2;
op2(2) <= sum2(3);
op2(1) <= sum2(2);
op2(0) <= sum2(1);

RCA1: logic_adder PORT MAP(in1 => op0, in2 => sm1, cin => '0', cout => cout1, s => sum1);
RCA2: logic_adder PORT MAP(in1 => op1, in2 => sm2, cin => '0', cout => cout2, s => sum2);
RCA3: logic_adder PORT MAP(in1 => op2, in2 => sm3, cin => '0', cout => cout3, s => sum3);

p(0) <= sm0(0);
p(1) <= sum1(0);
p(2) <= sum2(0);
p(3) <= sum3(0);
p(4) <= sum3(1);
p(5) <= sum3(2);
p(6) <= sum3(3);
p(7) <= cout3;
END structural;
