-------------------------------------------------------------------------------
--
-- Title       : converter_bcd_2421
-- Design      : lab03
-- Author      : iftikhan95
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\lab03\lab03\src\CPOS.vhd
-- Generated   : Mon Feb 18 00:41:03 2019
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
--{entity {converter_bcd_2421} architecture {cpos}}

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

architecture cpos of converter_bcd_2421 is
begin
	p <= (d or c or b or a) and ( d or c or b or not a) and (d or c or not b or a) 
	and ( d or c or not b or not a) and (d or not c or b or a);
	q <= (d or c or b or a) and ( d or c or b or not a) and ( d or c or not b or a)
	and ( not b or c or not b or a );
	r <= (d or c or b or a) and ( d or c or b or not a ) and ( d or not c or b or a) 
	and ( d or not c or not b or a) and ( d or not c or not b or not a);
	s <= a ;
	
	 -- enter your statements here --

end cpos;
