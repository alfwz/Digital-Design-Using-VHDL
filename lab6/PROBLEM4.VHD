-------------------------------------------------------------------------------
--
-- Title       : Problem4
-- Design      : Testbench3
-- Author      : admin
-- Company     : SBU
--
-------------------------------------------------------------------------------
--
-- File        : F:\ESE382\Lab6\ESE382Prelab6c\Testbench3\src\Problem4.vhd
-- Generated   : Thu Mar 14 11:19:33 2019
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
--{entity {Problem4} architecture {Problem4}}

library IEEE;
use IEEE.std_logic_1164.all;

entity ic_74hc153 is
	 port(
		 i0 : in STD_LOGIC;
		 i1 : in STD_LOGIC;
		 i2 : in STD_LOGIC;
		 i3 : in STD_LOGIC;
		 e_bar : in STD_LOGIC;
		 s0 : in STD_LOGIC;
		 s1 : in STD_LOGIC;
		 y : out STD_LOGIC
	     );
end ic_74hc153;

--}} End of automatically maintained section

architecture dataflow of ic_74hc153 is 
signal y_local:std_logic;
begin

	y_local<= (not s1 and not s0 and i0) or
	          (not s1 and s0 and i1) or
	          (s1 and not s0 and i2) or
			  (s1 and s0 and i3);
			  
    y<= y_local when e_bar='0' else 'Z';

end dataflow;

