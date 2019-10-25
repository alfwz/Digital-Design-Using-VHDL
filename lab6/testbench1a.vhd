-------------------------------------------------------------------------------
--
-- Title       : problem1
-- Design      : task1a
-- Author      : Taylor
-- Company     : StonyBrook
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE382Prelab6\task1a\src\problem1.vhd
-- Generated   : Wed Mar 13 19:52:01 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This is the testbench of table look up to decode the problem one
--               of the midterm1. The inputs are 3 scalers and outputs are 2 scalers.
-- Input: z , b , c
-- Output: x , y
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	-- required to use to_unsigned function

entity comb_fcn_tb is
end comb_fcn_tb;

architecture table of comb_fcn_tb is
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : std_logic;
	signal b : std_logic;
	signal c : std_logic;
	
	-- Observed signals - signals mapped to the output ports of tested entity
	signal x : std_logic;
	signal y : std_logic;
	
	constant period : time := 20ns;	
	
	type test_vector is record
	a : std_logic;
	b : std_logic;
	c : std_logic;
	x : std_logic;
	y : std_logic;	 
	end record;
	
	type test_vector_array is array (natural range<>) of test_vector;
	constant  test_vectors: test_vector_array:=
	(('0','0','0','1','1'),	
	('0','0','1','0','1'),
	('0','1','0','1','0'),
	('0','1','1','0','1'),
	('1','0','0','0','0'),
	('1','0','1','0','1'),
	('1','1','0','0','0'),
	('1','1','1','1','1'));
	
	begin
	
	-- Unit Under Test port map
	UUT : entity comb_fcn
	port map 
	(a => a,
	b => b,
	c => c,
	x => x,
	y => y); 
	
	verify: process
	begin
		for i in test_vectors'range loop
			a<= test_vectors(i).a;
			b<= test_vectors(i).b;
			c<= test_vectors(i).c;
			wait for 20 ns;
			assert ((x=test_vectors(i).x) and (y=test_vectors(i).y))
			report "test vectors " & integer'image(i)& " failed" &
                   " for input a = " & std_logic'image(a) & " and b = " &
                   std_logic'image(b)& " and c = " &std_logic'image(c)
		severity error;
		
		end loop;
	  end process;

		   		 end;














