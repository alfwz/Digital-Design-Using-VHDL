-------------------------------------------------------------------------------
--
-- Title       : task2
-- Design      : lab08
-- Author      : Fengwei and Iftikhar
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : E:\ESE 382\prelab08\src\int_sig.vhd
-- Generated   : Wed April 3 11:02:09 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This code includes an architecture body which is based
-- on one or more if statements in a process for lab8 task3 frequency divider 
-------------------------------------------------------------------------------				   

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity freq_div is
	port(
	clk: in std_logic;
	rst_bar: in std_logic;
	divisor: in std_logic_vector(3 downto 0);
	clk_dvd: out std_logic);
end freq_div;

architecture abc of freq_div is  
begin 
	process(clk, rst_bar)
		variable count: integer := 0;
	begin 
		if rst_bar='0' then 
			clk_dvd<='1';
			elsif rising_edge(clk) then
				count := count+1;	   
				clk_dvd<= '0';
					if count=2 then 
						clk_dvd<='1';
						elsif count=to_integer(unsigned(divisor)) then
						count:=0; 
					end if;
		end if;	
	end process;
end abc;
