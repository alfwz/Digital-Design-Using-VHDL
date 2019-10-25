-------------------------------------------------------------------------------
--
-- Title       : Phase Accumulator FSM
-- Design      : lab10 - Design Task 4
-- Author	   : Iftikhan	& Fengwei
-- Company     : Stony Brook University
--																						   
-------------------------------------------------------------------------------
--
-- Description : Three process Moore FSM which controls output up (whether the 
-- 				 phase accumulator increments or decrements) 
--				 based on signals min and max from Design Task
--				 3 phase accumulator.  Also tells Design Task 5
--				 adder/subtractor the location in the cycle
--				 (pos_neg).
--				 
--
--	Inputs : clk, reset_bar, min, max	   
--  Outputs : up, pos_neg
--
-------------------------------------------------------------------------------


Library IEEE;
use IEEE.std_logic_1164.all;

entity phase_accumulator_FSM is
	port(
		clk : in std_logic; -- system clock
		reset_bar : in std_logic; -- asynchronous reset
		max : in std_logic; -- max count
		min : in std_logic; -- min count
		up : out std_logic; -- count direction
		pos_neg : out std_logic -- positive half of sine cycle 
		);
end phase_accumulator_fsm;

architecture moorefsm of phase_accumulator_FSM is
	type state is (state_a, state_b, state_c, state_d);
	signal present_state, next_state : state;
begin	  
	
	state_reg: process (clk, reset_bar)
	begin
		if reset_bar = '0' then
			present_state <= state_a;
		elsif rising_edge(clk) then
			present_state <= next_state;
		end if;
	end process;
	
	outputs: process(present_state)
	begin 
		case present_state is
			when state_a => 
				up <= '1';
			pos_neg <= '1';
			when state_b =>
				up <= '0';
			pos_neg <= '1';
			when state_c =>
				up <= '1';
			pos_neg <= '0';
			when state_d =>
				up <= '0';
			pos_neg <= '0';
		end case;
	end process;
	
	nxt_state: process(present_state, max, min)
	begin
		case present_state is
			when state_a =>
				if max = '1' then
					next_state <= state_b;
				else
					next_state <= state_a;
			end if;
			when state_b =>
				if min = '1' then
					next_state <= state_c;
				else
					next_state <= state_b;
			end if;
			when state_c =>
				if max = '1' then
					next_state <= state_d;
				else 
					next_state <= state_c; 									
			end if;
			when state_d =>
				if min = '1' then
					next_state <= state_a;
				else
					next_state <= state_d;
			end if;
		end case;
	end process;
	
end moorefsm;

