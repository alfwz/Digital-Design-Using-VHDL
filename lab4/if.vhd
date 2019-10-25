-------------------------------------------------------------------------------
--
-- Title       : \if\
-- Design      : Lab04
-- Author      : Fengwei Zhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : w:\ESE382\Lab04\src\if.vhd
-- Generated   : Tue Feb 26 23:15:34 2019
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
--{entity {\if\} architecture {\if\}}

library IEEE;
use IEEE.std_logic_1164.all;

entity \if\ is
	 port(
		 d : in STD_LOGIC;
		 c : in STD_LOGIC;
		 b : in STD_LOGIC;
		 a : in STD_LOGIC;
		 p : out STD_LOGIC;
		 q : out STD_LOGIC;
		 r : out STD_LOGIC;
		 s : out STD_LOGIC
	     );
end \if\;

--}} End of automatically maintained section

architecture \if\ of \if\ is
begin
process (d, c, b, a)
	begin 
		if((d='0') and (c='0') and (b='0') and (a='0')) then
			p <= '0';
			q <= '0';
			r <= '0';
			s <= '0';
			elsif ((d='0') and (c='0') and (b='0') and (a='1')) then
			p <= '0';
			q <= '0';
			r <= '0';
			s <= '1';
			elsif ((d='0') and (c='0') and (b='1') and (a='0')) then
			p <= '0';
			q <= '0';
			r <= '1';
			s <= '0';
			elsif ((d='0') and (c='0') and (b='1') and (a='1')) then
			p <= '0';
			q <= '0';
			r <= '1';
			s <= '1';
			elsif ((d='0') and (c='1') and (b='0') and (a='0')) then
			p <= '0';
			q <= '1';
			r <= '0';
			s <= '0';
			elsif ((d='0') and (c='1') and (b='0') and (a='1')) then
			p <= '1';
			q <= '0';
			r <= '1';
			s <= '1';
			elsif ((d='0') and (c='1') and (b='1') and (a='0')) then
			p <= '1';
			q <= '1';
			r <= '0';
			s <= '0';
			elsif ((d='0') and (c='1') and (b='1') and (a='1')) then
			p <= '1';
			q <= '1';
			r <= '0';
			s <= '1';
			elsif ((d='1') and (c='0') and (b='0') and (a='0')) then
			p <= '1';
			q <= '1';
			r <= '1';
			s <= '0';
			elsif ((d='1') and (c='0') and (b='0') and (a='1')) then
			p <= '1';
			q <= '1';
			r <= '1';
			s <= '1';
		end if;
	end process;
	 -- enter your statements here --

end \if\;
