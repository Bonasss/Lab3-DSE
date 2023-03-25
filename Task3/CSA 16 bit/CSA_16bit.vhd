LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY CSA_16bit IS
PORT (a, b: IN SIGNED(15 DOWNTO 0);
rsn, clock: IN STD_LOGIC;
c: OUT SIGNED(15 DOWNTO 0);
ovrf: OUT STD_LOGIC);
END CSA_16bit;

ARCHITECTURE structural OF CSA_16bit IS
SIGNAL reg1, reg2, reg3: SIGNED(15 DOWNTO 0);
SIGNAL logic_a, logic_b, logic_c: STD_LOGIC_VECTOR(15 DOWNTO 0);

type four_by_four is array (0 TO 3) of STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL m: four_by_four;
SIGNAL output0, output1: four_by_four;

type adder_input_vector is array (3 DOWNTO 0) of STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL swt: adder_input_vector;
SIGNAL carry0, carry1, carry: STD_LOGIC_VECTOR(0 to 3);
SIGNAL ovf: STD_LOGIC_VECTOR(1 DOWNTO 0);

COMPONENT regn IS
	GENERIC ( N : integer:=4); 
	PORT (R : IN SIGNED(N-1 DOWNTO 0);
	Clock, Resetn : IN STD_LOGIC; 
	Q : OUT SIGNED(N-1 DOWNTO 0));
END COMPONENT;

COMPONENT RCA_4bit IS
    PORT (SW: IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- b (7 downto 4) a(3 downto 0) sw 8 for subtraction
    KEY0, KEY1, cin: IN STD_LOGIC; -- active low asynchronous outputet input -- manual clock input and carry in
    LEDR: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
    LEDR4, LEDR9: OUT STD_LOGIC); -- carry out and overflow bits
END COMPONENT;

COMPONENT mux2to1 IS
    PORT (x, y: STD_LOGIC_VECTOR(3 DOWNTO 0);
    s: IN STD_LOGIC;
    m: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;

COMPONENT MUX2to1_1bit IS
    PORT (input1, input2, s: IN STD_LOGIC;
    output: OUT STD_LOGIC);
END COMPONENT;

COMPONENT flipflop IS
    PORT (D, Clock, Resetn : IN STD_LOGIC;
    Q : OUT STD_LOGIC);
END COMPONENT;

BEGIN
logic_a <= STD_LOGIC_VECTOR(reg1);
logic_b <= STD_LOGIC_VECTOR(reg2);
carry(0) <= '0';
swt(0) <= (logic_b(3 DOWNTO 0) & logic_a(3 DOWNTO 0));
swt(1) <= (logic_b(7 DOWNTO 4) & logic_a(7 DOWNTO 4));
swt(2) <= (logic_b(11 DOWNTO 8) & logic_a(11 DOWNTO 8));
swt(3) <= (logic_b(15 DOWNTO 12) & logic_a(15 DOWNTO 12));
regn1: regn GENERIC MAP(N => 16) 
	  PORT MAP (R=>a, Clock=>clock, Resetn=>rsn, Q=>reg1);
regn2: regn GENERIC MAP(N => 16) 
          PORT MAP (R=>b, Clock=>clock, Resetn=>rsn, Q=>reg2);
    q1: for i in 0 to 3 generate
        q2: if i < 3 generate
            add0: RCA_4bit PORT MAP (SW => swt(i), cin=>'0', KEY0 => rsn, KEY1 => clock, LEDR => output0(i), LEDR4 => carry0(i+1), LEDR9 => open);
            add1: RCA_4bit PORT MAP (SW => swt(i), cin=> '1', KEY0 => rsn, KEY1 => clock, LEDR => output1(i), LEDR4 => carry1(i+1), LEDR9 => open);
            mux0: mux2to1 PORT MAP (x => output0(i), y => output1(i), s => carry(i), m => m(i));
            mux1: MUX2to1_1bit PORT MAP (input1 => carry0(i+1), input2=> carry1(i+1), s=> carry(i), output => carry(i+1));
        end generate;
        q3: if i = 3 generate
            lst0: RCA_4bit PORT MAP (SW => swt(i), cin=>'0', KEY0 => rsn, KEY1 => clock, LEDR => output0(i), LEDR4 => open, LEDR9 => ovf(0));
            lst1: RCA_4bit PORT MAP (SW => swt(i), cin=>'1', KEY0 => rsn, KEY1 => clock, LEDR => output1(i), LEDR4 => open, LEDR9 => ovf(1));
            mux0: mux2to1 PORT MAP (x => output0(i), y => output1(i), s => carry(i), m => m(i));
            mux1: MUX2to1_1bit PORT MAP (input1 => ovf(0), input2=> ovf(1), s=> carry(i), output => ovrf);
        end generate;
    end generate;
logic_c <= m(3) & m(2) & m(1) & m(0);
reg3 <= SIGNED(logic_c);
regn3: regn GENERIC MAP(N => 16) 
	PORT MAP (R=>reg3, Clock=>clock, Resetn=>rsn, Q=>c);
END structural;
