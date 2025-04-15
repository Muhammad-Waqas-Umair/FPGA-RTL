--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:44:06 07/12/2023
-- Design Name:   
-- Module Name:   C:/Users/umair khan/Videos/Desktop/4th semestter/vhdl/Alarm_clock1/tb_set_time_function.vhd
-- Project Name:  Alarm_clock1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Set_time_function
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
 
ENTITY tb_set_time_function IS
END tb_set_time_function;
 
ARCHITECTURE behavior OF tb_set_time_function IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Set_time_function
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         alarm_mode : IN  std_logic_vector(2 downto 0);
         key_enable : IN  std_logic;
         key_plus_minus : IN  std_logic;
         set_hour : OUT  std_logic_vector(4 downto 0);
         set_minute : OUT  std_logic_vector(5 downto 0);
         set_second : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal alarm_mode : std_logic_vector(2 downto 0) := "000";
   signal key_enable : std_logic := '0';
   signal key_plus_minus : std_logic := '0';

 	--Outputs
   signal set_hour : std_logic_vector(4 downto 0);
   signal set_minute : std_logic_vector(5 downto 0);
   signal set_second : std_logic_vector(5 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Set_time_function PORT MAP (
          clock => clock,
          reset => reset,
          alarm_mode => alarm_mode,
          key_enable => key_enable,
          key_plus_minus => key_plus_minus,
          set_hour => set_hour,
          set_minute => set_minute,
          set_second => set_second
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
  process  
  begin
     
    reset <= '0';
    key_enable <= '1';
    key_plus_minus <= '0';
	 alarm_mode <= "010";
    
    
  
    wait;
    end process;

end Behavior;
