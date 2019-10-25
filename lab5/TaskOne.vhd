-------------------------------------------------------------------------------
--
-- Title       : therm2gray1
-- Design      : therm2gray
-- Author      : iftikhar khan Albert 
-- Company     : Stony brook University
--
-------------------------------------------------------------------------------
--
-- File        : D:\ESE 382\lab05\therm2gray\src\therm2gray1.vhd
-- Generated   : Mon Mar  4 21:27:56 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description :   Thermometer code to gray code conversion using if-else statements. 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {therm2gray1} architecture {behavior1}}

library IEEE;
use IEEE.std_logic_1164.all;

entity therm2gray is
	 port(
		 therm : in STD_LOGIC_VECTOR(6 downto 0);
		 gray : out STD_LOGIC_VECTOR(2 downto 0)
	     );
end therm2gray;

--}} End of automatically maintained section

architecture behavior1 of therm2gray is
begin
	b1: process(therm)
	begin
		if (therm = "0000000") then 
			gray <= "000";
		elsif (therm = "0000001") then
			gray <= "001";
		elsif (therm = "0000011") then
			gray <= "011";
		elsif (therm = "0000111") then
			gray <= "010";
		elsif (therm = "0001111") then
			gray <= "110";
		elsif (therm = "0011111") then
			gray <= "111";
		elsif (therm = "0111111") then
			gray <= "101";
		elsif (therm = "1111111") then
			gray <= "100";
		else gray <= "---";
		end if;
	end process;
end behavior1;	
		
