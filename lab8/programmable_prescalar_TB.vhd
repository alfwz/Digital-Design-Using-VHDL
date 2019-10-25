library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity programmable_prescalar_tb is
end programmable_prescalar_tb;

architecture TB_ARCHITECTURE of programmable_prescalar_tb is
	-- Component declaration of the tested unit
	component programmable_prescalar
	port(
		clear : in STD_LOGIC;
		clk : in STD_LOGIC;
		cs : in STD_LOGIC_VECTOR(2 downto 0);
		clk_prescaled : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clear : STD_LOGIC;
	signal clk : STD_LOGIC;
	signal cs : STD_LOGIC_VECTOR(2 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal clk_prescaled : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : programmable_prescalar
		port map (
			clear => clear,
			clk => clk,
			cs => cs,
			clk_prescaled => clk_prescaled
		);

	--Below VHDL code is an inserted .\compile\task2.vhs
	--User can modify it ....

STIMULUS: process
begin  -- of stimulus process
--wait for <time to next event>; -- <current time>

	clear <= '0';
	clk <= '0';
	cs <= "000";
    wait for 10 ns; --0 fs
	clear <= '1';
    wait for 40 ns; --10 ns
	clk <= '1';
    wait for 50 ns; --50 ns
	clk <= '0';
    wait for 50 ns; --100 ns
	clk <= '1';
    wait for 50 ns; --150 ns
	clk <= '0';
    wait for 50 ns; --200 ns
	clk <= '1';
    wait for 50 ns; --250 ns
	clk <= '0';
    wait for 50 ns; --300 ns
	clk <= '1';
    wait for 50 ns; --350 ns
	clk <= '0';
    wait for 50 ns; --400 ns
	clk <= '1';
    wait for 50 ns; --450 ns
	clk <= '0';
	cs <= "001";
    wait for 50 ns; --500 ns
	clk <= '1';
    wait for 50 ns; --550 ns
	clk <= '0';
    wait for 50 ns; --600 ns
	clk <= '1';
    wait for 50 ns; --650 ns
	clk <= '0';
    wait for 50 ns; --700 ns
	clk <= '1';
    wait for 50 ns; --750 ns
	clk <= '0';
    wait for 50 ns; --800 ns
	clk <= '1';
    wait for 50 ns; --850 ns
	clk <= '0';
    wait for 50 ns; --900 ns
	clk <= '1';
    wait for 50 ns; --950 ns
	clk <= '0';
	cs <= "010";
    wait for 50 ns; --1 us
	clk <= '1';
    wait for 50 ns; --1050 ns
	clk <= '0';
    wait for 50 ns; --1100 ns
	clk <= '1';
    wait for 50 ns; --1150 ns
	clk <= '0';
    wait for 50 ns; --1200 ns
	clk <= '1';
    wait for 50 ns; --1250 ns
	clk <= '0';
    wait for 50 ns; --1300 ns
	clk <= '1';
    wait for 50 ns; --1350 ns
	clk <= '0';
    wait for 50 ns; --1400 ns
	clk <= '1';
    wait for 50 ns; --1450 ns
	clk <= '0';
	cs <= "011";
    wait for 50 ns; --1500 ns
	clk <= '1';
    wait for 50 ns; --1550 ns
	clk <= '0';
    wait for 50 ns; --1600 ns
	clk <= '1';
    wait for 50 ns; --1650 ns
	clk <= '0';
    wait for 50 ns; --1700 ns
	clk <= '1';
    wait for 50 ns; --1750 ns
	clk <= '0';
    wait for 50 ns; --1800 ns
	clk <= '1';
    wait for 50 ns; --1850 ns
	clk <= '0';
    wait for 50 ns; --1900 ns
	clk <= '1';
    wait for 50 ns; --1950 ns
	clk <= '0';
	cs <= "100";
    wait for 50 ns; --2 us
	clk <= '1';
    wait for 50 ns; --2050 ns
	clk <= '0';
    wait for 50 ns; --2100 ns
	clk <= '1';
    wait for 50 ns; --2150 ns
	clk <= '0';
    wait for 50 ns; --2200 ns
	clk <= '1';
    wait for 50 ns; --2250 ns
	clk <= '0';
    wait for 50 ns; --2300 ns
	clk <= '1';
    wait for 50 ns; --2350 ns
	clk <= '0';
    wait for 50 ns; --2400 ns
	clk <= '1';
    wait for 50 ns; --2450 ns
	clk <= '0';
	cs <= "101";
    wait for 50 ns; --2500 ns
	clk <= '1';
    wait for 50 ns; --2550 ns
	clk <= '0';
    wait for 50 ns; --2600 ns
	clk <= '1';
    wait for 50 ns; --2650 ns
	clk <= '0';
    wait for 50 ns; --2700 ns
	clk <= '1';
    wait for 50 ns; --2750 ns
	clk <= '0';
    wait for 50 ns; --2800 ns
	clk <= '1';
    wait for 50 ns; --2850 ns
	clk <= '0';
    wait for 50 ns; --2900 ns
	clk <= '1';
    wait for 50 ns; --2950 ns
	clk <= '0';
	cs <= "110";
    wait for 50 ns; --3 us
	clk <= '1';
    wait for 50 ns; --3050 ns
	clk <= '0';
    wait for 50 ns; --3100 ns
	clk <= '1';
    wait for 50 ns; --3150 ns
	clk <= '0';
    wait for 50 ns; --3200 ns
	clk <= '1';
    wait for 50 ns; --3250 ns
	clk <= '0';
    wait for 50 ns; --3300 ns
	clk <= '1';
    wait for 50 ns; --3350 ns
	clk <= '0';
    wait for 50 ns; --3400 ns
	clk <= '1';
    wait for 50 ns; --3450 ns
	clk <= '0';
	cs <= "111";
    wait for 50 ns; --3500 ns
	clk <= '1';
    wait for 50 ns; --3550 ns
	clk <= '0';
    wait for 50 ns; --3600 ns
	clk <= '1';
    wait for 50 ns; --3650 ns
	clk <= '0';
    wait for 50 ns; --3700 ns
	clk <= '1';
    wait for 50 ns; --3750 ns
	clk <= '0';
    wait for 50 ns; --3800 ns
	clk <= '1';
    wait for 50 ns; --3850 ns
	clk <= '0';
    wait for 50 ns; --3900 ns
	clk <= '1';
    wait for 50 ns; --3950 ns
	clk <= '0';
	cs <= "000";
    wait for 50 ns; --4 us
	clk <= '1';
    wait for 50 ns; --4050 ns
	clk <= '0';
    wait for 50 ns; --4100 ns
	clk <= '1';
    wait for 50 ns; --4150 ns
	clk <= '0';
    wait for 50 ns; --4200 ns
	clk <= '1';
    wait for 50 ns; --4250 ns
	clk <= '0';
    wait for 50 ns; --4300 ns
	clk <= '1';
    wait for 50 ns; --4350 ns
	clk <= '0';
    wait for 50 ns; --4400 ns
	clk <= '1';
    wait for 50 ns; --4450 ns
	clk <= '0';
	cs <= "001";
    wait for 50 ns; --4500 ns
	clk <= '1';
    wait for 50 ns; --4550 ns
	clk <= '0';
    wait for 50 ns; --4600 ns
	clk <= '1';
    wait for 50 ns; --4650 ns
	clk <= '0';
    wait for 50 ns; --4700 ns
	clk <= '1';
    wait for 50 ns; --4750 ns
	clk <= '0';
    wait for 50 ns; --4800 ns
	clk <= '1';
    wait for 50 ns; --4850 ns
	clk <= '0';
    wait for 50 ns; --4900 ns
	clk <= '1';
    wait for 50 ns; --4950 ns
	clk <= '0';
	cs <= "010";
    wait for 50 ns; --5 us
	clk <= '1';
    wait for 50 ns; --5050 ns
	clk <= '0';
    wait for 50 ns; --5100 ns
	clk <= '1';
    wait for 50 ns; --5150 ns
	clk <= '0';
    wait for 50 ns; --5200 ns
	clk <= '1';
    wait for 50 ns; --5250 ns
	clk <= '0';
    wait for 50 ns; --5300 ns
	clk <= '1';
    wait for 50 ns; --5350 ns
	clk <= '0';
    wait for 50 ns; --5400 ns
	clk <= '1';
    wait for 50 ns; --5450 ns
	clk <= '0';
	cs <= "011";
    wait for 50 ns; --5500 ns
	clk <= '1';
    wait for 50 ns; --5550 ns
	clk <= '0';
    wait for 50 ns; --5600 ns
	clk <= '1';
    wait for 50 ns; --5650 ns
	clk <= '0';
    wait for 50 ns; --5700 ns
	clk <= '1';
    wait for 50 ns; --5750 ns
	clk <= '0';
    wait for 50 ns; --5800 ns
	clk <= '1';
    wait for 50 ns; --5850 ns
	clk <= '0';
    wait for 50 ns; --5900 ns
	clk <= '1';
    wait for 50 ns; --5950 ns
	clk <= '0';
	cs <= "100";
--	end of stimulus events
	wait;
end process; -- end of stimulus process
	



	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_programmable_prescalar of programmable_prescalar_tb is
	for TB_ARCHITECTURE
		for UUT : programmable_prescalar
			use entity work.programmable_prescalar(structure);
		end for;
	end for;
end TESTBENCH_FOR_programmable_prescalar;

