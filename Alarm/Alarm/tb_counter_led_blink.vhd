--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:50:27 07/28/2023
-- Design Name:   
-- Module Name:   C:/Users/umair khan/Videos/Desktop/4th semestter+cmp/vhdl/Alarm_clock1/tb_counter_led_blink.vhd
-- Project Name:  Alarm_clock1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter_led_blink
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_counter_led_blink IS
END tb_counter_led_blink;
 
ARCHITECTURE behavior OF tb_counter_led_blink IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter_led_blink
    PORT(
         clk : IN  std_logic;
         snooze_act : IN  std_logic;
         reset : IN  std_logic;
         led_blink_2Hz : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal snooze_act : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal led_blink_2Hz : std_logic;

   -- Clock period definitions
   constant clk_period : time := 0.1 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter_led_blink PORT MAP (
          clk => clk,
          snooze_act => snooze_act,
          reset => reset,
          led_blink_2Hz => led_blink_2Hz
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
   

      wait for clk_period;
		reset<= '0';
		snooze_act<= '1';
		wait for 1000 ms;

      -- insert stimulus here 

      wait;
   end process;

END;

