-------------------------------------------------------------------------------
--
-- Title       : problem3
-- Design      : task1a
-- Author      : Taylor
-- Company     : StonyBrook
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ESE382Prelab6\task1a\src\problem1.vhd
-- Generated   : Wed Mar 13 23:11:01 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This is the testbench of process architecture which used if 
-- statement to decode the outputs of combination circuits of two Nand gates 
-- in midterm1 problem 3.

-- Input: a,b,c_bar
-- Output: f
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity nand_ckt_tb is
end nand_ckt_tb;

architecture dataflow of nand_ckt_tb is
signal a :std_logic;
signal b :std_logic;
signal c_bar :std_logic;
signal f :std_logic;


begin 
	
	UUT:entity nand_ckt
		port map
		(a => a,
		 b => b,
		 c_bar => c_bar,
		 f => f);
		
tb : process
begin 			  
				for i in 0 to 7 loop	 
				 (a , b , c_bar) <= std_logic_vector(to_unsigned(i , 3));
				 wait for 20 ns;  
				 
	if((a = '0') and (b = '0') and (c_bar='0')) then
				 assert (f='1')
					 report "the inputs a and b and c_bar are " & std_logic'image(a) 
				 & " and "& std_logic'image(b)&" and "&  std_logic'image(c_bar)
				 & ". The expected output is 1" & ". The actual output is "  &  
				 std_logic'image(f)
						 severity error;
						
	elsif((a = '0') and (b = '0') and (c_bar='1')) then
				 assert (f='0')
					 report "the inputs a and b and c_bar are " & std_logic'image(a) 
				 & " and "& std_logic'image(b)&" and "&  std_logic'image(c_bar)
				 & ". The expected output is 1" & ". The actual output is "  &  
				 std_logic'image(f)
						 severity error;
						 
	elsif((a = '0') and (b = '1') and (c_bar='0')) then
				 assert (f='1')
					 report "the inputs a and b and c_bar are " & std_logic'image(a) 
				 & " and "& std_logic'image(b)&" and "&  std_logic'image(c_bar)
				 & ". The expected output is 1" & ". The actual output is "  &  
				 std_logic'image(f)
						 severity error;
						 
	elsif((a = '0') and (b = '1') and (c_bar='1')) then
				 assert (f='0')
					 report "the inputs a and b and c_bar are " & std_logic'image(a) 
				 & " and "& std_logic'image(b)&" and "&  std_logic'image(c_bar)
				 & ". The expected output is 1" & ". The actual output is "  &  
				 std_logic'image(f)
						 severity error;
    
	elsif((a = '1') and (b = '0') and (c_bar='0')) then
				 assert (f='1')
					report "the inputs a and b and c_bar are " & std_logic'image(a) 
				 & " and "& std_logic'image(b)&" and "&  std_logic'image(c_bar)
				 & ". The expected output is 1" & ". The actual output is "  &  
				 std_logic'image(f)
						 severity error;
	
	elsif((a = '1') and (b = '0') and (c_bar='1')) then
				 assert (f='0')
				 report "the inputs a and b and c_bar are " & std_logic'image(a) 
				 & " and "& std_logic'image(b)&" and "&  std_logic'image(c_bar)
				 & ". The expected output is 1" & ". The actual output is "  &  
				 std_logic'image(f)
						 severity error;
						 
	elsif((a = '1') and (b = '1') and (c_bar='0')) then
				 assert (f='1')
					 report "the inputs a and b and c_bar are " & std_logic'image(a) 
				 & " and "& std_logic'image(b)&" and "&  std_logic'image(c_bar)
				 & ". The expected output is 1" & ". The actual output is "  &  
				 std_logic'image(f)
						 severity error;
						 
	elsif((a = '1') and (b = '1') and (c_bar='1')) then
				 assert (f='1')
					 report "the inputs a and b and c_bar are " & std_logic'image(a) 
				 & " and "& std_logic'image(b)&" and "&  std_logic'image(c_bar)
				 & ". The expected output is 1" & ". The actual output is "  &  
				 std_logic'image(f)
						 severity error;
	end if;	
	end loop;
	end process;
	end dataflow;
		