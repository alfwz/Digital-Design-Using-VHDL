-------------------------------------------------------------------------------
--
-- Title       : converter_bcd_2421
-- Design      : lab03
-- Author      : iftikhan95
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\lab03\lab03\src\conditional.vhd
-- Generated   : Wed Feb 20 03:48:18 2019
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
--{entity {converter_bcd_2421} architecture {conditional}}

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

architecture conditional of converter_bcd_2421 is
signal tmp : std_logic_vector(3 downto 0);
begin
	 tmp <= (d,c, b, a); 
--p <= '0' when (d='0' and c='0')else 
--'0' when (a= '')else '1';
	p <= '0' when tmp="0000" else
	'0' when tmp ="0001" else
	'0' when tmp="0010" else
	'0' when tmp="0011" else
	'0' when tmp="0100" else
	'1';  
	
	q <= '0' when tmp="0000" else
	'0' when tmp ="0001" else
	'0' when tmp="0010" else
	'0' when tmp="0011" else
	'0' when tmp="0101" else
	'1';  

	r <= '0' when tmp="0000" else
	'0' when tmp ="0001" else
	'0' when tmp="0100" else
	'0' when tmp="0110" else
	'0' when tmp="0111" else
	'1';  

	s <= '0' when a='0' else
	'1' when a='1' else
		'-';

end conditional;
