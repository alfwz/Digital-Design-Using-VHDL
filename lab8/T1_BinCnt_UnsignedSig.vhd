-------------------------------------------------------------------------------
--
-- Title       : binary counter with unsigned signal
-- Design      : lab08
-- Author      : Iftikhar Khan 
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\lab03\lab03\src\T1_BinCnt_UnsignedSig.vhd
-- Generated   : Wed Feb 20 03:48:18 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Counter implemented with integer signal. if rst_bar = 0, then 
--		         count =0. 				
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

architecture unsigned_sig of binary_counter is
	signal count_int : unsigned(3 downto 0);
begin
	process (clk,rst_bar,cnten)
	begin
		if rst_bar = '0' then
			count_int <= "0000";
		elsif cnten = '1' then
			if rising_edge(clk) then
					count_int <= count_int + 1;
			end if;
		end if;
	end process;
		q <= std_logic_vector(count_int);
end unsigned_sig;
	
	
	

