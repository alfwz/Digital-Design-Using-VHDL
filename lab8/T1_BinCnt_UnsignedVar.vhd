 -------------------------------------------------------------------------------
--
-- Title       : binary counter - unsigned variable
-- Design      : lab08
-- Author      : Iftikhar Khan 
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\lab03\lab03\src\T1_BinCnt_UnsignedVars.vhd
-- Generated   : Wed Feb 20 03:48:18 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Counter implemented with unisigned variable. if rst_bar = 0, then 
--		 count =0. Sicne the variable holds value in the current process,
--				 the output signal is allocated 
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binary_counter is
	generic (n : integer := 4);
	port(
	clk : in std_logic;	  --system clock
	cnten : in std_logic;  --enable counter count
	rst_bar :in std_logic; -- synchronous reset
	q : out std_logic_vector(n-1 downto 0));   --output
end binary_counter;

architecture unsigned_variable of binary_counter is
begin
	process (clk,rst_bar,cnten)
		variable count_v: unsigned (3 downto 0);
	begin
		if rst_bar = '0' then
			count_v := "0000";
		elsif cnten = '1' then
			if rising_edge(clk) then
					count_v := count_v + 1;
				end if;
			end if;
		q <= std_logic_vector (count_v);
	end process;
end unsigned_variable;
	
	