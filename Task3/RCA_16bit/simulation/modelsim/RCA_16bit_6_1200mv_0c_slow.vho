-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "04/07/2023 12:47:22"

-- 
-- Device: Altera EP4CGX22CF19C6 Package FBGA324
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_NCEO~	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: 16mA
-- ~ALTERA_DATA0~	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_ASDO~	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_NCSO~	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO~~padout\ : std_logic;
SIGNAL \~ALTERA_NCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_ASDO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_NCSO~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	RCA_16bit IS
    PORT (
	a : IN IEEE.NUMERIC_STD.signed(15 DOWNTO 0);
	b : IN IEEE.NUMERIC_STD.signed(15 DOWNTO 0);
	rsn : IN std_logic;
	clock : IN std_logic;
	c : OUT IEEE.NUMERIC_STD.signed(15 DOWNTO 0);
	ovrf : OUT std_logic
	);
END RCA_16bit;

-- Design Ports Information
-- rsn	=>  Location: PIN_V11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_V12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[0]	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[1]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[2]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[3]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[4]	=>  Location: PIN_P13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[5]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[6]	=>  Location: PIN_P12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[7]	=>  Location: PIN_U16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[8]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[9]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[10]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[11]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[12]	=>  Location: PIN_D18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[13]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[14]	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[15]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ovrf	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_M17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[0]	=>  Location: PIN_T18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_R18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[1]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[2]	=>  Location: PIN_R17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[2]	=>  Location: PIN_P18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[3]	=>  Location: PIN_N17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[3]	=>  Location: PIN_L16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[4]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[4]	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[5]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[5]	=>  Location: PIN_T16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[6]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[6]	=>  Location: PIN_V17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[7]	=>  Location: PIN_T17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[7]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[8]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[8]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[9]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[9]	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[10]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[10]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[11]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[11]	=>  Location: PIN_C18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[12]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[12]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[13]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[13]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[14]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[14]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[15]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[15]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF RCA_16bit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_rsn : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_c : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_ovrf : std_logic;
SIGNAL \rsn~input_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \c[0]~output_o\ : std_logic;
SIGNAL \c[1]~output_o\ : std_logic;
SIGNAL \c[2]~output_o\ : std_logic;
SIGNAL \c[3]~output_o\ : std_logic;
SIGNAL \c[4]~output_o\ : std_logic;
SIGNAL \c[5]~output_o\ : std_logic;
SIGNAL \c[6]~output_o\ : std_logic;
SIGNAL \c[7]~output_o\ : std_logic;
SIGNAL \c[8]~output_o\ : std_logic;
SIGNAL \c[9]~output_o\ : std_logic;
SIGNAL \c[10]~output_o\ : std_logic;
SIGNAL \c[11]~output_o\ : std_logic;
SIGNAL \c[12]~output_o\ : std_logic;
SIGNAL \c[13]~output_o\ : std_logic;
SIGNAL \c[14]~output_o\ : std_logic;
SIGNAL \c[15]~output_o\ : std_logic;
SIGNAL \ovrf~output_o\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \ca0|rca|fa0|sum~combout\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \ca0|rca|fa1|sum~combout\ : std_logic;
SIGNAL \ca0|rca|fa1|mux|output~0_combout\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \ca0|rca|fa2|sum~combout\ : std_logic;
SIGNAL \ca0|rca|fa2|mux|output~0_combout\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \ca0|rca|fa3|sum~combout\ : std_logic;
SIGNAL \a[4]~input_o\ : std_logic;
SIGNAL \b[4]~input_o\ : std_logic;
SIGNAL \ca0|rca|fa3|mux|output~0_combout\ : std_logic;
SIGNAL \ca1|rca|fa0|sum~combout\ : std_logic;
SIGNAL \ca1|rca|fa0|mux|output~0_combout\ : std_logic;
SIGNAL \b[5]~input_o\ : std_logic;
SIGNAL \a[5]~input_o\ : std_logic;
SIGNAL \ca1|rca|fa1|sum~combout\ : std_logic;
SIGNAL \ca1|rca|fa1|mux|output~0_combout\ : std_logic;
SIGNAL \a[6]~input_o\ : std_logic;
SIGNAL \b[6]~input_o\ : std_logic;
SIGNAL \ca1|rca|fa2|sum~combout\ : std_logic;
SIGNAL \ca1|rca|fa2|mux|output~0_combout\ : std_logic;
SIGNAL \b[7]~input_o\ : std_logic;
SIGNAL \a[7]~input_o\ : std_logic;
SIGNAL \ca1|rca|fa3|sum~combout\ : std_logic;
SIGNAL \a[8]~input_o\ : std_logic;
SIGNAL \ca1|rca|fa3|mux|output~0_combout\ : std_logic;
SIGNAL \b[8]~input_o\ : std_logic;
SIGNAL \ca2|rca|fa0|sum~combout\ : std_logic;
SIGNAL \ca2|rca|fa0|mux|output~0_combout\ : std_logic;
SIGNAL \a[9]~input_o\ : std_logic;
SIGNAL \b[9]~input_o\ : std_logic;
SIGNAL \ca2|rca|fa1|sum~combout\ : std_logic;
SIGNAL \ca2|rca|fa1|mux|output~0_combout\ : std_logic;
SIGNAL \a[10]~input_o\ : std_logic;
SIGNAL \b[10]~input_o\ : std_logic;
SIGNAL \ca2|rca|fa2|sum~combout\ : std_logic;
SIGNAL \ca2|rca|fa2|mux|output~0_combout\ : std_logic;
SIGNAL \b[11]~input_o\ : std_logic;
SIGNAL \a[11]~input_o\ : std_logic;
SIGNAL \ca2|rca|fa3|sum~combout\ : std_logic;
SIGNAL \a[12]~input_o\ : std_logic;
SIGNAL \ca2|rca|fa3|mux|output~0_combout\ : std_logic;
SIGNAL \b[12]~input_o\ : std_logic;
SIGNAL \ca3|rca|fa0|sum~combout\ : std_logic;
SIGNAL \ca3|rca|fa0|mux|output~0_combout\ : std_logic;
SIGNAL \a[13]~input_o\ : std_logic;
SIGNAL \b[13]~input_o\ : std_logic;
SIGNAL \ca3|rca|fa1|sum~combout\ : std_logic;
SIGNAL \ca3|rca|fa1|mux|output~0_combout\ : std_logic;
SIGNAL \a[14]~input_o\ : std_logic;
SIGNAL \b[14]~input_o\ : std_logic;
SIGNAL \ca3|rca|fa2|sum~combout\ : std_logic;
SIGNAL \b[15]~input_o\ : std_logic;
SIGNAL \ca3|rca|fa2|mux|output~0_combout\ : std_logic;
SIGNAL \a[15]~input_o\ : std_logic;
SIGNAL \ca3|rca|fa3|sum~combout\ : std_logic;
SIGNAL \ca3|LEDR9~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_a <= IEEE.STD_LOGIC_1164.STD_LOGIC_VECTOR(a);
ww_b <= IEEE.STD_LOGIC_1164.STD_LOGIC_VECTOR(b);
ww_rsn <= rsn;
ww_clock <= clock;
c <= IEEE.NUMERIC_STD.SIGNED(ww_c);
ovrf <= ww_ovrf;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X52_Y13_N2
\c[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ca0|rca|fa0|sum~combout\,
	devoe => ww_devoe,
	o => \c[0]~output_o\);

-- Location: IOOBUF_X52_Y15_N2
\c[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ca0|rca|fa1|sum~combout\,
	devoe => ww_devoe,
	o => \c[1]~output_o\);

-- Location: IOOBUF_X52_Y10_N9
\c[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ca0|rca|fa2|sum~combout\,
	devoe => ww_devoe,
	o => \c[2]~output_o\);

-- Location: IOOBUF_X52_Y10_N2
\c[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ca0|rca|fa3|sum~combout\,
	devoe => ww_devoe,
	o => \c[3]~output_o\);

-- Location: IOOBUF_X38_Y0_N2
\c[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ca1|rca|fa0|sum~combout\,
	devoe => ww_devoe,
	o => \c[4]~output_o\);

-- Location: IOOBUF_X36_Y0_N9
\c[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ca1|rca|fa1|sum~combout\,
	devoe => ww_devoe,
	o => \c[5]~output_o\);

-- Location: IOOBUF_X38_Y0_N9
\c[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ca1|rca|fa2|sum~combout\,
	devoe => ww_devoe,
	o => \c[6]~output_o\);

-- Location: IOOBUF_X41_Y0_N2
\c[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ca1|rca|fa3|sum~combout\,
	devoe => ww_devoe,
	o => \c[7]~output_o\);

-- Location: IOOBUF_X50_Y41_N9
\c[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ca2|rca|fa0|sum~combout\,
	devoe => ww_devoe,
	o => \c[8]~output_o\);

-- Location: IOOBUF_X46_Y41_N2
\c[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ca2|rca|fa1|sum~combout\,
	devoe => ww_devoe,
	o => \c[9]~output_o\);

-- Location: IOOBUF_X52_Y30_N2
\c[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ca2|rca|fa2|sum~combout\,
	devoe => ww_devoe,
	o => \c[10]~output_o\);

-- Location: IOOBUF_X52_Y32_N2
\c[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ca2|rca|fa3|sum~combout\,
	devoe => ww_devoe,
	o => \c[11]~output_o\);

-- Location: IOOBUF_X52_Y31_N9
\c[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ca3|rca|fa0|sum~combout\,
	devoe => ww_devoe,
	o => \c[12]~output_o\);

-- Location: IOOBUF_X52_Y27_N9
\c[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ca3|rca|fa1|sum~combout\,
	devoe => ww_devoe,
	o => \c[13]~output_o\);

-- Location: IOOBUF_X52_Y18_N9
\c[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ca3|rca|fa2|sum~combout\,
	devoe => ww_devoe,
	o => \c[14]~output_o\);

-- Location: IOOBUF_X52_Y30_N9
\c[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ca3|rca|fa3|sum~combout\,
	devoe => ww_devoe,
	o => \c[15]~output_o\);

-- Location: IOOBUF_X52_Y28_N2
\ovrf~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ca3|LEDR9~0_combout\,
	devoe => ww_devoe,
	o => \ovrf~output_o\);

-- Location: IOIBUF_X52_Y11_N8
\b[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(0),
	o => \b[0]~input_o\);

-- Location: IOIBUF_X52_Y15_N8
\a[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

-- Location: LCCOMB_X51_Y12_N0
\ca0|rca|fa0|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca0|rca|fa0|sum~combout\ = \b[0]~input_o\ $ (\a[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \b[0]~input_o\,
	datad => \a[0]~input_o\,
	combout => \ca0|rca|fa0|sum~combout\);

-- Location: IOIBUF_X52_Y12_N1
\a[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

-- Location: IOIBUF_X52_Y9_N1
\b[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(1),
	o => \b[1]~input_o\);

-- Location: LCCOMB_X51_Y12_N2
\ca0|rca|fa1|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca0|rca|fa1|sum~combout\ = \a[1]~input_o\ $ (\b[1]~input_o\ $ (((\b[0]~input_o\ & \a[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datab => \b[0]~input_o\,
	datac => \b[1]~input_o\,
	datad => \a[0]~input_o\,
	combout => \ca0|rca|fa1|sum~combout\);

-- Location: LCCOMB_X51_Y12_N12
\ca0|rca|fa1|mux|output~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca0|rca|fa1|mux|output~0_combout\ = (\a[1]~input_o\ & ((\b[1]~input_o\) # ((\b[0]~input_o\ & \a[0]~input_o\)))) # (!\a[1]~input_o\ & (\b[0]~input_o\ & (\b[1]~input_o\ & \a[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[1]~input_o\,
	datab => \b[0]~input_o\,
	datac => \b[1]~input_o\,
	datad => \a[0]~input_o\,
	combout => \ca0|rca|fa1|mux|output~0_combout\);

-- Location: IOIBUF_X52_Y11_N1
\a[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

-- Location: IOIBUF_X52_Y12_N8
\b[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(2),
	o => \b[2]~input_o\);

-- Location: LCCOMB_X51_Y12_N6
\ca0|rca|fa2|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca0|rca|fa2|sum~combout\ = \ca0|rca|fa1|mux|output~0_combout\ $ (\a[2]~input_o\ $ (\b[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca0|rca|fa1|mux|output~0_combout\,
	datac => \a[2]~input_o\,
	datad => \b[2]~input_o\,
	combout => \ca0|rca|fa2|sum~combout\);

-- Location: LCCOMB_X51_Y12_N24
\ca0|rca|fa2|mux|output~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca0|rca|fa2|mux|output~0_combout\ = (\ca0|rca|fa1|mux|output~0_combout\ & ((\a[2]~input_o\) # (\b[2]~input_o\))) # (!\ca0|rca|fa1|mux|output~0_combout\ & (\a[2]~input_o\ & \b[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca0|rca|fa1|mux|output~0_combout\,
	datac => \a[2]~input_o\,
	datad => \b[2]~input_o\,
	combout => \ca0|rca|fa2|mux|output~0_combout\);

-- Location: IOIBUF_X52_Y13_N8
\b[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(3),
	o => \b[3]~input_o\);

-- Location: IOIBUF_X52_Y16_N1
\a[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

-- Location: LCCOMB_X51_Y12_N18
\ca0|rca|fa3|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca0|rca|fa3|sum~combout\ = \ca0|rca|fa2|mux|output~0_combout\ $ (\b[3]~input_o\ $ (\a[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ca0|rca|fa2|mux|output~0_combout\,
	datac => \b[3]~input_o\,
	datad => \a[3]~input_o\,
	combout => \ca0|rca|fa3|sum~combout\);

-- Location: IOIBUF_X41_Y0_N22
\a[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(4),
	o => \a[4]~input_o\);

-- Location: IOIBUF_X41_Y0_N8
\b[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(4),
	o => \b[4]~input_o\);

-- Location: LCCOMB_X51_Y12_N28
\ca0|rca|fa3|mux|output~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca0|rca|fa3|mux|output~0_combout\ = (\ca0|rca|fa2|mux|output~0_combout\ & ((\b[3]~input_o\) # (\a[3]~input_o\))) # (!\ca0|rca|fa2|mux|output~0_combout\ & (\b[3]~input_o\ & \a[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ca0|rca|fa2|mux|output~0_combout\,
	datac => \b[3]~input_o\,
	datad => \a[3]~input_o\,
	combout => \ca0|rca|fa3|mux|output~0_combout\);

-- Location: LCCOMB_X42_Y4_N8
\ca1|rca|fa0|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca1|rca|fa0|sum~combout\ = \a[4]~input_o\ $ (\b[4]~input_o\ $ (\ca0|rca|fa3|mux|output~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[4]~input_o\,
	datab => \b[4]~input_o\,
	datad => \ca0|rca|fa3|mux|output~0_combout\,
	combout => \ca1|rca|fa0|sum~combout\);

-- Location: LCCOMB_X42_Y4_N26
\ca1|rca|fa0|mux|output~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca1|rca|fa0|mux|output~0_combout\ = (\a[4]~input_o\ & ((\b[4]~input_o\) # (\ca0|rca|fa3|mux|output~0_combout\))) # (!\a[4]~input_o\ & (\b[4]~input_o\ & \ca0|rca|fa3|mux|output~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[4]~input_o\,
	datab => \b[4]~input_o\,
	datad => \ca0|rca|fa3|mux|output~0_combout\,
	combout => \ca1|rca|fa0|mux|output~0_combout\);

-- Location: IOIBUF_X46_Y0_N8
\b[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(5),
	o => \b[5]~input_o\);

-- Location: IOIBUF_X41_Y0_N15
\a[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(5),
	o => \a[5]~input_o\);

-- Location: LCCOMB_X42_Y4_N4
\ca1|rca|fa1|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca1|rca|fa1|sum~combout\ = \ca1|rca|fa0|mux|output~0_combout\ $ (\b[5]~input_o\ $ (\a[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca1|rca|fa0|mux|output~0_combout\,
	datab => \b[5]~input_o\,
	datac => \a[5]~input_o\,
	combout => \ca1|rca|fa1|sum~combout\);

-- Location: LCCOMB_X42_Y4_N22
\ca1|rca|fa1|mux|output~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca1|rca|fa1|mux|output~0_combout\ = (\ca1|rca|fa0|mux|output~0_combout\ & ((\b[5]~input_o\) # (\a[5]~input_o\))) # (!\ca1|rca|fa0|mux|output~0_combout\ & (\b[5]~input_o\ & \a[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca1|rca|fa0|mux|output~0_combout\,
	datab => \b[5]~input_o\,
	datac => \a[5]~input_o\,
	combout => \ca1|rca|fa1|mux|output~0_combout\);

-- Location: IOIBUF_X46_Y0_N15
\a[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(6),
	o => \a[6]~input_o\);

-- Location: IOIBUF_X43_Y0_N1
\b[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(6),
	o => \b[6]~input_o\);

-- Location: LCCOMB_X42_Y4_N24
\ca1|rca|fa2|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca1|rca|fa2|sum~combout\ = \ca1|rca|fa1|mux|output~0_combout\ $ (\a[6]~input_o\ $ (\b[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca1|rca|fa1|mux|output~0_combout\,
	datac => \a[6]~input_o\,
	datad => \b[6]~input_o\,
	combout => \ca1|rca|fa2|sum~combout\);

-- Location: LCCOMB_X42_Y4_N10
\ca1|rca|fa2|mux|output~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca1|rca|fa2|mux|output~0_combout\ = (\ca1|rca|fa1|mux|output~0_combout\ & ((\a[6]~input_o\) # (\b[6]~input_o\))) # (!\ca1|rca|fa1|mux|output~0_combout\ & (\a[6]~input_o\ & \b[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca1|rca|fa1|mux|output~0_combout\,
	datac => \a[6]~input_o\,
	datad => \b[6]~input_o\,
	combout => \ca1|rca|fa2|mux|output~0_combout\);

-- Location: IOIBUF_X43_Y0_N8
\b[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(7),
	o => \b[7]~input_o\);

-- Location: IOIBUF_X46_Y0_N1
\a[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(7),
	o => \a[7]~input_o\);

-- Location: LCCOMB_X42_Y4_N20
\ca1|rca|fa3|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca1|rca|fa3|sum~combout\ = \ca1|rca|fa2|mux|output~0_combout\ $ (\b[7]~input_o\ $ (\a[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca1|rca|fa2|mux|output~0_combout\,
	datac => \b[7]~input_o\,
	datad => \a[7]~input_o\,
	combout => \ca1|rca|fa3|sum~combout\);

-- Location: IOIBUF_X48_Y41_N1
\a[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(8),
	o => \a[8]~input_o\);

-- Location: LCCOMB_X42_Y4_N6
\ca1|rca|fa3|mux|output~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca1|rca|fa3|mux|output~0_combout\ = (\ca1|rca|fa2|mux|output~0_combout\ & ((\b[7]~input_o\) # (\a[7]~input_o\))) # (!\ca1|rca|fa2|mux|output~0_combout\ & (\b[7]~input_o\ & \a[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca1|rca|fa2|mux|output~0_combout\,
	datac => \b[7]~input_o\,
	datad => \a[7]~input_o\,
	combout => \ca1|rca|fa3|mux|output~0_combout\);

-- Location: IOIBUF_X52_Y32_N22
\b[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(8),
	o => \b[8]~input_o\);

-- Location: LCCOMB_X51_Y32_N0
\ca2|rca|fa0|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca2|rca|fa0|sum~combout\ = \a[8]~input_o\ $ (\ca1|rca|fa3|mux|output~0_combout\ $ (\b[8]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \a[8]~input_o\,
	datac => \ca1|rca|fa3|mux|output~0_combout\,
	datad => \b[8]~input_o\,
	combout => \ca2|rca|fa0|sum~combout\);

-- Location: LCCOMB_X51_Y32_N10
\ca2|rca|fa0|mux|output~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca2|rca|fa0|mux|output~0_combout\ = (\a[8]~input_o\ & ((\ca1|rca|fa3|mux|output~0_combout\) # (\b[8]~input_o\))) # (!\a[8]~input_o\ & (\ca1|rca|fa3|mux|output~0_combout\ & \b[8]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \a[8]~input_o\,
	datac => \ca1|rca|fa3|mux|output~0_combout\,
	datad => \b[8]~input_o\,
	combout => \ca2|rca|fa0|mux|output~0_combout\);

-- Location: IOIBUF_X52_Y31_N1
\a[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(9),
	o => \a[9]~input_o\);

-- Location: IOIBUF_X52_Y32_N15
\b[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(9),
	o => \b[9]~input_o\);

-- Location: LCCOMB_X51_Y32_N4
\ca2|rca|fa1|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca2|rca|fa1|sum~combout\ = \ca2|rca|fa0|mux|output~0_combout\ $ (\a[9]~input_o\ $ (\b[9]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca2|rca|fa0|mux|output~0_combout\,
	datac => \a[9]~input_o\,
	datad => \b[9]~input_o\,
	combout => \ca2|rca|fa1|sum~combout\);

-- Location: LCCOMB_X51_Y32_N22
\ca2|rca|fa1|mux|output~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca2|rca|fa1|mux|output~0_combout\ = (\ca2|rca|fa0|mux|output~0_combout\ & ((\a[9]~input_o\) # (\b[9]~input_o\))) # (!\ca2|rca|fa0|mux|output~0_combout\ & (\a[9]~input_o\ & \b[9]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca2|rca|fa0|mux|output~0_combout\,
	datac => \a[9]~input_o\,
	datad => \b[9]~input_o\,
	combout => \ca2|rca|fa1|mux|output~0_combout\);

-- Location: IOIBUF_X48_Y41_N8
\a[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(10),
	o => \a[10]~input_o\);

-- Location: IOIBUF_X52_Y32_N8
\b[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(10),
	o => \b[10]~input_o\);

-- Location: LCCOMB_X51_Y32_N8
\ca2|rca|fa2|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca2|rca|fa2|sum~combout\ = \ca2|rca|fa1|mux|output~0_combout\ $ (\a[10]~input_o\ $ (\b[10]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca2|rca|fa1|mux|output~0_combout\,
	datac => \a[10]~input_o\,
	datad => \b[10]~input_o\,
	combout => \ca2|rca|fa2|sum~combout\);

-- Location: LCCOMB_X51_Y32_N26
\ca2|rca|fa2|mux|output~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca2|rca|fa2|mux|output~0_combout\ = (\ca2|rca|fa1|mux|output~0_combout\ & ((\a[10]~input_o\) # (\b[10]~input_o\))) # (!\ca2|rca|fa1|mux|output~0_combout\ & (\a[10]~input_o\ & \b[10]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca2|rca|fa1|mux|output~0_combout\,
	datac => \a[10]~input_o\,
	datad => \b[10]~input_o\,
	combout => \ca2|rca|fa2|mux|output~0_combout\);

-- Location: IOIBUF_X50_Y41_N1
\b[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(11),
	o => \b[11]~input_o\);

-- Location: IOIBUF_X46_Y41_N22
\a[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(11),
	o => \a[11]~input_o\);

-- Location: LCCOMB_X51_Y32_N20
\ca2|rca|fa3|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca2|rca|fa3|sum~combout\ = \ca2|rca|fa2|mux|output~0_combout\ $ (\b[11]~input_o\ $ (\a[11]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca2|rca|fa2|mux|output~0_combout\,
	datab => \b[11]~input_o\,
	datac => \a[11]~input_o\,
	combout => \ca2|rca|fa3|sum~combout\);

-- Location: IOIBUF_X52_Y23_N8
\a[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(12),
	o => \a[12]~input_o\);

-- Location: LCCOMB_X51_Y32_N6
\ca2|rca|fa3|mux|output~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca2|rca|fa3|mux|output~0_combout\ = (\ca2|rca|fa2|mux|output~0_combout\ & ((\b[11]~input_o\) # (\a[11]~input_o\))) # (!\ca2|rca|fa2|mux|output~0_combout\ & (\b[11]~input_o\ & \a[11]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca2|rca|fa2|mux|output~0_combout\,
	datab => \b[11]~input_o\,
	datac => \a[11]~input_o\,
	combout => \ca2|rca|fa3|mux|output~0_combout\);

-- Location: IOIBUF_X52_Y25_N1
\b[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(12),
	o => \b[12]~input_o\);

-- Location: LCCOMB_X51_Y25_N24
\ca3|rca|fa0|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca3|rca|fa0|sum~combout\ = \a[12]~input_o\ $ (\ca2|rca|fa3|mux|output~0_combout\ $ (\b[12]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \a[12]~input_o\,
	datac => \ca2|rca|fa3|mux|output~0_combout\,
	datad => \b[12]~input_o\,
	combout => \ca3|rca|fa0|sum~combout\);

-- Location: LCCOMB_X51_Y25_N10
\ca3|rca|fa0|mux|output~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca3|rca|fa0|mux|output~0_combout\ = (\a[12]~input_o\ & ((\ca2|rca|fa3|mux|output~0_combout\) # (\b[12]~input_o\))) # (!\a[12]~input_o\ & (\ca2|rca|fa3|mux|output~0_combout\ & \b[12]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \a[12]~input_o\,
	datac => \ca2|rca|fa3|mux|output~0_combout\,
	datad => \b[12]~input_o\,
	combout => \ca3|rca|fa0|mux|output~0_combout\);

-- Location: IOIBUF_X52_Y27_N1
\a[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(13),
	o => \a[13]~input_o\);

-- Location: IOIBUF_X52_Y25_N8
\b[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(13),
	o => \b[13]~input_o\);

-- Location: LCCOMB_X51_Y25_N4
\ca3|rca|fa1|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca3|rca|fa1|sum~combout\ = \ca3|rca|fa0|mux|output~0_combout\ $ (\a[13]~input_o\ $ (\b[13]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca3|rca|fa0|mux|output~0_combout\,
	datab => \a[13]~input_o\,
	datac => \b[13]~input_o\,
	combout => \ca3|rca|fa1|sum~combout\);

-- Location: LCCOMB_X51_Y25_N6
\ca3|rca|fa1|mux|output~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca3|rca|fa1|mux|output~0_combout\ = (\ca3|rca|fa0|mux|output~0_combout\ & ((\a[13]~input_o\) # (\b[13]~input_o\))) # (!\ca3|rca|fa0|mux|output~0_combout\ & (\a[13]~input_o\ & \b[13]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca3|rca|fa0|mux|output~0_combout\,
	datab => \a[13]~input_o\,
	datac => \b[13]~input_o\,
	combout => \ca3|rca|fa1|mux|output~0_combout\);

-- Location: IOIBUF_X52_Y19_N8
\a[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(14),
	o => \a[14]~input_o\);

-- Location: IOIBUF_X52_Y28_N8
\b[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(14),
	o => \b[14]~input_o\);

-- Location: LCCOMB_X51_Y25_N8
\ca3|rca|fa2|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca3|rca|fa2|sum~combout\ = \ca3|rca|fa1|mux|output~0_combout\ $ (\a[14]~input_o\ $ (\b[14]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca3|rca|fa1|mux|output~0_combout\,
	datac => \a[14]~input_o\,
	datad => \b[14]~input_o\,
	combout => \ca3|rca|fa2|sum~combout\);

-- Location: IOIBUF_X52_Y19_N1
\b[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(15),
	o => \b[15]~input_o\);

-- Location: LCCOMB_X51_Y25_N26
\ca3|rca|fa2|mux|output~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca3|rca|fa2|mux|output~0_combout\ = (\ca3|rca|fa1|mux|output~0_combout\ & ((\a[14]~input_o\) # (\b[14]~input_o\))) # (!\ca3|rca|fa1|mux|output~0_combout\ & (\a[14]~input_o\ & \b[14]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ca3|rca|fa1|mux|output~0_combout\,
	datac => \a[14]~input_o\,
	datad => \b[14]~input_o\,
	combout => \ca3|rca|fa2|mux|output~0_combout\);

-- Location: IOIBUF_X52_Y23_N1
\a[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(15),
	o => \a[15]~input_o\);

-- Location: LCCOMB_X51_Y25_N12
\ca3|rca|fa3|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca3|rca|fa3|sum~combout\ = \b[15]~input_o\ $ (\ca3|rca|fa2|mux|output~0_combout\ $ (\a[15]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b[15]~input_o\,
	datac => \ca3|rca|fa2|mux|output~0_combout\,
	datad => \a[15]~input_o\,
	combout => \ca3|rca|fa3|sum~combout\);

-- Location: LCCOMB_X51_Y25_N22
\ca3|LEDR9~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ca3|LEDR9~0_combout\ = (\b[15]~input_o\ & (!\ca3|rca|fa2|mux|output~0_combout\ & \a[15]~input_o\)) # (!\b[15]~input_o\ & (\ca3|rca|fa2|mux|output~0_combout\ & !\a[15]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b[15]~input_o\,
	datac => \ca3|rca|fa2|mux|output~0_combout\,
	datad => \a[15]~input_o\,
	combout => \ca3|LEDR9~0_combout\);

-- Location: IOIBUF_X27_Y0_N8
\rsn~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rsn,
	o => \rsn~input_o\);

-- Location: IOIBUF_X27_Y0_N1
\clock~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

ww_c(0) <= \c[0]~output_o\;

ww_c(1) <= \c[1]~output_o\;

ww_c(2) <= \c[2]~output_o\;

ww_c(3) <= \c[3]~output_o\;

ww_c(4) <= \c[4]~output_o\;

ww_c(5) <= \c[5]~output_o\;

ww_c(6) <= \c[6]~output_o\;

ww_c(7) <= \c[7]~output_o\;

ww_c(8) <= \c[8]~output_o\;

ww_c(9) <= \c[9]~output_o\;

ww_c(10) <= \c[10]~output_o\;

ww_c(11) <= \c[11]~output_o\;

ww_c(12) <= \c[12]~output_o\;

ww_c(13) <= \c[13]~output_o\;

ww_c(14) <= \c[14]~output_o\;

ww_c(15) <= \c[15]~output_o\;

ww_ovrf <= \ovrf~output_o\;
END structure;


