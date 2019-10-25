-------------------------------------------------------------------------------
--
-- Title       : Task 4 
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

entity phase_accumulator_fsm is
	port(
		clk : in std_logic; -- system clock
		reset_bar : in std_logic; -- asynchronous reset
		max : in std_logic; -- max count
		min : in std_logic; -- min count
		up : out std_logic; -- count direction
		pos : out std_logic -- positive half of sine cycle
	);
end phase_accumulator_fsm;



architecture three_processes of phase_accumulator_fsm is 
type state is (neither, max_detected, min_detected); 
signal present_state, next_state : state;
begin
	
state_reg: process (clk, reset_bar) 
begin 
	if reset_bar = '0' then
		present_state <= neither; 
	elsif rising_edge(clk) then 
		present_state <= next_state; 
	end if; 
end process;

outputs: process (present_state) begin
	case present_state is 
		when max_detected =>
			up  <= '0';	
			pos <= '1';
		when min_detected =>
			up  <= '1';
			pos <= '0';
		when others =>
			up <= up;
	end case; 
end process;


nxt_state: process (present_state, max, min) begin 
case present_state is
		when neither => 
			if (max='1')then 
			next_state <= max_detected;
			elsif (min='1') then
			next_state <= min_detected;
			else next_state <= neither; 
			end if;
		when max_detected => 
			if (min='1')then 
			next_state <= min_detected; 
			elsif (max='1') then
			next_state <= neither;
			end if;
		when min_detected => 
			if (max='1')then 
			next_state <= max_detected;
			elsif (min='1') then
			next_state <= neither;
			end if;
		when others => 
			null;
	end case; 
	end process; 
end three_processes;
		