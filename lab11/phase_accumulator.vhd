-------------------------------------------------------------------------------
--
-- Title       : Edge Detector
-- Design      : lab10 - Design Task 1
-- Author	   : Iftikhan	& Fengwei
-- Company     : Stony Brook University
--																						   
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

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
--}} End of automatically maintained section

architecture behavioral of phase_accumulator is
	
begin
	p1: process (clk, reset_bar)
	variable count : integer range -(2**a + 100) to 2**a + 100 := 0; -- Variable for current count
		-- range -(2**a + 1) to 2**a + 1
	variable temp : std_logic_vector(a-1 downto 0);
	begin
		if reset_bar = '0' then	 -- Check if reset_bar is asserted
			count := 0;		 -- Reset count to 0
			min <= '1';		 -- Min is asserted whenever count is 0
			max <= '0';		 -- Max is unasserted
		elsif rising_edge(clk) then	  -- Otherwise, wait for rising clock edge
			if up = '1' then		  -- If up = 1 then
				count := count + to_integer(unsigned(d));  -- Add d to count
				if count > 2**a - 1 then	   -- If count exceeds all 1's
					count := 2**a - 1;		   -- Force count to be all 1's
				end if;
				if count = 2**a - 1 then   -- If count is all 1's
					max <= '1';			   -- Assert max output
					min <= '0';			   -- Ensure min output is unasserted
				else
					min <= '0';			   -- Otherwise, unassert min and max
					max <= '0';
				end if;
			elsif up = '0' then		-- If up = 0 then
				count := count - to_integer(unsigned(d));  -- Subtract d from count
				if count < 0 then		   -- If count is less than all 0's
					count := 0;			   -- Force count to be all 0's
				end if;
				if count = 0 then		   -- If count is all 0's
					min <= '1';			   -- Assert min output
					max <= '0';			   -- Ensure max output is unasserted
				else
					min <= '0';			   -- Otherwise, unassert min and max
					max <= '0';
				end if;
			end if;
		end if;
		temp := std_logic_vector(to_unsigned(count, a));
		q <= temp(a-1 downto a-m);
	end process p1;
end behavioral;

