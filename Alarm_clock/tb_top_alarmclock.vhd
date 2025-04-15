--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:53:12 07/12/2023 
-- Design Name:   
-- Module Name:   tb_top_alarmclock
-- Project Name:  Alarm_clock1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Alarm_clock
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_top_alarmclock IS
END tb_top_alarmclock;
 
ARCHITECTURE behavior OF tb_top_alarmclock IS 
 
    COMPONENT Alarm_clock
    PORT(
        clk             : IN  std_logic;
        reset           : IN  std_logic;
        alarm_mode      : IN  std_logic_vector(2 downto 0);
        key_enable      : IN  std_logic;
        key_plus_minus  : IN  std_logic;
        key_action_long : IN  std_logic;
        key_action_imp  : IN  std_logic;
        current_second  : IN  std_logic_vector(5 downto 0);
        current_minute  : IN  std_logic_vector(5 downto 0);
        current_hour    : IN  std_logic_vector(4 downto 0);
        led_alarm_act   : OUT std_logic;
        led_alarm_ring  : OUT std_logic;
        lcd_al_snooze   : OUT std_logic;
        lcd_al_act      : OUT std_logic;
        lcd_al_minute   : OUT std_logic_vector(5 downto 0);
        lcd_al_hour     : OUT std_logic_vector(4 downto 0)
    );
    END COMPONENT;
    
    -- Inputs
    signal clk             : std_logic := '0';
    signal reset           : std_logic := '0';
    signal alarm_mode      : std_logic_vector(2 downto 0) := "000";
    signal key_enable      : std_logic := '0';
    signal key_plus_minus  : std_logic := '0';
    signal key_action_long : std_logic := '0';
    signal key_action_imp  : std_logic := '0';
    signal current_second  : std_logic_vector(5 downto 0) := (others => '0');
    signal current_minute  : std_logic_vector(5 downto 0) := (others => '0');
    signal current_hour    : std_logic_vector(4 downto 0) := (others => '0');

    -- Outputs
    signal led_alarm_act   : std_logic;
    signal led_alarm_ring  : std_logic;
    signal lcd_al_snooze   : std_logic;
    signal lcd_al_act      : std_logic;
    signal lcd_al_minute   : std_logic_vector(5 downto 0);
    signal lcd_al_hour     : std_logic_vector(4 downto 0);

    constant clk_period : time := 10 ns;
 
BEGIN
    uut: Alarm_clock PORT MAP(
        clk             => clk,
        reset           => reset,
        alarm_mode      => alarm_mode,
        key_enable      => key_enable,
        key_plus_minus  => key_plus_minus,
        key_action_long => key_action_long,
        key_action_imp  => key_action_imp,
        current_second  => current_second,
        current_minute  => current_minute,
        current_hour    => current_hour,
        led_alarm_act   => led_alarm_act,
        led_alarm_ring  => led_alarm_ring,
        lcd_al_snooze   => lcd_al_snooze,
        lcd_al_act      => lcd_al_act,
        lcd_al_minute   => lcd_al_minute,
        lcd_al_hour     => lcd_al_hour
    );

    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
 

    stim_proc: process
    begin 
        reset <= '1';
        current_hour <= "00000";
        current_minute <= "010110";
        current_second <= "000000";
        wait for clk_period;
     
        reset <= '0';
        key_action_imp <= '1';
        alarm_mode <= "010";
        wait for clk_period;
     
        key_enable <= '1';
        key_plus_minus <= '1';
        wait for clk_period;
     
        key_enable <= '0';
        key_plus_minus <= '0';
        wait for clk_period;
     
        key_enable <= '1';
        key_plus_minus <= '1';
        wait for clk_period;
     
        key_enable <= '0';
        key_plus_minus <= '0';
        wait for clk_period;
     
        key_enable <= '1';
        key_plus_minus <= '1';
        wait for clk_period;
     
        key_enable <= '0';
        key_plus_minus <= '0';
        wait for clk_period;
     
        key_enable <= '1';
        key_plus_minus <= '1';
        wait for clk_period;
     
        key_enable <= '0';
        key_plus_minus <= '0';
        wait for clk_period;
     
        key_enable <= '1';
        key_plus_minus <= '1';
        wait for clk_period;
     
        key_enable <= '1';
        key_plus_minus <= '1';
        wait for clk_period;
     
        key_action_imp <= '0';
        key_enable <= '0';
        key_plus_minus <= '0';
        wait for clk_period;
     
        key_action_imp <= '0';
        wait for clk_period;
     
        wait for 5*clk_period;
     
        key_action_imp <= '1';
        wait for clk_period;
 
        key_action_imp <= '0';
        wait for clk_period;
       
        wait;
    end process;
    
END behavior;