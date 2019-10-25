 -------------------------------------------------------------------------------
--
-- Title       : task3_TB
-- Design      : lab10
-- Author      : Iftikhar Khan & Fenghei 
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
-- Description :  Task 3 Test Bench 
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
	signal max,min,reset_bar, clk, load,up:  std_logic;
	signal d:  std_logic_vector (14-1 downto 0);
	signal q: std_logic_vector (6 downto 0);
	signal k : integer range 0 to 16383; 
	begin
		
	uut: entity phase_accumulator port map(reset_bar => reset_bar,
		max=>max,min=>min,d=>d,q=>q);
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