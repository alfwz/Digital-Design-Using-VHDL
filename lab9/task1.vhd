-------------------------------------------------------------------------------
--
-- Title       : task1
-- Design      : lab09
-- Author      : Fengwei and Iftiki
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : E:\ESE 382\prelab08\src\int_sig.vhd
-- Generated   : Wed April 3 09:35:11 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This code includes an architecture body which is based
-- on one or more if statements in a process for lab8 task1 integer signal
--
-------------------------------------------------------------------------------

--{entity {therm2gray} architecture {if_arch}}

library IEEE;
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

architecture behavioral of quad_address_counter is
signal pnsig, up_down : std_logic;
signal addrsig : integer range 0 to 127;

begin
	process (clk, reset_bar) 
	begin
		
	if (reset_bar = '0') then
		addrsig <= 0;
		pnsig <= '1';		 -- 1 in the positive, 0 when negative
		up_down <= '0';		 -- 0 when rising, becomes 1 when at peak of sine wave and starts to decrement 
		
	else
		if rising_edge(clk) then
			if (addrsig = 127 and up_down = '0') then
				addrsig <= 126;
				up_down <= '1';
			--elsif (addrsig = 0) then
				--up_down <= '0';	
			--end if;	 
			else 
				null;
				
			if (addrsig = 0 and up_down = '1') then
				addrsig <= 1;
				pnsig <= not pnsig;
				up_down <= '0';
			else 
				null;
				
			case up_down is
				when '1' => addrsig <= addrsig - 1;
				when '0' => addrsig <= addrsig + 1;
				when others => null;
			end case;
			end if;
			end if;
			end if;
		end if;
		end process;
		address <= std_logic_vector(to_unsigned(addrsig,7));
		pos_neg <= pnsig;
end behavioral;