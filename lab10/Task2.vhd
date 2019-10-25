-------------------------------------------------------------------------------
--
-- Title       : Task 2 
-- Design      : lab10 
-- Author      : Fengwei and Iftikhar
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : E:\ESE 382\prelab08\src\int_sig.vhd
-- Generated   : Wed April 23 05:06:11 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description :   The Value of the frequency Register is calculated 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

entity frequency_reg is
generic (a : positive := 14);
port(
	load : in std_logic; -- enable register to load data
	clk : in std_logic; -- system clock
	reset_bar : in std_logic; -- active low asynchronous reset
	d : in std_logic_vector(a-1 downto 0); -- data input
	q : out std_logic_vector(a-1 downto 0) -- register output
);
end frequency_reg;		 

architecture behav of frequency_reg is
signal data_input : integer range 0 to 16383;
signal k_var : integer range 0 to 16383;
signal fo_var : integer range 0 to 16383;
begin
	process(clk,load)
	begin 
		if (reset_bar = '0') then -- asynchronous reset 
			q<= "00000000000000";	
		else 
			null;
		end if;
		
		if (load = '1') then
			if rising_edge(clk) then
				q <= d;
			end if;
		end if;
	end process; 
end behav;	


		