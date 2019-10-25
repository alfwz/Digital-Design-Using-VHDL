-------------------------------------------------------------------------------
--
-- Title       : converter_bcd_2421
-- Design      : lab03
-- Author      : iftikhan95
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\lab03\lab03\src\CSOP.vhd
-- Generated   : Mon Feb 18 00:12:59 2019
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
--{entity {converter_bcd_2421} architecture {dataflow}}

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

architecture dataflow of converter_bcd_2421 is

	p <= ( not d and c and not b and a) or (not d and c and b and not a) 
	or (not d and c and b and a ) or (d);
	q <= ( not d and c and not b and not a) or ( not d and c and b and not a)
	or (not d and c and b and a) or (d);
	r <= (not d and not c and b and a) or (not d and not c and b and not a)
	or ( not d and c and not b and a) or (d);
	s <= a;
	 -- enter your statements here --

end dataflow;
