-------------------------------------------------------------------------------
--
-- Title       : task2
-- Design      : lab07
-- Author      : iftikhar & Fangwei
-- Company     : SBU
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\iftikhar\GoogleDrive\ESE 382\lab7\src\task2.vhd
-- Generated   : Tue Mar 25 12:56:12 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This design description contains the entity and architecture of 
--				 task2. This has d, clk, en and rest_bar as input and q as the output. if rst_bar=0, the output=0.
-- 				 However, if rst_bar=1 and enable=1, the output will get data
--				 on the positive edge of the clock.
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {dff_en} architecture {d_flip_flop_en}}


library ieee;
use ieee.std_logic_1164.all;

entity dff_en is
 port(
 d : in std_logic; -- data input
 clk : in std_logic; -- clock input
 en : in std_logic; -- enable input
 rst_bar : in std_logic; -- asynchronous reset
 q : out std_logic -- output
 );
end dff_en;

architecture d_flip_flop_en of dff_en is

begin
	a: process(clk, en, rst_bar)
	begin
		if rst_bar = '0' then                 --checking if the rst_bar=0
			if en='1' then                    --checking if the enable=0
				if rising_edge(clk) then      --checking for the rising edge
				q <= d;                       --output gets the input
				end if;
			end if;
		elsif rst_bar = '1' then 
			q <= '0'; 			 
		end if;
	end process a;
end d_flip_flop_en;