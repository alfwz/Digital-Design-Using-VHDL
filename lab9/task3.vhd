-------------------------------------------------------------------------------
--
-- Title       : task3
-- Design      : lab09
-- Author      : Fengwei and Iftiki
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : E:\ESE 382\prelab08\src\int_sig.vhd
-- Generated   : Wed April 3 09:35:11 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This code includes an architecture body which is based
-- on one or more if statements in a process for lab8 task1 integer signal
--
-------------------------------------------------------------------------------

--{entity {therm2gray} architecture {if_arch}}


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_subtractor is
	port (
	pos : in std_logic;
	sine_value : in std_logic_vector(6 downto 0);
	dac_sine_val : out std_logic_vector(7 downto 0)
	);
end adder_subtractor;

architecture behav of adder_subtractor is 
begin	
	add_sub: process(sine_value,pos)
	variable temp:integer range 0 to 255;
	begin 
		temp:= to_integer (unsigned(sine_value));
		if pos ='1' then 
			temp:= temp+128;
		elsif pos='0' then 
			temp := 128-temp;
		end if;
		dac_sine_val <= std_logic_vector(to_unsigned(temp,8));
	end process add_sub;
end behav; 
