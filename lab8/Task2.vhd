-------------------------------------------------------------------------------
--
-- Title       : task2
-- Design      : lab08
-- Author      : Iftikhar Khan & Fenghwei
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\lab03\lab03\src\pre_scalar.vhd
-- Generated   : Wed April 8 09:04:20 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Pre-Scalar Built Using Counter. Structural Programming is used. 
-------------------------------------------------------------------------------

-------------------binary_counter-------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binary_counter is
	generic (n : integer := 4);
	port(
	clk : in std_logic;	  --system clock
	cnten : in std_logic;  --enable counter count
	rst_bar :in std_logic; -- synchronous reset
	q : out std_logic_vector(n-1 downto 0));   --output
end binary_counter;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture int_signal of binary_counter is
	signal count_int : integer range 0 to 15;
begin
	process (clk,rst_bar,cnten)
	begin
		if rst_bar = '0' then
			count_int <= 0;
		elsif cnten = '1' then
			if rising_edge(clk) then
				if count_int = 15 then
					count_int <= 0;
				else
					count_int <= count_int + 1;
				end if;
			end if;
		end if;
	end process;
		q <= std_logic_vector (to_unsigned(count_int,4));
end int_signal;

-------mux_6to1-------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_6to1 is
 port(
 ch : in std_logic_vector(5 downto 0); -- data input channels
 cs : in std_logic_vector(2 downto 0); -- mux select inputs
 mux_out : out std_logic -- output of mux
 );
end mux_6to1;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture selected of mux_6to1 is
begin
	with cs select
	mux_out<= '0' when "000",
	ch(1) when "001",
	ch(2) when "010",
	ch(3) when "011",
	ch(4) when "101",
	'0' when others;
end selected;

--------------top level-----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity programmable_prescalar is
port(
clear : in std_logic; -- active low clear
clk : in std_logic;
cs : in std_logic_vector(2 downto 0);
clk_prescaled : out std_logic
);				 
	attribute loc : string;	   
	attribute loc of clear: signal is "P18";
	attribute loc of clk : signal is "P17";
	attribute loc of cs: signal is "P19,P20,P21";
	attribute loc of clk_prescaled: signal is "P36";

end programmable_prescalar;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture structure of programmable_prescalar is
signal i0,i1,i2,i3: std_logic;
begin
	u1: entity binary_counter port map(rst_bar => clear, clk=>clk, cnten=>'1',q(0)=>i0,q(1)=>i1,q(2)=>i2,q(3)=>i3);
	u2: entity mux_6to1 port map (cs(0)=>cs(0),cs(1)=>cs(1),cs(2)=>cs(2), ch(2)=>i0,ch(3)=>i1,ch(4)=>i2,ch(5)=>i3,ch(0)=>'0',ch(1)=>clk, mux_out=>clk_prescaled);
end structure; 