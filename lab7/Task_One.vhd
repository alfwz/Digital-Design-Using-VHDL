-------------------------------------------------------------------------------
--
-- Title       : task1
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
--				 task1. This is design for D-latch and D-flipflop. d and le_bar
--               is the input and q1 is the output.
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
-- latch:{entity {d_latch} architecture {behavioral}}
-- dff: {entity {d_flip_flop} architecture {behavioral}}
-- top_level: {entity {latch_vs_flip_flop}architecture {structural} 

--Latch--
library ieee;
use ieee.std_logic_1164.all;

entity d_latch is
port(
d : in std_logic; -- data input
le_bar : in std_logic; -- latch enable input (active low)
ql : out std_logic -- latch output
);
end d_latch;

architecture behavioral of d_latch is
	begin
		process (d, le_bar)
		begin
			if le_bar = '0' then     --value changes when the latch enable is 0
				ql <= d;
			end if;
		end process;                 --previous value is stored when the latch enable is 1
end behavioral;	

---d flip-flop---
library ieee;
use ieee.std_logic_1164.all;

entity d_flip_flop is
port(
d : in std_logic; -- data input
clk : in std_logic; -- clock input
qff : out std_logic -- flip_flop output
);
end d_flip_flop;

architecture behavioral of d_flip_flop is
		begin
		process (clk) 
			begin
				if clk'event and clk = '1' then     --output changes at the rising edge of the clock
					qff <= d;
				end if;
		end process;                                --previous output is stored at the falling edge of the clock
end behavioral;

--top level--
library ieee;
use ieee.std_logic_1164.all;

entity latch_vs_flip_flop is
port(
d_tb : in std_logic; -- data input
clk_tb : in std_logic; -- clock input
ql_tb : out std_logic; -- latch output
qff_tb : out std_logic -- flip-flop output
);
end latch_vs_flip_flop;

architecture structural of latch_vs_flip_flop is
begin

	U0: entity d_latch port map (d=>d_tb,le_bar=>clk_tb,ql=>ql_tb);
	U1: entity d_flip_flop port map (d=>d_tb,clk=>clk_tb,qff=>qff_tb);

end structural;
