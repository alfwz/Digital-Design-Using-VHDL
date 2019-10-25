										 							   -------------------------------------------------------------------------------
--
-- Title       : task4
-- Design      : lab07
-- Author      : Fengwei & Iftikhar
-- Company     : SBU
--
-------------------------------------------------------------------------------
--
-- File        : F:\ESE 382\lab7\src\task4.vhd
-- Generated   : Wed Mar 19 12:41:29 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This design description contains the entity and architecture of 
--				 task1 of lab7. The latch design was tested with stimulators following
--				the d flip flop design. Then a top level entity was created and architecture
--				was written in structural design.
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
-- latch:{entity {d_latch} architecture {behavioral}}
-- dff: {entity {d_flip_flop} architecture {behavioral}}
-- top_level: {entity {latch_vs_flip_flop}architecture {structural} 

--input_latch(sequential)--
library ieee;
use ieee.std_logic_1164.all;

entity input_latch is
port(							   
le_bar: in std_logic;
a : in std_logic_vector (2 downto 0);
a_lat : out std_logic_vector (2 downto 0)	 
);
end input_latch;

architecture behavioral of input_latch is
	begin
		process (a, le_bar)
		begin
			if le_bar = '0' then a_lat <= a;		 
			
			end if;
		end process;
end behavioral;	

---decoder_3to8(combinational)---
library ieee;
use ieee.std_logic_1164.all;

entity decoder_3to8 is
port(		 

enable: in std_logic;
a_lat : in std_logic_vector (2 downto 0);		  
y : out std_logic_vector (7 downto 0)
);
end decoder_3to8;

architecture behavioral of decoder_3to8 is
		begin
		process (a_lat, enable)
			begin
				if enable='1' then
					if a_lat = "000" then y <= "00000001";
					elsif a_lat = "001" then y <= "00000010";
					elsif a_lat = "010" then y <= "00000100";
					elsif a_lat = "011" then y <= "00001000";
					elsif a_lat = "100" then y <= "00010000";
					elsif a_lat = "101" then y <= "00100000";
					elsif a_lat = "110" then y <= "01000000";
					elsif a_lat = "111" then y <= "10000000";	  
					end if;	
				else y <= "00000000";
				end if;
		end process;
end behavioral;		 

--gate(combinational)--
library ieee;
use ieee.std_logic_1164.all;

entity gate is
port(
e1_bar: in std_logic;
e2 : in std_logic; 
enable : out std_logic 
);
end gate;

architecture behavioral of gate is
	begin
		process (e1_bar, e2)
		begin 
				enable <= (not e1_bar and e2);
		end process;
end behavioral;	

--top level(structual)--
library ieee;
use ieee.std_logic_1164.all;

entity latched_3to8_decoder is
port(	
a : in std_logic_vector(2 downto 0);		   
le_bar: in std_logic;
e1_bar : in std_logic;
e2 : in std_logic; 	   
y : out std_logic_vector(7 downto 0)
);			 
attribute loc : string; 
attribute loc of a: signal is "P19,P20,P21"; 
attribute loc of e1_bar: signal is "P9"; 
attribute loc of e2: signal is "P15"; 
attribute loc of le_bar: signal is "P18"; 
attribute loc of y: signal is "P36,P37,P38,P39,P40,P41,P42,P43";

end latched_3to8_decoder;

architecture structural of latched_3to8_decoder is 
signal s1 : std_logic_vector (2 downto 0);
signal s2 : std_logic;
begin
	U0: entity input_latch port map (a=>a,le_bar=>le_bar,a_lat=>s1);
	U1: entity decoder_3to8 port map (a_lat=>s1,enable=>s2,y=>y);	
	U2: entity gate port map (e1_bar=>e1_bar, e2=>e2, enable=>s2);

end structural;
