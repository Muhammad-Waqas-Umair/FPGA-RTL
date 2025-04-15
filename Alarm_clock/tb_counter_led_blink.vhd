--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:50:27 07/28/2023
-- Design Name:   LED Blink Counter Testbench
-- Module Name:   tb_counter_led_blink
-- Project Name:  Alarm_clock1
-- Description:   Testbench for 2Hz LED blinker module
--
-- Dependencies:  counter_led_blink.vhd
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--   Tests 2Hz blinking functionality during snooze mode
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_counter_led_blink IS
END tb_counter_led_blink;

ARCHITECTURE behavior OF tb_counter_led_blink IS 

    -- Component Declaration for Unit Under Test (UUT)
    COMPONENT counter_led_blink
    PORT(
        clk           : IN  std_logic;
        snooze_act    : IN  std_logic;
        reset         : IN  std_logic;
        led_blink_2Hz : OUT std_logic
    );
    END COMPONENT;

    -- Input signals
    signal clk        : std_logic := '0';
    signal snooze_act : std_logic := '0';
    signal reset      : std_logic := '0';

    -- Output signal
    signal led_blink_2Hz : std_logic;

    -- Clock period definitions (0.1ms = 10kHz clock)
    constant clk_period : time := 0.1 ms;
 
BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: counter_led_blink PORT MAP(
        clk           => clk,
        snooze_act    => snooze_act,
        reset         => reset,
        led_blink_2Hz => led_blink_2Hz
    );

    -- Clock process (10kHz clock)
    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initial reset
        reset <= '1';
        wait for clk_period;
        reset <= '0';
        
        -- Test 1
        snooze_act <= '1';
        wait for 1000 ms;  
        
        -- Test 2
        snooze_act <= '0';
        wait for 200 ms;
        
        -- Test 3
        snooze_act <= '1';
        wait for 500 ms;
        
        wait;
    end process;

END;