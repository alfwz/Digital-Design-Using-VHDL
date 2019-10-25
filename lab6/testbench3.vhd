-------------------------------------------------------------------------------
--
-- Title       : problem4
-- Design      : Testbench3
-- Author      : KagamineLen
-- Company     : StonyBrook
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE382Prelab6c\Testbench3\src\problem4.vhd
-- Generated   : Thu Mar 14 04:09:11 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description :This is the test bench for decoding problem 4 of midterm1. The
-- architecture of this testbench is dataflow.

-- Inputs: i0, i1, i2, i3, s0, s1, e_bar
-- Outputs: y
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;  
use ieee.numeric_std.all;

entity ic_74hc153_tb is
end ic_74hc153_tb;

architecture dataflow of ic_74hc153_tb is
signal i0, i1, i2, i3, s1, s0, e_bar: std_logic;
signal y: std_logic;


begin 
	
	UUT :entity ic_74hc153
		port map(
		i0 => i0, 
		i1 => i1, 
		i2 => i2, 
		i3 => i3, 
		s1 => s1, 
		s0 => s0, 
		e_bar => e_bar,
		y => y);

tb : process
begin
	e_bar<='0'; s1<='0'; s0<= '0';
	for i in 0 to 15 loop
		(i0, i1, i2, i3) <= std_logic_vector (to_unsigned(i, 4));
		wait for 20ns;
		assert(y = i0)
		report "The input values are " & std_logic'image(i0) & std_logic'image(i1) 
		& std_logic'image(i2) & std_logic'image(i3) & " .The expected output is "
		& std_logic'image(y)
		severity error;
	end loop;
		
	e_bar<='0'; s1<='0'; s0<= '1';
	for i in 0 to 15 loop
		(i0, i1, i2, i3) <= std_logic_vector (to_unsigned(i, 4));
		wait for 20ns;
		assert(y = i1)
		report "The input values are " & std_logic'image(i0) & std_logic'image(i1) 
		& std_logic'image(i2) & std_logic'image(i3) & " .The expected output is "
		& std_logic'image(y)
		severity error;	 
	end loop;
		
	e_bar<='0'; s1<='1'; s0<= '0';
	for i in 0 to 15 loop
		(i0, i1, i2, i3) <= std_logic_vector (to_unsigned(i, 4));
		wait for 20ns;
		assert(y = i2)
		report "The input values are " & std_logic'image(i0) & std_logic'image(i1) 
		& std_logic'image(i2) & std_logic'image(i3) & " .The expected output is "
		& std_logic'image(y)
		severity error;	
	end loop; 
		
	e_bar<='0'; s1<='1'; s0<= '1';
	for i in 0 to 15 loop
		(i0, i1, i2, i3) <= std_logic_vector (to_unsigned(i, 4));
		wait for 20ns;
		assert(y = i3)
		report "The input values are " & std_logic'image(i0) & std_logic'image(i1) 
		& std_logic'image(i2) & std_logic'image(i3) & " .The expected output is "
		& std_logic'image(y)
		severity error;
	end loop; 
	
	e_bar<= '1';
	for i in 0 to 63 loop
		(i0, i1, i2, i3, s1, s0) <= std_logic_vector (to_unsigned(i, 6));
		wait for 20ns;
		assert (y = 'Z')
		report "The input values are " & std_logic'image(i0) & std_logic'image(i1) 
		& std_logic'image(i2) & std_logic'image(i3) & " .The expected output is "
		& std_logic'image(y)
		severity error;
	end loop; 

end process;
end dataflow;
	
	
		
	