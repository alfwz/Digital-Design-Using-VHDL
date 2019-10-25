-------------------------------------------------------------------------------
--
-- Title       : \loop\
-- Design      : Lab04
-- Author      : Fengwei Zhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : w:\ESE382\Lab04\src\loop.vhd
-- Generated   : Tue Feb 26 23:41:30 2019
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
--{entity {\loop\} architecture {\loop\}}

library IEEE;
use IEEE.std_logic_1164.all;

entity \loop\ is
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
end \loop\;

--}} End of automatically maintained section

architecture \loop\ of \loop\ is
begin 
	comp: process (d, c, b, a)	
	begin 
		p <= '1';
		q <= '1';
		r <= '1';
		s <= '1'; 
		
		for i in 10 downto 0 loop
			if ((d='0') and (c='0') and (b='0') and (a='0')) then
				p <= '0';
				q <= '0';
				r <= '0';
				s <= '0';
				exit;
				elsif ((d='0') and (c='0') and (b='0') and (a='1')) then
				p <= '0';
				q <= '0';
				r <= '0';
				s <= '1';
				exit;
				elsif ((d='0') and (c='0') and (b='1') and (a='0')) then
				p <= '0';
				q <= '0';
				r <= '1';
				s <= '0';
				exit;
				elsif ((d='0') and (c='0') and (b='1') and (a='1')) then
				p <= '0';
				q <= '0';
				r <= '1';
				s <= '1';
				exit;
				elsif ((d='0') and (c='1') and (b='0') and (a='0')) then
				p <= '0';
				q <= '1';
				r <= '0';
				s <= '0';
				exit;
				elsif ((d='0') and (c='1') and (b='0') and (a='1')) then
				p <= '1';
				q <= '0';
				r <= '1';
				s <= '1'; 
				exit;
				elsif ((d='0') and (c='1') and (b='1') and (a='0')) then
				p <= '1';
				q <= '1';
				r <= '0';
				s <= '0';
				exit;
				elsif ((d='0') and (c='1') and (b='1') and (a='1')) then
				p <= '1';
				q <= '1';
				r <= '0';
				s <= '1';
				exit;
				elsif ((d='1') and (c='0') and (b='0') and (a='0')) then
				p <= '1';
				q <= '1';
				r <= '1';
				s <= '0';
				exit;
				elsif ((d='1') and (c='0') and (b='0') and (a='1')) then
				p <= '1';
				q <= '1';
				r <= '1';
				s <= '1';
				end if;	
			end loop;
	
		end process comp;

	 -- enter your statements here --

end \loop\;
