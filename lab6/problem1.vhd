-------------------------------------------------------------------------------
--
-- Title       : problem1
-- Design      : task1a
-- Author      : Taylor
-- Company     : StonyBrook
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE382Prelab6\task1a\src\problem1.vhd
-- Generated   : Wed Mar 13 19:52:01 2019
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
--{entity {problem1} architecture {problem1}}

library IEEE;
use IEEE.std_logic_1164.all;

entity comb_fcn is
	 port(
		 a : in STD_LOGIC;
		 b : in STD_LOGIC;
		 c : in STD_LOGIC;
		 x : out STD_LOGIC;
		 y : out STD_LOGIC
	     );
end comb_fcn;

--}} End of automatically maintained section

architecture dataflow of comb_fcn is
begin

	x<=(not a and not b and not c) or (not a and b and not c) or (a and b and c);
	y<=(a or not b or c) and (not a or b or c) and (not a or not b or c);

end dataflow;
