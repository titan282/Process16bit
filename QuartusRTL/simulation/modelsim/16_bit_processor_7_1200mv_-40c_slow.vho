-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "01/06/2022 20:47:59"

-- 
-- Device: Altera EP3C120F780I7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	pc IS
    PORT (
	clk : IN std_logic;
	PC_in : IN std_logic_vector(15 DOWNTO 0);
	PCclr : IN std_logic;
	PCld : IN std_logic;
	PCinc : IN std_logic;
	PC_out : OUT std_logic_vector(15 DOWNTO 0)
	);
END pc;

-- Design Ports Information
-- PC_out[0]	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_out[1]	=>  Location: PIN_M3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_out[2]	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_out[3]	=>  Location: PIN_K7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_out[4]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_out[5]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_out[6]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_out[7]	=>  Location: PIN_J5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_out[8]	=>  Location: PIN_K4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_out[9]	=>  Location: PIN_N3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_out[10]	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_out[11]	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_out[12]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_out[13]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_out[14]	=>  Location: PIN_L3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_out[15]	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_in[0]	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PCclr	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PCinc	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PCld	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_in[1]	=>  Location: PIN_J4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_in[2]	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_in[3]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_in[4]	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_in[5]	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_in[6]	=>  Location: PIN_K3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_in[7]	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_in[8]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_in[9]	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_in[10]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_in[11]	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_in[12]	=>  Location: PIN_L6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_in[13]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_in[14]	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC_in[15]	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF pc IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_PC_in : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_PCclr : std_logic;
SIGNAL ww_PCld : std_logic;
SIGNAL ww_PCinc : std_logic;
SIGNAL ww_PC_out : std_logic_vector(15 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \PCclr~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \PC_out[0]~output_o\ : std_logic;
SIGNAL \PC_out[1]~output_o\ : std_logic;
SIGNAL \PC_out[2]~output_o\ : std_logic;
SIGNAL \PC_out[3]~output_o\ : std_logic;
SIGNAL \PC_out[4]~output_o\ : std_logic;
SIGNAL \PC_out[5]~output_o\ : std_logic;
SIGNAL \PC_out[6]~output_o\ : std_logic;
SIGNAL \PC_out[7]~output_o\ : std_logic;
SIGNAL \PC_out[8]~output_o\ : std_logic;
SIGNAL \PC_out[9]~output_o\ : std_logic;
SIGNAL \PC_out[10]~output_o\ : std_logic;
SIGNAL \PC_out[11]~output_o\ : std_logic;
SIGNAL \PC_out[12]~output_o\ : std_logic;
SIGNAL \PC_out[13]~output_o\ : std_logic;
SIGNAL \PC_out[14]~output_o\ : std_logic;
SIGNAL \PC_out[15]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \pc_temp[0]~16_combout\ : std_logic;
SIGNAL \PC_in[0]~input_o\ : std_logic;
SIGNAL \PCclr~input_o\ : std_logic;
SIGNAL \PCclr~inputclkctrl_outclk\ : std_logic;
SIGNAL \PCinc~input_o\ : std_logic;
SIGNAL \PCld~input_o\ : std_logic;
SIGNAL \pc_temp[0]~18_combout\ : std_logic;
SIGNAL \pc_temp[0]~17\ : std_logic;
SIGNAL \pc_temp[1]~19_combout\ : std_logic;
SIGNAL \PC_in[1]~input_o\ : std_logic;
SIGNAL \pc_temp[1]~20\ : std_logic;
SIGNAL \pc_temp[2]~21_combout\ : std_logic;
SIGNAL \PC_in[2]~input_o\ : std_logic;
SIGNAL \pc_temp[2]~22\ : std_logic;
SIGNAL \pc_temp[3]~23_combout\ : std_logic;
SIGNAL \PC_in[3]~input_o\ : std_logic;
SIGNAL \pc_temp[3]~24\ : std_logic;
SIGNAL \pc_temp[4]~25_combout\ : std_logic;
SIGNAL \PC_in[4]~input_o\ : std_logic;
SIGNAL \pc_temp[4]~26\ : std_logic;
SIGNAL \pc_temp[5]~27_combout\ : std_logic;
SIGNAL \PC_in[5]~input_o\ : std_logic;
SIGNAL \pc_temp[5]~28\ : std_logic;
SIGNAL \pc_temp[6]~29_combout\ : std_logic;
SIGNAL \PC_in[6]~input_o\ : std_logic;
SIGNAL \pc_temp[6]~30\ : std_logic;
SIGNAL \pc_temp[7]~31_combout\ : std_logic;
SIGNAL \PC_in[7]~input_o\ : std_logic;
SIGNAL \pc_temp[7]~32\ : std_logic;
SIGNAL \pc_temp[8]~33_combout\ : std_logic;
SIGNAL \PC_in[8]~input_o\ : std_logic;
SIGNAL \pc_temp[8]~34\ : std_logic;
SIGNAL \pc_temp[9]~35_combout\ : std_logic;
SIGNAL \PC_in[9]~input_o\ : std_logic;
SIGNAL \pc_temp[9]~36\ : std_logic;
SIGNAL \pc_temp[10]~37_combout\ : std_logic;
SIGNAL \PC_in[10]~input_o\ : std_logic;
SIGNAL \pc_temp[10]~38\ : std_logic;
SIGNAL \pc_temp[11]~39_combout\ : std_logic;
SIGNAL \PC_in[11]~input_o\ : std_logic;
SIGNAL \pc_temp[11]~40\ : std_logic;
SIGNAL \pc_temp[12]~41_combout\ : std_logic;
SIGNAL \PC_in[12]~input_o\ : std_logic;
SIGNAL \pc_temp[12]~42\ : std_logic;
SIGNAL \pc_temp[13]~43_combout\ : std_logic;
SIGNAL \PC_in[13]~input_o\ : std_logic;
SIGNAL \pc_temp[13]~44\ : std_logic;
SIGNAL \pc_temp[14]~45_combout\ : std_logic;
SIGNAL \PC_in[14]~input_o\ : std_logic;
SIGNAL \pc_temp[14]~46\ : std_logic;
SIGNAL \pc_temp[15]~47_combout\ : std_logic;
SIGNAL \PC_in[15]~input_o\ : std_logic;
SIGNAL pc_temp : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_PCclr~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_PCinc~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_PC_in <= PC_in;
ww_PCclr <= PCclr;
ww_PCld <= PCld;
ww_PCinc <= PCinc;
PC_out <= ww_PC_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\PCclr~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \PCclr~input_o\);
\ALT_INV_PCclr~inputclkctrl_outclk\ <= NOT \PCclr~inputclkctrl_outclk\;
\ALT_INV_PCinc~input_o\ <= NOT \PCinc~input_o\;

-- Location: IOOBUF_X0_Y58_N16
\PC_out[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => pc_temp(0),
	devoe => ww_devoe,
	o => \PC_out[0]~output_o\);

-- Location: IOOBUF_X0_Y51_N16
\PC_out[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => pc_temp(1),
	devoe => ww_devoe,
	o => \PC_out[1]~output_o\);

-- Location: IOOBUF_X0_Y49_N2
\PC_out[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => pc_temp(2),
	devoe => ww_devoe,
	o => \PC_out[2]~output_o\);

-- Location: IOOBUF_X0_Y49_N9
\PC_out[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => pc_temp(3),
	devoe => ww_devoe,
	o => \PC_out[3]~output_o\);

-- Location: IOOBUF_X0_Y45_N16
\PC_out[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => pc_temp(4),
	devoe => ww_devoe,
	o => \PC_out[4]~output_o\);

-- Location: IOOBUF_X0_Y47_N16
\PC_out[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => pc_temp(5),
	devoe => ww_devoe,
	o => \PC_out[5]~output_o\);

-- Location: IOOBUF_X0_Y48_N2
\PC_out[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => pc_temp(6),
	devoe => ww_devoe,
	o => \PC_out[6]~output_o\);

-- Location: IOOBUF_X0_Y50_N23
\PC_out[7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => pc_temp(7),
	devoe => ww_devoe,
	o => \PC_out[7]~output_o\);

-- Location: IOOBUF_X0_Y53_N2
\PC_out[8]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => pc_temp(8),
	devoe => ww_devoe,
	o => \PC_out[8]~output_o\);

-- Location: IOOBUF_X0_Y46_N23
\PC_out[9]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => pc_temp(9),
	devoe => ww_devoe,
	o => \PC_out[9]~output_o\);

-- Location: IOOBUF_X0_Y52_N23
\PC_out[10]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => pc_temp(10),
	devoe => ww_devoe,
	o => \PC_out[10]~output_o\);

-- Location: IOOBUF_X0_Y55_N16
\PC_out[11]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => pc_temp(11),
	devoe => ww_devoe,
	o => \PC_out[11]~output_o\);

-- Location: IOOBUF_X0_Y52_N2
\PC_out[12]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => pc_temp(12),
	devoe => ww_devoe,
	o => \PC_out[12]~output_o\);

-- Location: IOOBUF_X0_Y46_N16
\PC_out[13]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => pc_temp(13),
	devoe => ww_devoe,
	o => \PC_out[13]~output_o\);

-- Location: IOOBUF_X0_Y52_N16
\PC_out[14]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => pc_temp(14),
	devoe => ww_devoe,
	o => \PC_out[14]~output_o\);

-- Location: IOOBUF_X0_Y54_N9
\PC_out[15]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => pc_temp(15),
	devoe => ww_devoe,
	o => \PC_out[15]~output_o\);

-- Location: IOIBUF_X0_Y36_N1
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X1_Y49_N0
\pc_temp[0]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pc_temp[0]~16_combout\ = pc_temp(0) $ (VCC)
-- \pc_temp[0]~17\ = CARRY(pc_temp(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => pc_temp(0),
	datad => VCC,
	combout => \pc_temp[0]~16_combout\,
	cout => \pc_temp[0]~17\);

-- Location: IOIBUF_X0_Y50_N15
\PC_in[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_in(0),
	o => \PC_in[0]~input_o\);

-- Location: IOIBUF_X0_Y36_N8
\PCclr~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PCclr,
	o => \PCclr~input_o\);

-- Location: CLKCTRL_G2
\PCclr~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \PCclr~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \PCclr~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y44_N1
\PCinc~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PCinc,
	o => \PCinc~input_o\);

-- Location: IOIBUF_X0_Y44_N8
\PCld~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PCld,
	o => \PCld~input_o\);

-- Location: LCCOMB_X1_Y44_N0
\pc_temp[0]~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pc_temp[0]~18_combout\ = (\PCinc~input_o\) # (\PCld~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \PCinc~input_o\,
	datad => \PCld~input_o\,
	combout => \pc_temp[0]~18_combout\);

-- Location: FF_X1_Y49_N1
\pc_temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_temp[0]~16_combout\,
	asdata => \PC_in[0]~input_o\,
	clrn => \ALT_INV_PCclr~inputclkctrl_outclk\,
	sload => \ALT_INV_PCinc~input_o\,
	ena => \pc_temp[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc_temp(0));

-- Location: LCCOMB_X1_Y49_N2
\pc_temp[1]~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pc_temp[1]~19_combout\ = (pc_temp(1) & (!\pc_temp[0]~17\)) # (!pc_temp(1) & ((\pc_temp[0]~17\) # (GND)))
-- \pc_temp[1]~20\ = CARRY((!\pc_temp[0]~17\) # (!pc_temp(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pc_temp(1),
	datad => VCC,
	cin => \pc_temp[0]~17\,
	combout => \pc_temp[1]~19_combout\,
	cout => \pc_temp[1]~20\);

-- Location: IOIBUF_X0_Y57_N15
\PC_in[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_in(1),
	o => \PC_in[1]~input_o\);

-- Location: FF_X1_Y49_N3
\pc_temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_temp[1]~19_combout\,
	asdata => \PC_in[1]~input_o\,
	clrn => \ALT_INV_PCclr~inputclkctrl_outclk\,
	sload => \ALT_INV_PCinc~input_o\,
	ena => \pc_temp[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc_temp(1));

-- Location: LCCOMB_X1_Y49_N4
\pc_temp[2]~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pc_temp[2]~21_combout\ = (pc_temp(2) & (\pc_temp[1]~20\ $ (GND))) # (!pc_temp(2) & (!\pc_temp[1]~20\ & VCC))
-- \pc_temp[2]~22\ = CARRY((pc_temp(2) & !\pc_temp[1]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pc_temp(2),
	datad => VCC,
	cin => \pc_temp[1]~20\,
	combout => \pc_temp[2]~21_combout\,
	cout => \pc_temp[2]~22\);

-- Location: IOIBUF_X0_Y55_N22
\PC_in[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_in(2),
	o => \PC_in[2]~input_o\);

-- Location: FF_X1_Y49_N5
\pc_temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_temp[2]~21_combout\,
	asdata => \PC_in[2]~input_o\,
	clrn => \ALT_INV_PCclr~inputclkctrl_outclk\,
	sload => \ALT_INV_PCinc~input_o\,
	ena => \pc_temp[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc_temp(2));

-- Location: LCCOMB_X1_Y49_N6
\pc_temp[3]~23\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pc_temp[3]~23_combout\ = (pc_temp(3) & (!\pc_temp[2]~22\)) # (!pc_temp(3) & ((\pc_temp[2]~22\) # (GND)))
-- \pc_temp[3]~24\ = CARRY((!\pc_temp[2]~22\) # (!pc_temp(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pc_temp(3),
	datad => VCC,
	cin => \pc_temp[2]~22\,
	combout => \pc_temp[3]~23_combout\,
	cout => \pc_temp[3]~24\);

-- Location: IOIBUF_X0_Y42_N8
\PC_in[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_in(3),
	o => \PC_in[3]~input_o\);

-- Location: FF_X1_Y49_N7
\pc_temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_temp[3]~23_combout\,
	asdata => \PC_in[3]~input_o\,
	clrn => \ALT_INV_PCclr~inputclkctrl_outclk\,
	sload => \ALT_INV_PCinc~input_o\,
	ena => \pc_temp[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc_temp(3));

-- Location: LCCOMB_X1_Y49_N8
\pc_temp[4]~25\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pc_temp[4]~25_combout\ = (pc_temp(4) & (\pc_temp[3]~24\ $ (GND))) # (!pc_temp(4) & (!\pc_temp[3]~24\ & VCC))
-- \pc_temp[4]~26\ = CARRY((pc_temp(4) & !\pc_temp[3]~24\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pc_temp(4),
	datad => VCC,
	cin => \pc_temp[3]~24\,
	combout => \pc_temp[4]~25_combout\,
	cout => \pc_temp[4]~26\);

-- Location: IOIBUF_X0_Y57_N22
\PC_in[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_in(4),
	o => \PC_in[4]~input_o\);

-- Location: FF_X1_Y49_N9
\pc_temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_temp[4]~25_combout\,
	asdata => \PC_in[4]~input_o\,
	clrn => \ALT_INV_PCclr~inputclkctrl_outclk\,
	sload => \ALT_INV_PCinc~input_o\,
	ena => \pc_temp[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc_temp(4));

-- Location: LCCOMB_X1_Y49_N10
\pc_temp[5]~27\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pc_temp[5]~27_combout\ = (pc_temp(5) & (!\pc_temp[4]~26\)) # (!pc_temp(5) & ((\pc_temp[4]~26\) # (GND)))
-- \pc_temp[5]~28\ = CARRY((!\pc_temp[4]~26\) # (!pc_temp(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pc_temp(5),
	datad => VCC,
	cin => \pc_temp[4]~26\,
	combout => \pc_temp[5]~27_combout\,
	cout => \pc_temp[5]~28\);

-- Location: IOIBUF_X0_Y44_N22
\PC_in[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_in(5),
	o => \PC_in[5]~input_o\);

-- Location: FF_X1_Y49_N11
\pc_temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_temp[5]~27_combout\,
	asdata => \PC_in[5]~input_o\,
	clrn => \ALT_INV_PCclr~inputclkctrl_outclk\,
	sload => \ALT_INV_PCinc~input_o\,
	ena => \pc_temp[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc_temp(5));

-- Location: LCCOMB_X1_Y49_N12
\pc_temp[6]~29\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pc_temp[6]~29_combout\ = (pc_temp(6) & (\pc_temp[5]~28\ $ (GND))) # (!pc_temp(6) & (!\pc_temp[5]~28\ & VCC))
-- \pc_temp[6]~30\ = CARRY((pc_temp(6) & !\pc_temp[5]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pc_temp(6),
	datad => VCC,
	cin => \pc_temp[5]~28\,
	combout => \pc_temp[6]~29_combout\,
	cout => \pc_temp[6]~30\);

-- Location: IOIBUF_X0_Y53_N8
\PC_in[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_in(6),
	o => \PC_in[6]~input_o\);

-- Location: FF_X1_Y49_N13
\pc_temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_temp[6]~29_combout\,
	asdata => \PC_in[6]~input_o\,
	clrn => \ALT_INV_PCclr~inputclkctrl_outclk\,
	sload => \ALT_INV_PCinc~input_o\,
	ena => \pc_temp[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc_temp(6));

-- Location: LCCOMB_X1_Y49_N14
\pc_temp[7]~31\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pc_temp[7]~31_combout\ = (pc_temp(7) & (!\pc_temp[6]~30\)) # (!pc_temp(7) & ((\pc_temp[6]~30\) # (GND)))
-- \pc_temp[7]~32\ = CARRY((!\pc_temp[6]~30\) # (!pc_temp(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pc_temp(7),
	datad => VCC,
	cin => \pc_temp[6]~30\,
	combout => \pc_temp[7]~31_combout\,
	cout => \pc_temp[7]~32\);

-- Location: IOIBUF_X0_Y43_N15
\PC_in[7]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_in(7),
	o => \PC_in[7]~input_o\);

-- Location: FF_X1_Y49_N15
\pc_temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_temp[7]~31_combout\,
	asdata => \PC_in[7]~input_o\,
	clrn => \ALT_INV_PCclr~inputclkctrl_outclk\,
	sload => \ALT_INV_PCinc~input_o\,
	ena => \pc_temp[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc_temp(7));

-- Location: LCCOMB_X1_Y49_N16
\pc_temp[8]~33\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pc_temp[8]~33_combout\ = (pc_temp(8) & (\pc_temp[7]~32\ $ (GND))) # (!pc_temp(8) & (!\pc_temp[7]~32\ & VCC))
-- \pc_temp[8]~34\ = CARRY((pc_temp(8) & !\pc_temp[7]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pc_temp(8),
	datad => VCC,
	cin => \pc_temp[7]~32\,
	combout => \pc_temp[8]~33_combout\,
	cout => \pc_temp[8]~34\);

-- Location: IOIBUF_X0_Y48_N8
\PC_in[8]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_in(8),
	o => \PC_in[8]~input_o\);

-- Location: FF_X1_Y49_N17
\pc_temp[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_temp[8]~33_combout\,
	asdata => \PC_in[8]~input_o\,
	clrn => \ALT_INV_PCclr~inputclkctrl_outclk\,
	sload => \ALT_INV_PCinc~input_o\,
	ena => \pc_temp[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc_temp(8));

-- Location: LCCOMB_X1_Y49_N18
\pc_temp[9]~35\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pc_temp[9]~35_combout\ = (pc_temp(9) & (!\pc_temp[8]~34\)) # (!pc_temp(9) & ((\pc_temp[8]~34\) # (GND)))
-- \pc_temp[9]~36\ = CARRY((!\pc_temp[8]~34\) # (!pc_temp(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pc_temp(9),
	datad => VCC,
	cin => \pc_temp[8]~34\,
	combout => \pc_temp[9]~35_combout\,
	cout => \pc_temp[9]~36\);

-- Location: IOIBUF_X0_Y47_N1
\PC_in[9]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_in(9),
	o => \PC_in[9]~input_o\);

-- Location: FF_X1_Y49_N19
\pc_temp[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_temp[9]~35_combout\,
	asdata => \PC_in[9]~input_o\,
	clrn => \ALT_INV_PCclr~inputclkctrl_outclk\,
	sload => \ALT_INV_PCinc~input_o\,
	ena => \pc_temp[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc_temp(9));

-- Location: LCCOMB_X1_Y49_N20
\pc_temp[10]~37\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pc_temp[10]~37_combout\ = (pc_temp(10) & (\pc_temp[9]~36\ $ (GND))) # (!pc_temp(10) & (!\pc_temp[9]~36\ & VCC))
-- \pc_temp[10]~38\ = CARRY((pc_temp(10) & !\pc_temp[9]~36\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pc_temp(10),
	datad => VCC,
	cin => \pc_temp[9]~36\,
	combout => \pc_temp[10]~37_combout\,
	cout => \pc_temp[10]~38\);

-- Location: IOIBUF_X0_Y45_N22
\PC_in[10]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_in(10),
	o => \PC_in[10]~input_o\);

-- Location: FF_X1_Y49_N21
\pc_temp[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_temp[10]~37_combout\,
	asdata => \PC_in[10]~input_o\,
	clrn => \ALT_INV_PCclr~inputclkctrl_outclk\,
	sload => \ALT_INV_PCinc~input_o\,
	ena => \pc_temp[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc_temp(10));

-- Location: LCCOMB_X1_Y49_N22
\pc_temp[11]~39\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pc_temp[11]~39_combout\ = (pc_temp(11) & (!\pc_temp[10]~38\)) # (!pc_temp(11) & ((\pc_temp[10]~38\) # (GND)))
-- \pc_temp[11]~40\ = CARRY((!\pc_temp[10]~38\) # (!pc_temp(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pc_temp(11),
	datad => VCC,
	cin => \pc_temp[10]~38\,
	combout => \pc_temp[11]~39_combout\,
	cout => \pc_temp[11]~40\);

-- Location: IOIBUF_X0_Y42_N1
\PC_in[11]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_in(11),
	o => \PC_in[11]~input_o\);

-- Location: FF_X1_Y49_N23
\pc_temp[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_temp[11]~39_combout\,
	asdata => \PC_in[11]~input_o\,
	clrn => \ALT_INV_PCclr~inputclkctrl_outclk\,
	sload => \ALT_INV_PCinc~input_o\,
	ena => \pc_temp[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc_temp(11));

-- Location: LCCOMB_X1_Y49_N24
\pc_temp[12]~41\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pc_temp[12]~41_combout\ = (pc_temp(12) & (\pc_temp[11]~40\ $ (GND))) # (!pc_temp(12) & (!\pc_temp[11]~40\ & VCC))
-- \pc_temp[12]~42\ = CARRY((pc_temp(12) & !\pc_temp[11]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pc_temp(12),
	datad => VCC,
	cin => \pc_temp[11]~40\,
	combout => \pc_temp[12]~41_combout\,
	cout => \pc_temp[12]~42\);

-- Location: IOIBUF_X0_Y47_N22
\PC_in[12]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_in(12),
	o => \PC_in[12]~input_o\);

-- Location: FF_X1_Y49_N25
\pc_temp[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_temp[12]~41_combout\,
	asdata => \PC_in[12]~input_o\,
	clrn => \ALT_INV_PCclr~inputclkctrl_outclk\,
	sload => \ALT_INV_PCinc~input_o\,
	ena => \pc_temp[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc_temp(12));

-- Location: LCCOMB_X1_Y49_N26
\pc_temp[13]~43\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pc_temp[13]~43_combout\ = (pc_temp(13) & (!\pc_temp[12]~42\)) # (!pc_temp(13) & ((\pc_temp[12]~42\) # (GND)))
-- \pc_temp[13]~44\ = CARRY((!\pc_temp[12]~42\) # (!pc_temp(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pc_temp(13),
	datad => VCC,
	cin => \pc_temp[12]~42\,
	combout => \pc_temp[13]~43_combout\,
	cout => \pc_temp[13]~44\);

-- Location: IOIBUF_X0_Y55_N8
\PC_in[13]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_in(13),
	o => \PC_in[13]~input_o\);

-- Location: FF_X1_Y49_N27
\pc_temp[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_temp[13]~43_combout\,
	asdata => \PC_in[13]~input_o\,
	clrn => \ALT_INV_PCclr~inputclkctrl_outclk\,
	sload => \ALT_INV_PCinc~input_o\,
	ena => \pc_temp[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc_temp(13));

-- Location: LCCOMB_X1_Y49_N28
\pc_temp[14]~45\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pc_temp[14]~45_combout\ = (pc_temp(14) & (\pc_temp[13]~44\ $ (GND))) # (!pc_temp(14) & (!\pc_temp[13]~44\ & VCC))
-- \pc_temp[14]~46\ = CARRY((pc_temp(14) & !\pc_temp[13]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pc_temp(14),
	datad => VCC,
	cin => \pc_temp[13]~44\,
	combout => \pc_temp[14]~45_combout\,
	cout => \pc_temp[14]~46\);

-- Location: IOIBUF_X0_Y35_N8
\PC_in[14]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_in(14),
	o => \PC_in[14]~input_o\);

-- Location: FF_X1_Y49_N29
\pc_temp[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_temp[14]~45_combout\,
	asdata => \PC_in[14]~input_o\,
	clrn => \ALT_INV_PCclr~inputclkctrl_outclk\,
	sload => \ALT_INV_PCinc~input_o\,
	ena => \pc_temp[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc_temp(14));

-- Location: LCCOMB_X1_Y49_N30
\pc_temp[15]~47\ : cycloneiii_lcell_comb
-- Equation(s):
-- \pc_temp[15]~47_combout\ = pc_temp(15) $ (\pc_temp[14]~46\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pc_temp(15),
	cin => \pc_temp[14]~46\,
	combout => \pc_temp[15]~47_combout\);

-- Location: IOIBUF_X0_Y44_N15
\PC_in[15]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC_in(15),
	o => \PC_in[15]~input_o\);

-- Location: FF_X1_Y49_N31
\pc_temp[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pc_temp[15]~47_combout\,
	asdata => \PC_in[15]~input_o\,
	clrn => \ALT_INV_PCclr~inputclkctrl_outclk\,
	sload => \ALT_INV_PCinc~input_o\,
	ena => \pc_temp[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pc_temp(15));

ww_PC_out(0) <= \PC_out[0]~output_o\;

ww_PC_out(1) <= \PC_out[1]~output_o\;

ww_PC_out(2) <= \PC_out[2]~output_o\;

ww_PC_out(3) <= \PC_out[3]~output_o\;

ww_PC_out(4) <= \PC_out[4]~output_o\;

ww_PC_out(5) <= \PC_out[5]~output_o\;

ww_PC_out(6) <= \PC_out[6]~output_o\;

ww_PC_out(7) <= \PC_out[7]~output_o\;

ww_PC_out(8) <= \PC_out[8]~output_o\;

ww_PC_out(9) <= \PC_out[9]~output_o\;

ww_PC_out(10) <= \PC_out[10]~output_o\;

ww_PC_out(11) <= \PC_out[11]~output_o\;

ww_PC_out(12) <= \PC_out[12]~output_o\;

ww_PC_out(13) <= \PC_out[13]~output_o\;

ww_PC_out(14) <= \PC_out[14]~output_o\;

ww_PC_out(15) <= \PC_out[15]~output_o\;
END structure;


