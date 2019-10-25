library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity digit_drive_period is
port(
clk : in std_logic; -- system clock
rst_bar : in std_logic; -- active low asynchronous reset
digit_drive : out std_logic; -- digit driver control signal
digit_cnt_enable : out std_logic -- enable to digit counter
);
end digit_drive_period;



architecture behavioral of digit_drive_period is
begin
process (clk, rst_bar)
variable count : unsigned(3 downto 0);
begin
if rst_bar = '0' then
count := (others => '0'); -- initial count is 0
digit_drive <= '1'; -- digit_drive 1
digit_cnt_enable <= '0'; -- digit_cnt_enable 0
elsif rising_edge(clk) then
count := count + 1; -- increment count
if count = "0000" then
-- first clk in period, digit_drive is 1 and digit_cnt enable is 0
digit_drive <= '1';
digit_cnt_enable <= '0';
elsif count = 15 then
-- last clk in period, digit_drive is 1, digit_cnt_enable is 1
digit_drive <= '1';
digit_cnt_enable <= '1'; 
else
-- middle 14 clks in period, digit_drive is 0, digit_cnt_enable
-- is 0
digit_drive <= '0';
digit_cnt_enable <= '0';
end if;
end if;
end process;
end behavioral;