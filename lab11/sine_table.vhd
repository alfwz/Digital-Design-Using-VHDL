-------------------------------------------------------------------------------
--
-- Title       : Sine Lookup Table
-- Design      : lab09 - Design Task 2
-- Author	   : Iftikhan	& Fengwei
-- Company     : Stony Brook University
--																						   
-------------------------------------------------------------------------------
--
-- Description : Sine Lookup Table -- A 128x7 table for which the 128 integer 
-- 				 table entry values of sine were computed in *language* and
--				 copy and pasted into this lookup table.  Each table entry is 
--				 the appropriate amplitude for the values in the first quadrant
--               of the sine wave cycle.  Table entries are 7 bits wide.
--				 
--  			 *Behavioral design description
--
--	Inputs : addr		   
--  Outputs : sine_val
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity sine_table is
	 port(
		 addr : in STD_LOGIC_VECTOR(6 downto 0);
		 sine_val : out STD_LOGIC_VECTOR(6 downto 0)
	     );
end sine_table;


architecture behavioral of sine_table is		
type table is array (0 to 127) of integer;	   
constant sine : table := 
(
0,
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
	process (addr)
	variable temp : integer;
	begin
		temp := to_integer(unsigned(addr));
		sine_val <= std_logic_vector(to_unsigned(sine(temp), 7));
	end process;
end behavioral;
