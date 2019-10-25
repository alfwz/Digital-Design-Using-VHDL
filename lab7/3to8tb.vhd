																																							 -------------------------------------------------------------------------------
--
-- Title       : decoder_3_to_8_tb
-- Design      : task4
-- Author      : CAD Lab
-- Company     : CEAS
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\cad\Desktop\ESE382 LAB8\task 4\task4\task4\src\decoder_3_to_8_tb.vhd

--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {decoder 3_to_8_tb} architecture {decoder_ 3_to_8_tb}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity decoder_3to8_tb is
	 end decoder_3to8_tb;

--}} End of automatically maintained section

architecture tb of decoder_3to8 is
       signal a : STD_LOGIC_vector(2 downto 0);
	   signal e1_bar : STD_LOGIC;
	   signal e2 : STD_LOGIC;
		signal le_bar : STD_LOGIC;
		signal y :STD_LOGIC_vector(7 downto 0);
	----	constant period: time := 20 ns;
				   
begin
   UUT:entity latched_3to8_decoder  port map(
	   a => a,
	   e1_bar=>e1_bar,
	   e2=>e2,
	   le_bar=>le_bar,
	   y=>y); 
	   
	 
	   process
	   
	  begin	
		  for i in 0 to 7 loop
			  a  <= std_logic_vector (to_unsigned(i,3));
			  wait for 20ns;
			  assert y = "00000001" << i ; 
			  report "test failed for input combination 000" severity error;
			  end loop;
 -- Apply every possible input combination
	--a <= "000"; --apply input combination 00 and check outputs
	----	le_bar <= '0';
		---	wait for period;
			----	assert (y = "10000000")
---	report "test failed for input combination 0000" severity error;
			---	a <= "000"; --apply input combination 01 and check outputs
				---	le_bar<= '1';
				---		wait for period;
						----	assert (y = "00000000")
	----report "test failed for input combination 0001" severity error;	 
	end process;   
	std.env.finish;
end tb;
