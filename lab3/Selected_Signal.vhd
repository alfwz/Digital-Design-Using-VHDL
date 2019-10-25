-------------------------------------------------------------------------------
--
-- Title       : converter_bcd_2421
-- Design      : lab03
-- Author      : iftikhan95
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\lab03\lab03\src\Selected_Signal.vhd
-- Generated   : Tue Feb 19 01:30:48 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {converter_bcd_2421} architecture {selected}}

library IEEE;
use IEEE.std_logic_1164.all;

entity converter_bcd_2421 is
	 port(
		 a : in STD_LOGIC;
		 b : in STD_LOGIC;
		 c : in STD_LOGIC;
		 d : in STD_LOGIC;
		 p : out STD_LOGIC;
		 q : out STD_LOGIC;
		 r : out STD_LOGIC;
		 s : out STD_LOGIC
	     );
end converter_bcd_2421;

--}} End of automatically maintained section

architecture selected of converter_bcd_2421 is
begin
	--	dcba pqrs
	--0 0000 000 0
	--1 0001 000 1
	--2 0010 001 0
	--3 0011 001 1
	--4 0100 010 0
	--5 0101 101 1
	--6 0110 110 0
	--7 0111 110 1
	--8 1000 111 0
	--9 1001 111 1	
	with std_logic_vector'(d,c,b,a)select  	
	p <= '0' when "0000",
	'0' when "0001",
	'0' when "0010",
	'0' when "0011",
	'0' when "0100",
	'1' when others; 
	
	with std_logic_vector'(d,c,b,a)select 
	q <= '0' when "0000", 
	'0' when "0001", 
	'0' when "0010", 
	'0' when "0011", 
	'0' when "0101", 
	'1' when others;
	
	with std_logic_vector'(d,c,b,a)select 
	r <= '1' when "0010", 
 	'1' when "0011", 
 	'1' when "0101", 
 	'1' when "1000", 
 	'1' when "1001",
 	'0' when others;
 	
	 with std_logic_vector'(d,c,b,a)select 
	s <= '1' when "0001",
	'1' when "0011",
	'1' when "0101",
	'1' when "0111",
	'1' when "1001",
	'0' when others; 
	
end selected;
