-------------------------------------------------------------------------------
--
-- Title       : Edge Detector
-- Design      : lab10 - Design Task 1
-- Author	   : Iftikhan	& Fengwei
-- Company     : Stony Brook University
--																						   
-------------------------------------------------------------------------------
--
-- Description : Moore FSM Edge detector which causes a change in state at the 
-- 				 next positive clock edge when a positive or 
--				 negative edge on the pushbutton is detected. 
--				 
--
--	Inputs : rst_bar, clk, sig, pos		   
--  Outputs : sig_edge
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity edge_det is
	 port(
		 rst_bar : in STD_LOGIC;  -- asynchronous system reset
		 clk : in STD_LOGIC;	  -- system clock
		 sig : in STD_LOGIC;	  -- input signal from PB
		 pos : in STD_LOGIC;	  -- edge select: '1' for positive edge, '0' for negative edge
		 sig_edge : out STD_LOGIC -- output of the edge detector FSM
	     );
end edge_det;


architecture behavioral of edge_det is
	type state is (state_a, state_b, state_c);
	signal present_state, next_state : state;
	begin		
		
		state_reg: process (clk, rst_bar)    
		begin
			if rst_bar = '0' then
				present_state <= state_a;
			elsif rising_edge(clk) then
				present_state <= next_state;
			end if;
			end process;
			
			outputs: process(present_state)
			begin 		 
				case present_state is
				when state_c => sig_edge <= '1';
				when others => sig_edge <= '0';
				end case;
			end process; 
			
			nxt_state: process (present_state,sig,pos)
			begin
				case present_state is
					
					when state_a =>
					if pos = '1' then
					if sig = '0' then
						next_state <= state_b;
					else
						next_state <= state_a;
					end if;	
					elsif pos = '0' then
						if sig = '1' then
							next_state <= state_b;
						else
							next_state <= state_a; 
						end if;
						end if;
					
					when state_b =>	
					if pos = '1' then 
					if sig = '1' then 
						next_state <= state_c;
					else
						next_state <= state_b;
					end if;
					elsif pos = '0' then
						if sig = '0' then 
							next_state <= state_c;
						else 
							next_state <= state_b;
						end if;
						end if;
					
					when others => 
					if pos = '1' then
					if sig = '0' then
						next_state <= state_b;
					else 
						next_state <= state_a;
					end if;	
					elsif pos = '0' then
						if sig = '1' then
							next_state <= state_b;
						else 
							next_state <= state_a;
						end if;
						end if;
					end case;
					end process;
end behavioral;
