-------------------------------------------------------------------------------
--
-- Title       : Frequency Register
-- Design      : lab10 - Design Task 2
-- Author	   : Iftikhan	& Fengwei
-- Company     : Stony Brook University
--																						   
-------------------------------------------------------------------------------
--
-- Description : Behavioral design description of a register with generic a =  
-- 				 14 as its width. Each rising edge on the clock
--				 (while load is enabled) stores the value to be  
--				 be added to the phase accumulator from Design
--				 Task 3.
--				 
--
--	Inputs : load, clk, reset_bar, d	   
--  Outputs : q
--  Generics : a
--
-------------------------------------------------------------------------------


Library IEEE;
use IEEE.std_logic_1164.all;

entity freq_reg is 
	generic ( a: positive := 14);
	port(
	load : in std_logic; -- enable register to load data
	clk : in std_logic; -- system clock
	reset_bar : in std_logic; -- active low, asynchronous reset
	d: in std_logic_vector (a-1 downto 0); -- data input of value to be added
	q: out std_logic_vector (a-1 downto 0) -- register output will be fed to phase accu.
	);
end freq_reg;

architecture behavioral of freq_reg is	 
signal reg_q :std_logic_vector(a-1 downto 0);
begin 
	process (clk, reset_bar)
	begin
		if reset_bar = '0' then
			reg_q <= (others => '0');
		elsif rising_edge(clk) then
			if load = '1' then
			reg_q <= d;	
			elsif load = '0' then
				null;
		end if;
		end if;
	end process; 
	q <= reg_q;
end behavioral;