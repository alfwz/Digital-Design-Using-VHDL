
-------------------------------------------------------------------------------
--
-- Title       : Edge Detector
-- Design      : lab10 - Design Task 1
-- Author	   : Iftikhan	& Fengwei
-- Company     : Stony Brook University
--																						   
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity mux_4_to_1 is
	port(
		ch0,ch1,ch2,ch3: in std_logic_vector(6 downto 0);
		ch_select : in std_logic_vector(1 downto 0);
		mux_out : out std_logic_vector(6 downto 0)
		);
end mux_4_to_1;

architecture behavioral of mux_4_to_1 is
begin			   
	process(ch_select,ch0,ch1,ch2,ch3)
	begin
		if ch_select = "01" then
			mux_out <= ch1;
		elsif ch_select = "10"
			then mux_out <= ch2;
		elsif ch_select = "11" then
			mux_out <= ch3;
		else
			mux_out <= ch0;
		end if;
	end process;
end behavioral;
