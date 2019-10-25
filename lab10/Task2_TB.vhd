-------------------------------------------------------------------------------
--
-- Title       : task2TB
-- Design      : lab10
-- Author      : Iftikhar Khan & Fenghwei 
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : E:\ESE382\Lab09\lab09\src\adder_subtracter.vhd
-- Generated   : Tue Apr 22 07:12:09 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description :  This design entity records the input for counters and outputs it
--                it to the phase accumalator. The entity was given. After modifying and achieving desired reult
--				  the values were put back to std_logic-vector and then output it the phase accumalator.
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {adder_subtracter} architecture {behavorial}}

library	ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture behavior of testbench is
	signal reset_bar, clk, load:  std_logic;
	signal q:  std_logic_vector (a-1 downto 0);
	signal data_in : integer range 0 to 16383;
	signal k : integer range 0 to 16383; 
	begin
		
	uut: entity frequency_reg port map(rst_bar => rst_bar,
		data_in => d, load => load,clk=>clk, q=>q);
		process
		begin
		clk <= '1';
		wait for 1us / 2;
		clk <= '0';
		wait for 1us / 2;
		end process;
		 rst_bar <= '0', '1' after 1.1 us;   
		 load <= '0', '1' after 1.7 us;  
		for i in 0 to 16383 loop
			(data_in,k)<=(to_unsigned(i,2));
		end loop;
		wait;
		
		
end behavior;
	
