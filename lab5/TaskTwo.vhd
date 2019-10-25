-------------------------------------------------------------------------------
--
-- Title       : therm2gray2
-- Design      : therm2gray
-- Author      : Iftikhar Khan Albert Zhang 
-- Company     : Stony brook University
--
-------------------------------------------------------------------------------
--
-- File        : d:\ESE 382\lab05\therm2gray\src\therm2gray2.vhd
-- Generated   : Mon Mar  4 22:31:39 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Thermometer codes to gray codes converted using case statements
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {therm2gray2} architecture {behavior2}}

library IEEE;
use IEEE.std_logic_1164.all;

entity therm2gray2 is
	 port(
		 therm : in STD_LOGIC_VECTOR(6 downto 0);
		 gray : out STD_LOGIC_VECTOR(2 downto 0)
	     );
end therm2gray2;

--}} End of automatically maintained section

architecture behavior2 of therm2gray2 is
begin
	b2: process(therm)
	begin
		case therm is
			when "0000000" =>gray<= "000";
			when "0000001" =>gray<= "001";
			when "0000011" =>gray<= "011";
			when "0000111" =>gray<= "010";
			when "0001111" =>gray<= "110";
			when "0011111" =>gray<= "111";
			when "0111111" =>gray<= "101";
			when "1111111" =>gray<= "100";
			when others =>gray<= "---";
		end case;
	end process b2;	
end behavior2;
