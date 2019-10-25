-------------------------------------------------------------------------------
--
-- Title       : therm2gray3
-- Design      : therm2gray
-- Author      : iftikhar khan & Albert Zhang
-- Company     : Stony brook University
--
-------------------------------------------------------------------------------
--
-- File        : d:\ESE 382\lab05\therm2gray\src\therm2gray3.vhd
-- Generated   : Mon Mar  4 22:57:32 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : thermoeter to gray code conversion using behavioral style loop statement.
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {therm2gray3} architecture {behavior3}}

library IEEE;
use IEEE.std_logic_1164.all;

entity therm2gray3 is
	 port(
		 therm : in STD_LOGIC_VECTOR(6 downto 0);
		 gray : out STD_LOGIC_VECTOR(2 downto 0)
	     );
end therm2gray3;

--}} End of automatically maintained section

architecture behavior3 of therm2gray3 is
begin
	b3: process(therm)
	begin
		gray<="100";--default
	for i in 6 downto 0 loop
		if(therm(i)='0')then
			if(therm(i-1)='1')then
				gray(0)<='1';
			elsif(therm(i-1)='0' and therm(i-2)='1')then
				gray(1)<='1';
				gray(0)<='1';
			elsif(therm(i-2)='0'and therm(i-3)='1') then
				gray(1)<='1';
		    elsif(therm(i-3)='0'and therm(i-4)='1') then
				gray(2)<='0';
				gray(1)<='1';
			elsif(therm(i-4)='0'and therm(i-5)='1') then
				gray(2)<='0';
				gray(1)<='1';
				gray(0)<='1';
			elsif(therm(i-4)='0'and therm(i-5)='1') then
				gray(2)<='0';
				gray(0)<='1';
			elsif(therm(i-5)='0'and therm(i-6)='0') then
				gray(2)<='0';
		
			end if;
		else gray<="---";
	    end if;
	end loop;
	end process;
end behavior3;
