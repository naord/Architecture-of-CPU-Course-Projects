-- megafunction wizard: %Shift register (RAM-based)%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: ALTSHIFT_TAPS 

-- ============================================================
-- File Name: window_buffer.vhd
-- Megafunction Name(s):
-- 			ALTSHIFT_TAPS
--
-- Simulation Library Files(s):
-- 			altera_mf
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 12.1 Build 177 11/07/2012 SJ Web Edition
-- ************************************************************


--Copyright (C) 1991-2012 Altera Corporation
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, Altera MegaCore Function License 
--Agreement, or other applicable license agreement, including, 
--without limitation, that your use is for the sole purpose of 
--programming logic devices manufactured by Altera and sold by 
--Altera or its authorized distributors.  Please refer to the 
--applicable agreement for further details.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY window_buffer IS
	PORT
	(
		clken		: IN STD_LOGIC  := '1';
		clock		: IN STD_LOGIC ;
		shiftin		: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
		shiftout		: OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
		taps		: OUT STD_LOGIC_VECTOR (11 DOWNTO 0)
	);
END window_buffer;


ARCHITECTURE SYN OF window_buffer IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (11 DOWNTO 0);
	SIGNAL sub_wire1	: STD_LOGIC_VECTOR (11 DOWNTO 0);



	COMPONENT altshift_taps
	GENERIC (
		intended_device_family		: STRING;
		lpm_hint		: STRING;
		lpm_type		: STRING;
		number_of_taps		: NATURAL;
		tap_distance		: NATURAL;
		width		: NATURAL
	);
	PORT (
			clock	: IN STD_LOGIC ;
			shiftout	: OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
			taps	: OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
			clken	: IN STD_LOGIC ;
			shiftin	: IN STD_LOGIC_VECTOR (11 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	shiftout    <= sub_wire0(11 DOWNTO 0);
	taps    <= sub_wire1(11 DOWNTO 0);

	ALTSHIFT_TAPS_component : ALTSHIFT_TAPS
	GENERIC MAP (
		intended_device_family => "Cyclone II",
		lpm_hint => "RAM_BLOCK_TYPE=M4K",
		lpm_type => "altshift_taps",
		number_of_taps => 1,
		tap_distance => 5,
		width => 12
	)
	PORT MAP (
		clock => clock,
		clken => clken,
		shiftin => shiftin,
		shiftout => sub_wire0,
		taps => sub_wire1
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: ACLR NUMERIC "0"
-- Retrieval info: PRIVATE: CLKEN NUMERIC "1"
-- Retrieval info: PRIVATE: GROUP_TAPS NUMERIC "1"
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
-- Retrieval info: PRIVATE: NUMBER_OF_TAPS NUMERIC "1"
-- Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "1"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: TAP_DISTANCE NUMERIC "5"
-- Retrieval info: PRIVATE: WIDTH NUMERIC "12"
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
-- Retrieval info: CONSTANT: LPM_HINT STRING "RAM_BLOCK_TYPE=M4K"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "altshift_taps"
-- Retrieval info: CONSTANT: NUMBER_OF_TAPS NUMERIC "1"
-- Retrieval info: CONSTANT: TAP_DISTANCE NUMERIC "5"
-- Retrieval info: CONSTANT: WIDTH NUMERIC "12"
-- Retrieval info: USED_PORT: clken 0 0 0 0 INPUT VCC "clken"
-- Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
-- Retrieval info: USED_PORT: shiftin 0 0 12 0 INPUT NODEFVAL "shiftin[11..0]"
-- Retrieval info: USED_PORT: shiftout 0 0 12 0 OUTPUT NODEFVAL "shiftout[11..0]"
-- Retrieval info: USED_PORT: taps 0 0 12 0 OUTPUT NODEFVAL "taps[11..0]"
-- Retrieval info: CONNECT: @clken 0 0 0 0 clken 0 0 0 0
-- Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
-- Retrieval info: CONNECT: @shiftin 0 0 12 0 shiftin 0 0 12 0
-- Retrieval info: CONNECT: shiftout 0 0 12 0 @shiftout 0 0 12 0
-- Retrieval info: CONNECT: taps 0 0 12 0 @taps 0 0 12 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL window_buffer.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL window_buffer.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL window_buffer.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL window_buffer.bsf FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL window_buffer_inst.vhd FALSE
-- Retrieval info: LIB_FILE: altera_mf
