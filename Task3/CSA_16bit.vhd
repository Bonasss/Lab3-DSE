ENTITY CSA_16bit IS
PORT (a, b: IN SIGNED(15 DOWNTO 0);
rsn, clock: IN STD_LOGIC;
c: OUT SIGNED(15 DOWNTO 0);
ovrf: OUT STD_LOGIC);
END CSA_16bit;

ARCHITECTURE structural OF CSA_16bit IS
SIGNAL logic_a, logic_b, logic_c: STD_LOGIC_VECTOR(15 DOWNTO 0);

type bit4 is array (3 DOWNTO 0) of STD_LOGIC;
type adder_output is array (2 DOWNTO 0) of bit4;
SIGNAL m: adder_output (0 TO 3);

type adder_input is array (7 DOWNTO 0) of STD_LOGIC;
SIGNAL swt: adder_input(3 DOWNTO 0);
SIGNAL carry0, carry1, carry: STD_LOGIC_VECTOR(0 to 3);
SIGNAL ovf: STD_LOGIC_VECTOR(1 DOWNTO 0);

COMPONENT RCA_4bit IS
    PORT (SW: IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- b (7 downto 4) a(3 downto 0) sw 8 for subtraction
    KEY0, KEY1, cin: IN STD_LOGIC; -- active low asynchronous reset input -- manual clock input and carry in
    LEDR: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
    LEDR4, LEDR9: OUT STD_LOGIC); -- carry out and overflow bits
END COMPONENT;

COMPONENT mux2to1 IS
    PORT (in1, in2: STD_LOGIC_VECTOR(3 DOWNTO 0);
    s: IN STD_LOGIC;
    res: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    )
END COMPONENT;

COMPONENT mux2to1_1bit IS
    PORT (in1, in2: STD_LOGIC;
    s: IN STD_LOGIC;
    res: OUT STD_LOGIC;
    )
END COMPONENT;

BEGIN
logic_a <= STD_LOGIC_VECTOR(a);
logic_b <= STD_LOGIC_VECTOR(b);
swt(0) <= (logic_b(3 DOWNTO 0) & logic_a(3 DOWNTO 0));
swt(1) <= (logic_b(7 DOWNTO 4) & logic_a(7 DOWNTO 4));
swt(2) <= (logic_b(11 DOWNTO 8) & logic_a(11 DOWNTO 8));
swt(3) <= (logic_b(15 DOWNTO 12) & logic_a(15 DOWNTO 12));
    q1: for i in 0 to 3 generate
        q2: if i < 3 generate
            add0: RCA_4bit PORT MAP (SW => swt(i), cin=>'0', KEY0 => rsn, KEY1 => clock, LEDR => m(i)(0), LEDR4 => carry0(i+1), LEDR9 => open);
            add1: RCA_4bit PORT MAP (SW => swt(i), cin=> '1', KEY0 => rsn, KEY1 => clock, LEDR => m(i)(1), LEDR4 => carry1(i+1), LEDR9 => open);
            mux0: mux2to1 PORT MAP (in1 => m(i)(0), in2 => m(i)(1), s => carry(i), res => m(i)(2));
            mux1: mux2to1 PORT MAP (in1 => carry0(i+1), in2=> carry1(i+1), s=> carry(i), res => carry(i+1))
        end generate;
        q3: if i = 3 generate
            lst0: RCA_4bit PORT MAP (SW => swt(i), cin=>'0', KEY0 => rsn, KEY1 => clock, LEDR => m(i)(0), LEDR4 => open, LEDR9 => ovf(0));
            lst1: RCA_4bit PORT MAP (SW => swt(i), cin=>'1', KEY0 => rsn, KEY1 => clock, LEDR => m(i)(1), LEDR4 => open, LEDR9 => ovf(1));
            mux0: mux2to1 PORT MAP (in1 => m(i)(0), in2 => m(i)(1), s => carry(i), res => m(i)(2));
            mux1: mux2to1 PORT MAP (in1 => ovf(0), in2=> ovf(1), s=> carry(i), res => ovfr);
        end generate;
    end generate;
logic_c <= m(3)(2) & m(2)(2) & m(1)(2) & m(0)(2);
c <= SIGNED(logic_c);
