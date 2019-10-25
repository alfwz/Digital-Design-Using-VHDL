library ieee;
use ieee.std_logic_1164.all;

entity dds_sts is
	generic (a : positive := 14; m : positive := 7);
	port(
	    clk : in std_logic;-- system clock
		reset_bar : in std_logic;-- asynchronous reset
		freq_val : in std_logic_vector(a - 1 downto 0);-- selects frequency
		load_freq : in std_logic;-- pulse to load a new frequency selection
		ws1 : in std_logic;-- waveform select
		ws0 : in std_logic;-- waveform select
		dac_value : out std_logic_vector(m downto 0);-- output to DAC
		pos_sine : out std_logic-- positive half of sine wave cycle
		);
end dds_sts;

architecture structural of dds_sts is	   
	signal edge_det_output : std_logic;	
	signal sig: std_logic;
	signal count_direction, max, min : std_logic;
	signal freq_reg_output : std_logic_vector(a-1 downto 0);
	signal phase_acc_output : std_logic_vector(m-1 downto 0);
	signal sine_table_output: std_logic_vector(m-1 downto 0);  
	signal temp: std_logic;
	signal mux_out : std_logic_vector(6 downto 0);
begin
	u1: entity edge_det port map (rst_bar => reset_bar, clk => clk, sig => load_freq, pos => '1', sig_edge => edge_det_output);
	u2: entity freq_reg port map (reset_bar => reset_bar, clk => clk, load => edge_det_output, d => freq_val, q => freq_reg_output);
	u3: entity phase_accumulator port map(reset_bar => reset_bar, clk => clk, d => freq_reg_output, up => count_direction, max => max, min => min, q => phase_acc_output);
	u4: entity phase_accumulator_FSM port map(reset_bar => reset_bar, clk => clk, max => max, min => min, up => count_direction, pos_neg => temp);
	u5: entity sine_table port map(addr => phase_acc_output, sine_val => sine_table_output);	
	u6: entity mux_4_to_1 port map(ch_select(1) => ws1, ch_select(0) => ws0, ch0 =>"0000000", ch1 => sine_table_output, 
		ch2 => phase_acc_output, ch3 => "1111111", mux_out => mux_out );
	u7: entity adder_subtracter	port map(pos => temp, sine_value => mux_out, dac_sine_val => dac_value);	
	  pos_sine <= temp;
end structural;