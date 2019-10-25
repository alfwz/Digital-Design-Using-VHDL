-------------------------------------------------------------------------------
--
-- Title       : Task One Integer Variable
-- Design      : lab08
-- Author      : Iftikhar Khan & Fenghwei 
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\lab03\lab03\src\T1_BinCnt_IntSig.vhd
-- Generated   : Wed April 3 10:11:14 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description :  Counter implemented with unisigned variable. if rst_bar = 0, then 
--		         count =0. Sicne the variable holds value in the current process,
--				 the output signal is allocated 
--
-------------------------------------------------------------------------------

--{entity {therm2gray} architecture {if_arch}}


library ieee;
use ieee.std_logic_1164.all;	
use ieee.numeric_std.all;

entity binary_counter4 is
generic (n : integer := 4);-- generic for counter width
port (
clk : in std_logic; -- system clock
cnten : in std_logic; -- enable counter count
rst_bar : in std_logic;-- synchronous reset (active low)
q : out std_logic_vector (n-1 downto 0)); -- output
end binary_counter4;	

architecture behav_intvar of binary_counter4 is
	begin
	cnt_var: process (clk, rst_bar)
		variable count_int : integer range 0 to 15;
	begin
		if rst_bar = '0' then
			count_int := 0;
		elsif cnten='1' then
			if rising_edge(clk) then
				if count_int = 15 then
				count_int := 0;
				else
				count_int := count_int + 1;
				end if;
			end if;
		end if;
	q <= std_logic_vector(to_unsigned(count_int,4));
	end process;
end behav_intvar;
