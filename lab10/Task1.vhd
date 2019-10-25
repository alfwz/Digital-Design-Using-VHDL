-------------------------------------------------------------------------------
--
-- Title       : Edge_Detection
-- Design      : lab10
-- Author      : Iftikhar Khan & Fengwei
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : E:\ESE382\Lab09\lab09\src\adder_subtracter.vhd
-- Generated   : Tue Apr 23 05:11:35 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description :  A push button is used to create pulse edge. the pulse edges can be detected as 
-- 				  it creates a one second long pulse. 
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {adder_subtracter} architecture {behavorial}}
library ieee; 
use ieee.std_logic_1164.all;

entity edge_det is
 port(
 rst_bar : in std_logic; -- asynchronous system reset
 clk : in std_logic; -- system clock
 sig : in std_logic; -- input signal pushbutton
 pos : in std_logic; -- '1' for positive edge, '0' for negative
 sig_edge : out std_logic -- high for one sys. clk after edge
 );
end edge_det;


architecture moore_fsm of edge_det is 
type state is (wait_for_1, wait_for_0, positive_edge_detect,negative_edge_detect); 
signal present_state, next_state : state;
begin
	
state_reg: process (clk, rst_bar) 
begin 
	if rst_bar = '0' then
		present_state <= wait_for_0; 
	elsif rising_edge(clk) then 
		present_state <= next_state; 
	end if; 
end process;
//
outputs: process (present_state) begin
	case present_state is 
	when positive_edge_detect | negative_edge_detect => sig_edge  <= '1';
	when others => sig_edge  <= '0';
	end case; 
end process;

//
nxt_state: process (present_state, sig) begin 
case present_state is
		when wait_for_0 => 
			if (falling_edge(sig) and pos='0')then 
			next_state <= negative_edge_detect;
			elsif (rising_edge(sig) and pos='1') then
			next_state <= positive_edge_detect;
			else next_state <= wait_for_0; 
			end if;
		when negative_edge_detect => 
			if (rising_edge(sig) and pos='1')then 
			next_state <= positive_edge_detect; 
			else next_state <= wait_for_1; 
			end if;
		when wait_for_1 => 
			if (rising_edge(sig) and pos='1')then 
			next_state <= positive_edge_detect;
			elsif (falling_edge(sig) and pos='0') then
			next_state <= negative_edge_detect;
			else next_state <= wait_for_1;
			end if;
		when positive_edge_detect => 
			if (falling_edge(sig) and pos='0')then 
			next_state <= negative_edge_detect; 
			else next_state <= wait_for_0;
			end if;	
		when others => 
			null;
	end case; 
	end process; 
end moore_fsm;

