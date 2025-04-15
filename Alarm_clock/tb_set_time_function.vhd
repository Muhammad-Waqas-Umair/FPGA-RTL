--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:44:06 07/12/2023
-- Design Name:   Time Setting Function Testbench
-- Module Name:   tb_set_time_function
-- Project Name:  Alarm_clock1
-- Description:   Testbench for time setting functionality
--
-- Dependencies:  Set_time_function.vhd
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--   Tests time increment/decrement functionality in setting mode
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_set_time_function IS
END tb_set_time_function;

ARCHITECTURE behavior OF tb_set_time_function IS 

    -- Component Declaration for Unit Under Test (UUT)
    COMPONENT Set_time_function
    PORT(
        clock          : IN  std_logic;
        reset          : IN  std_logic;
        alarm_mode     : IN  std_logic_vector(2 downto 0);
        key_enable     : IN  std_logic;
        key_plus_minus : IN  std_logic;
        set_hour       : OUT std_logic_vector(4 downto 0);
        set_minute     : OUT std_logic_vector(5 downto 0);
        set_second     : OUT std_logic_vector(5 downto 0)
    );
    END COMPONENT;

    -- Input signals
    signal clock          : std_logic := '0';
    signal reset          : std_logic := '0';
    signal alarm_mode     : std_logic_vector(2 downto 0) := "000";
    signal key_enable     : std_logic := '0';
    signal key_plus_minus : std_logic := '0';

    -- Output signals
    signal set_hour       : std_logic_vector(4 downto 0);
    signal set_minute     : std_logic_vector(5 downto 0);
    signal set_second     : std_logic_vector(5 downto 0);

    -- Clock period definitions
    constant clock_period : time := 10 ns;
 
BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: Set_time_function PORT MAP(
        clock          => clock,
        reset          => reset,
        alarm_mode     => alarm_mode,
        key_enable     => key_enable,
        key_plus_minus => key_plus_minus,
        set_hour       => set_hour,
        set_minute     => set_minute,
        set_second     => set_second
    );

    -- Clock process
    clock_process: process
    begin
        clock <= '0';
        wait for clock_period/2;
        clock <= '1';
        wait for clock_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize with reset
        reset <= '1';
        wait for clock_period;
        reset <= '0';
        
        -- Test case 1
        alarm_mode <= "010";  
        key_enable <= '1';    
        key_plus_minus <= '0'; 
        wait for 10*clock_period;
        
        -- Test case 2
        key_plus_minus <= '1'; 
        wait for 10*clock_period;
        
        -- Test case 3
        alarm_mode <= "000";  
        wait for 5*clock_period;
        
        wait;
    end process;

END behavior;