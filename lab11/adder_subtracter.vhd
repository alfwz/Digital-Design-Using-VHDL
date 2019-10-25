-------------------------------------------------------------------------------
--
-- Title       : Adder Subtracter
-- Design      : lab09 - Design Task 3
-- Author	   : Iftikhan	& Fengwei
-- Company     : Stony Brook University
--																						   
-------------------------------------------------------------------------------
--
-- Description : Adder Subtracter -- Takes in the pos_neg output from the
--				 counter to determine the current location in the sine wave
--				 cycle and modifies the 7 bit value from the lookup table to
-- 				 be an 8 bit input for the DAC. Range from 128 to positive
--				 peak at 225 or to negative peak at 0
--				 
--  			 *Behavioral design description
--
--	Local variables: dac_var		   
--	Inputs : pos, sine_value		   
--  Outputs : dac_sine_val
--
-----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_subtracter is
	port(
		pos : in std_logic;-- indicates pos. or neg. half of cycle
		sine_value : in std_logic_vector(6 downto 0);-- from sine table
		dac_sine_val : out std_logic_vector(7 downto 0)-- output to DAC
		);
end adder_subtracter;


architecture behavioral of adder_subtracter is	

begin
	process(sine_value, pos)
		variable temp : integer range 0 to 255;
	begin				 
		temp := to_integer(unsigned(sine_value));	
		
		if pos = '1' then
			temp := temp + 128;	-- add 128  
		
		elsif pos = '0' then
			temp := 128 - temp;	-- subtract from 128   

		end if;
		dac_sine_val <= std_logic_vector(to_unsigned(temp, 8));
	end process;
end behavioral;
