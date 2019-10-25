-------------------------------------------------------------------------------
--
-- Title       : problem3
-- Design      : task2
-- Author      : Taylor
-- Company     : StonyBrook
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE382Prelab6b\task2\src\problem3.vhd
-- Generated   : Wed Mar 13 22:01:00 2019
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
--{entity {problem3} architecture {problem3}}

library IEEE;
use IEEE.std_logic_1164.all;

entity nand_ckt is
	 port(
		 a : in STD_LOGIC;
		 b : in STD_LOGIC;
		 c_bar : in STD_LOGIC;
		 f : out STD_LOGIC
	     );	
		 

end nand_ckt;

--}} End of automatically maintained section

architecture dataflow of nand_ckt is
begin

	process(a,b,c_bar) is
	begin 
		if (c_bar = '0') then 
			f <= '1';
		elsif ((a='1') and (b='1')) then
			f <= '1';
		else
			f <= '0';
			
		end if;
		end process;
		end dataflow;


