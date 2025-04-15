--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:12:18 07/28/2023
-- Design Name:   
-- Module Name:   C:/Users/umair khan/Videos/Desktop/4th semestter+cmp/vhdl/Alarm_clock1/Alarm_clock_fsm.vhd
-- Project Name:  Alarm_clock1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Alarm_clock_fsm
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
 
ENTITY tb_Alarm_clock_fsm IS
END tb_Alarm_clock_fsm;
 
ARCHITECTURE behavior OF tb_Alarm_clock_fsm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Alarm_clock_fsm
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         alarm_mode : IN  std_logic_vector(2 downto 0);
         key_action_long : IN  std_logic;
         key_action_imp : IN  std_logic;
         led_blink_2Hz : IN  std_logic;
         current_second : IN  std_logic_vector(5 downto 0);
         current_minute : IN  std_logic_vector(5 downto 0);
         current_hour : IN  std_logic_vector(4 downto 0);
         set_second : IN  std_logic_vector(5 downto 0);
         set_minute : IN  std_logic_vector(5 downto 0);
         set_hour : IN  std_logic_vector(4 downto 0);
         led_alarm_act : OUT  std_logic;
         led_alarm_ring : OUT  std_logic;
         lcd_al_snooze : OUT  std_logic;
         lcd_al_act : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal alarm_mode : std_logic_vector(2 downto 0) := (others => '0');
   signal key_action_long : std_logic := '0';
   signal key_action_imp : std_logic := '0';
   signal led_blink_2Hz : std_logic := '0';
   signal current_second : std_logic_vector(5 downto 0) := (others => '0');
   signal current_minute : std_logic_vector(5 downto 0) := (others => '0');
   signal current_hour : std_logic_vector(4 downto 0) := (others => '0');
   signal set_second : std_logic_vector(5 downto 0) := (others => '0');
   signal set_minute : std_logic_vector(5 downto 0) := (others => '0');
   signal set_hour : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal led_alarm_act : std_logic;
   signal led_alarm_ring : std_logic;
   signal lcd_al_snooze : std_logic;
   signal lcd_al_act : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Alarm_clock_fsm PORT MAP (
          clk => clk,
          reset => reset,
          alarm_mode => alarm_mode,
          key_action_long => key_action_long,
          key_action_imp => key_action_imp,
          led_blink_2Hz => led_blink_2Hz,
          current_second => current_second,
          current_minute => current_minute,
          current_hour => current_hour,
          set_second => set_second,
          set_minute => set_minute,
          set_hour => set_hour,
          led_alarm_act => led_alarm_act,
          led_alarm_ring => led_alarm_ring,
          lcd_al_snooze => lcd_al_snooze,
          lcd_al_act => lcd_al_act
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
	    alarm_mode <= "010";
       wait for clk_period;
       
        key_action_imp  <= '1';
		  current_hour <= "00000";
       current_minute <= "010000";
       current_second <= "000000";
       set_hour <= "00000";
       set_minute <= "010000";
		 set_second <= "000000";
		   wait for clk_period;
			 key_action_imp <= '0';
			  wait for clk_period;
		  
       
      wait for clk_period;
     
       key_action_imp <= '1';
		 
		 
   
         wait for clk_period;
     ---   led_blink_2Hz<= '1';
      key_action_imp <= '0';
		 wait for clk_period;
		
		current_hour <= "10000";
       current_minute <= "110011";
       current_second <= "100000";
       set_hour <= "10000";
       set_minute <= "111001";
		 set_second <= "100000";
       wait for clk_period;
      wait for clk_period;
     
    wait; 
   end process;

END;
