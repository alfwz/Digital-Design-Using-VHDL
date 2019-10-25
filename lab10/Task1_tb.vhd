-------------------------------------------------------------------------------
--
-- Title       : task1TB
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
-- d:\Bkvhdl_progs\Chap01\half_adder\src\half_adder_tb.vhd

library	ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture behavior of testbench is
	signal rst_bar, clk, sig, pos, sig_edge :  std_logic;
	
	begin
		
	uut: entity edge_det port map(rst_bar => rst_bar,
		sig => sig, pos => pos,clk=>clk, sig_edge=>sig_edge);
		process
		begin
		clk <= '1';
		wait for 1us / 2;
		clk <= '0';
		wait for 1us / 2;
		end process;
		 rst_bar <= '0', '1' after 1 us;   
		 sig <= '1', '0' after 1.5 us, '1' after 3 us, '0' after 5.5 us, '1' after 6.8 us;  
		 pos <= '0', '1' after 5 us; 
		
end behavior;
	
