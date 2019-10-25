-------------------------------------------------------------------------------
--
-- Title       : Task 3 
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
-- Description : Phase Accumulator is implemented here. If the value of the counter 
--				 reaches 127 or 0, then counting stops. 
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

entity phase_accumulator is
generic (
a : positive := 14;-- width of phase accumulator
m : positive := 7 -- width of phase accum output
);
port(
	clk : in std_logic; -- system clock
	reset_bar : in std_logic; -- asynchronous reset
	up : in std_logic; -- count direction control, 1 => up, 0 => dn
	d : in std_logic_vector(a -1 downto 0); -- count delta
	max : out std_logic; -- count has reached max value
	min : out std_logic; -- count has reached min value
	q : out std_logic_vector(m - 1 downto 0) -- phase acc. output
);
end phase_accumulator;

architecture behav_phase_accum of phase_accumulator is
signal d_input : integer range 0 to 16383;
signal q_output : integer range 0 to 127;
signal count : integer range 0 to 127;
begin
	process(clk,reset_bar) 
	begin
		if (reset_bar = '0') then -- asynchronous reset 
			count <= 0;	
		else 
			null;
		end if;
		
		if rising_edge(clk) then 
			d_input <= to_integer(unsigned(d));
			if (up = '1') then
				if((count+d_input) > 127)then  -- first see if the count rolls over more than 127 
					max <= '1';					-- if more thn 127 then max = 1 and then do nothing
				else 
					count <= count + d_input;
				end if;
			elsif( up = '0') then
				if((count - d_input) < 0) then	  -- first see if the count is less than 0 
					min <= '1';					  -- if less than 0 then min = 1 and do nothing 
				else
					count <= count - d_input;
				end if;
			end if;
		end if;	
		q <= std_logic_vector(to_unsigned(count,7));
	end process;
end behav_phase_accum;  


		