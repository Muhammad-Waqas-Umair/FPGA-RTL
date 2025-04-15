----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Waqas Umair
-- 
-- Create Date: 07/10/2023 01:36:41 PM
-- Design Name: LED Blink Counter
-- Module Name: counter_led_blink - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Generates a 2Hz blink signal when snooze is active
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

entity counter_led_blink is
    port (
        clk           : in  std_logic;
        snooze_act    : in  std_logic;
        reset         : in  std_logic;
        led_blink_2Hz : out std_logic
    );
end counter_led_blink;

architecture Behavioral of counter_led_blink is
    signal count      : integer range 0 to 2499 := 0;
    signal twice_min  : std_logic := '0';

begin
    -- Counter process for generating 2Hz blink signal
    process(clk, reset, snooze_act)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                -- Synchronous reset
                twice_min <= '0';
                count <= 0;
            else
                if snooze_act = '1' then
                    if count = 2499 then
                        -- Toggle output every 2500 cycles (2Hz)
                        twice_min <= not twice_min;
                        count <= 0;
                    else
                        count <= count + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- Output assignment
    led_blink_2Hz <= twice_min;

end Behavioral;