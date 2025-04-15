----------------------------------------------------------------------------------
-- Company:  
-- Engineer:     Waqas Umair
--  
-- Create Date:    13:51:53 06/17/2023  
-- Design Name:   Time Setting Function
-- Module Name:    Set_time_function - Behavioral  
-- Project Name:  
-- Target Devices:  
-- Tool versions:  
-- Description:  Handles time setting functionality for alarm clock
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
use IEEE.NUMERIC_STD.ALL;

entity Set_time_function is
    Port (
        -- Clock and control inputs
        clock       : in std_logic;
        reset       : in std_logic;
        alarm_mode  : in std_logic_vector(2 downto 0);
        key_enable  : in std_logic;
        key_plus_minus : in std_logic;
        
        -- Time outputs
        set_hour    : out std_logic_vector(4 downto 0);
        set_minute  : out std_logic_vector(5 downto 0);
        set_second  : out std_logic_vector(5 downto 0)
    );
end Set_time_function;

architecture Behavioral of Set_time_function is
    -- Internal counter (0-1439 represents 00:00 to 23:59)
    signal counter : integer range 0 to 1439 := 16;

begin
    -- Counter process for time setting
    set_time_proc: process(clock, reset)
    begin
        if rising_edge(clock) then
            if reset = '1' then
                -- Reset to default time (16 minutes past midnight)
                counter <= 16;
            else
                if alarm_mode = "010" then  -- Time setting mode
                    if key_enable = '1' then
                        if key_plus_minus = '1' then
                            -- Increment time
                            if counter = 1439 then
                                counter <= 0;
                            else       
                                counter <= counter + 1;
                            end if;
                        else
                            -- Decrement time
                            if counter = 0 then
                                counter <= 1439;
                            else       
                                counter <= counter - 1;
                            end if;  
                        end if;
                    end if;
                end if;
            end if;   
        end if;
    end process;

    -- Output conversion process
    out_proc: process(counter)
    begin
        -- Convert counter to hours and minutes
        set_hour <= std_logic_vector(to_unsigned((counter / 60), set_hour'length));
        set_minute <= std_logic_vector(to_unsigned((counter mod 60), set_minute'length));
        set_second <= "000000";  -- Seconds always set to zero
    end process;

end Behavioral;