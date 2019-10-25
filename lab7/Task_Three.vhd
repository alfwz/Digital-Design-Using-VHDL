-------------------------------------------------------------------------------
--
-- Title       : task3 
-- Design      : lab07
-- Author      : iftikhar & Fangwei
-- Company     : SBU
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\iftikhar\GoogleDrive\ESE 382\lab7\src\task1.vhd
-- Generated   : Wed Mar 25 10:23:20 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This description contains the entity and architecture of
--				 for task 3. A 4 bit shift register is being implemented here. 
--				 If Load is 1, then value is shifted into the d_sig. If en_shift 
--               is 1, then the values are rotated right
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
-- latch:{entity {d_latch} architecture {behavioral}}
-- dff: {entity {d_flip_flop} architecture {behavioral}}
-- top_level: {entity {latch_vs_flip_flop}architecture {structural} 



library ieee;
use ieee.std_logic_1164.all;

entity right_shift_reg is
	port(
	d : in std_logic_vector(3 downto 0);
	load : in std_logic;	--sync load parallel
	en_shift : in std_logic; --enshift if load is unasserted
	clk: in std_logic; 	--clk
	rst_bar : in std_logic;
	serial_out : out std_logic
	); 
end right_shift_reg;

architecture behavior of right_shift_reg is
	signal d_sig : std_logic_vector(3 downto 0);
begin
	process(clk)
	begin 
		if rst_bar = '0' then
			d_sig <= "0000";  
		elsif ((rising_edge(clk)) and (load = '1')) then
		  	d_sig(0) <= d(0);
			d_sig(1) <= d(1);
			d_sig(2) <= d(2);
			d_sig(3) <= d(3);
		elsif ((rising_edge(clk)) and (load = '0')and (en_shift = '0')) then
			serial_out <= d_sig(0);
			d_sig(0) <= d_sig(1);
			d_sig(1) <= d_sig(2);
			d_sig(2) <= d_sig(3);
			d_sig(3) <= '0';
		end if;
	end process;
end behavior;