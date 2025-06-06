----------------------------------------------------------------------------------
-- Company:         
-- Engineer:        Waqas Umair
-- 
-- Create Date:    16:04:15 06/19/2023 
-- Design Name:    Alarm Clock Controller
-- Module Name:    Alarm_clock - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    Main alarm clock controller with time setting and alarm functions
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Alarm_clock is
    port (
        -- Clock and reset
        clk, reset : in std_logic;
        
        -- Mode and control inputs
        alarm_mode : in std_logic_vector(2 downto 0);
        key_plus_minus, key_enable : in std_logic;
        key_action_long, key_action_imp : in std_logic;
        
        -- Current time inputs
        current_minute : in std_logic_vector(5 downto 0);
        current_second : in std_logic_vector(5 downto 0);    
        current_hour : in std_logic_vector(4 downto 0);
        
        -- Outputs
        led_alarm_act, led_alarm_ring : out std_logic;
        lcd_al_snooze, lcd_al_act : out std_logic;
        ringing_out : out std_logic;
        lcd_al_minute : out std_logic_vector(5 downto 0);
        lcd_al_hour : out std_logic_vector(4 downto 0)
    );
end Alarm_clock;

architecture Behavioral of Alarm_clock is

    -- Component declarations
    component Set_time_function  
        port (
            clock : in std_logic;
            reset : in std_logic;
            alarm_mode : in std_logic_vector(2 downto 0);
            key_plus_minus : in std_logic;
            key_enable : in std_logic;
            set_hour : out std_logic_vector(4 downto 0);
            set_minute : out std_logic_vector(5 downto 0);
            set_second : out std_logic_vector(5 downto 0)
        );
    end component;

    component Alarm_clock_fsm
        port (
            clk : in std_logic;
            reset : in std_logic;
            alarm_mode : in std_logic_vector(2 downto 0);
            key_action_long : in std_logic;
            key_action_imp : in std_logic;
            set_hour : in std_logic_vector(4 downto 0);
            set_minute : in std_logic_vector(5 downto 0);
            led_blink_2Hz : in std_logic;
            set_second : in std_logic_vector(5 downto 0);
            current_second : in std_logic_vector(5 downto 0);    
            current_minute : in std_logic_vector(5 downto 0);
            current_hour : in std_logic_vector(4 downto 0);
            led_alarm_act : out std_logic;
            led_alarm_ring : out std_logic;
            ringing_out : out std_logic;
            lcd_al_snooze : out std_logic;
            lcd_al_act : out std_logic
        );
    end component;

    component counter_led_blink
        port (
            clk : in std_logic;
            reset : in std_logic;
            snooze_act : in std_logic;
            led_blink_2Hz : out std_logic
        );
    end component;

    -- Internal signals
    signal hh : std_logic_vector(4 downto 0);
    signal mm : std_logic_vector(5 downto 0);
    signal ss : std_logic_vector(5 downto 0);
    signal fsm_1, fsm_2, fsm_3, fsm_4, fsm_6 : std_logic;

begin
    -- Component instantiations with named association
    M1: Set_time_function 
        port map(
            clock => clk,
            reset => reset,
            alarm_mode => alarm_mode,
            key_enable => key_enable,
            key_plus_minus => key_plus_minus,
            set_hour => hh,
            set_minute => mm,
            set_second => ss
        );

    A1: Alarm_clock_fsm 
        port map(
            clk => clk,
            reset => reset,
            alarm_mode => alarm_mode,
            key_action_long => key_action_long,
            key_action_imp => key_action_imp,
            set_hour => hh,
            set_minute => mm,
            set_second => ss,
            current_second => current_second,
            current_hour => current_hour,
            current_minute => current_minute,
            led_blink_2Hz => fsm_6,
            led_alarm_act => fsm_2,
            led_alarm_ring => fsm_1,
            ringing_out => ringing_out,
            lcd_al_snooze => fsm_3,
            lcd_al_act => fsm_4
        );

    C1: counter_led_blink 
        port map(
            clk => clk,
            snooze_act => fsm_3,
            reset => reset,
            led_blink_2Hz => fsm_6    
        );
    
    -- Output assignments
    lcd_al_minute <= mm;
    lcd_al_hour <= hh;
    led_alarm_ring <= fsm_1;
    led_alarm_act <= fsm_2;
    lcd_al_snooze <= fsm_3;
    lcd_al_act <= fsm_4;
    
end Behavioral;