-------------------------------------------------------------------------------
--
-- Title       : task4
-- Design      : lab09
-- Author      : Fengwei and Iftiki
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : E:\ESE 382\prelab08\src\int_sig.vhd
-- Generated   : Wed April 3 09:35:11 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This code includes an architecture body which is based
-- on one or more if statements in a process for lab8 task1 integer signal
--
-------------------------------------------------------------------------------

-------task1 quad_address_counter
library IEEE;
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;
entity quad_address_counter is
	 port(
		 clk : in STD_LOGIC;
		 reset_bar : in STD_LOGIC;
		 pos_neg : out STD_LOGIC;
		 address : out STD_LOGIC_VECTOR(6 downto 0)
	     );
end quad_address_counter;
architecture behavioral of quad_address_counter is
signal pnsig, up_down : std_logic;
signal addrsig : integer range 0 to 127;

begin
	process (clk, reset_bar) 
	begin
		
	if (reset_bar = '0') then
		addrsig <= 0;
		pnsig <= '1';		 -- 1 in the positive, 0 when negative
		up_down <= '0';		 -- 0 when rising, becomes 1 when at peak of sine wave and starts to decrement 
		
	else
		if rising_edge(clk) then
			if (addrsig = 127 and up_down = '0') then
				addrsig <= 126;
				up_down <= '1';
			--elsif (addrsig = 0) then
				--up_down <= '0';	
			--end if;	 
			else 
				null;
				
			if (addrsig = 0 and up_down = '1') then
				addrsig <= 1;
				pnsig <= not pnsig;
				up_down <= '0';
			else 
				null;
				
			case up_down is
				when '1' => addrsig <= addrsig - 1;
				when '0' => addrsig <= addrsig + 1;
				when others => null;
			end case;
			end if;
			end if;
			end if;
		end if;
		end process;
		address <= std_logic_vector(to_unsigned(addrsig,7));
		pos_neg <= pnsig;
end behavioral;

-----------task2 sine_table
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity sine_table is
	 port(
		 addr : in STD_LOGIC_VECTOR(6 downto 0);
		 sine_val : out STD_LOGIC_VECTOR(6 downto 0)
	     );
end sine_table;

--}} End of automatically maintained section

architecture behavioral of sine_table is		
type table is array (0 to 127) of integer;	   
constant sine : table := 
(0,
1,
3,
4,
6,
7,
9,
10,
12,
14,
15,
17,
18,
20,
21,
23,
24,
26,
28,
29,
31,
32,
34,
35,
37,
38,
40,
41,
43,
44,
46,
47,
48,
50,
51,
53,
54,
56,
57,
58,
60,
61,
63,
64,
65,
67,
68,
69,
71,
72,
73,
74,
76,
77,
78,
79,
81,
82,
83,
84,
85,
87,
88,
89,
90,
91,
92,
93,
94,
95,
96,
97,
98,
99,
100,
101,
102,
103,
104,
105,
106,
107,
108,
108,
109,
110,
111,
112,
112,
113,
114,
115,
115,
116,
117,
117,
118,
118,
119,
119,
120,
121,
121,
122,
122,
122,
123,
123,
124,
124,
124,
125,
125,
125,
126,
126,
126,
126,
127,
127,
127,
127,
127,
127,
127,
127,
127,
127
);
begin
	p1: process (addr)
	variable temp : integer;
	begin
		temp := to_integer(unsigned(addr));
		sine_val <= std_logic_vector(to_unsigned(sine(temp), 7));
	end process p1;
end behavioral;

---------task 3	adder_subtractor


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_subtractor is
	port (
	pos : in std_logic;
	sine_value : in std_logic_vector(6 downto 0);
	dac_sine_val : out std_logic_vector(7 downto 0)
	);
end adder_subtractor;

architecture behav of adder_subtractor is 
begin	
	add_sub: process(sine_value,pos)
	variable temp:integer range 0 to 255;
	begin 
		temp:= to_integer (unsigned(sine_value));
		if pos ='1' then 
			temp:= temp+128;
		elsif pos='0' then 
			temp := 128-temp;
		end if;
		dac_sine_val <= std_logic_vector(to_unsigned(temp,8));
	end process add_sub;
end behav; 

-------task 4 top level

library IEEE;
use IEEE.std_logic_1164.all;

entity simple_dds is
	 port(
		 clk : in STD_LOGIC;
		 reset_bar : in STD_LOGIC;
		 dac_sine_value : out STD_LOGIC_VECTOR(7 downto 0)
	     );		
		 
	attribute loc : string;
	attribute loc of reset_bar : signal is "F1";
	attribute loc of clk : signal is "J1";
	attribute loc of dac_sine_value : signal is "C4,F7,B9,B7,A5,A4,A3,D6"; 
	
end simple_dds;

--}} End of automatically maintained section

architecture structural of simple_dds is
signal p1: std_logic_vector(6 downto 0);
signal pos_neg: std_logic;
signal sine_val: std_logic_vector(6 downto 0);
begin
	u0: entity quad_address_counter port map (clk => clk, reset_bar=> reset_bar, address => p1, pos_neg=> pos_neg);
	u1: entity sine_table port map (addr => p1, sine_val=>sine_val);
	u2: entity adder_subtractor port map (pos=> pos_neg, sine_value=> sine_val, dac_sine_val=> dac_sine_value);	
end structural;
