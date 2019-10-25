-------------------------------------------------------------------------------
--
-- Title       : \case\
-- Design      : Lab04
-- Author      : Fengwei Zhang
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : w:\ESE382\Lab04\src\case.vhd
-- Generated   : Tue Feb 26 17:55:45 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {\case\} architecture {\case\}}

library IEEE;
use IEEE.std_logic_1164.all;

entity \case\ is
	 port(
		 d : in STD_LOGIC;
		 c : in STD_LOGIC;
		 b : in STD_LOGIC;
		 a : in STD_LOGIC;
		 p : out STD_LOGIC;
		 q : out STD_LOGIC;
		 r : out STD_LOGIC;
		 s : out STD_LOGIC
	     );
end \case\;

--}} End of automatically maintained section

architecture \case\ of \case\ is   
	signal temp:std_logic_vector (3 downto 0);
begin
	process (d, c, b, a)
	begin 
		case std_logic_vector'(d, c, b, a) is
			
			when "0000" => temp <= "0000";
			when "0001" => temp <= "0001";
			when "0010" => temp <= "0010";
			when "0011" => temp <= "0011";
			when "0100" => temp <= "0100";
			when "0101" => temp <= "1011";
			when "0110" => temp <= "1100";
			when "0111" => temp <= "1101";
			when "1000" => temp <= "1110";
			when "1001" => temp <= "1111";
			when others => temp <= "----";
		end case;
	end process;
	(p, q, r, s) <= temp;
end \case\;
