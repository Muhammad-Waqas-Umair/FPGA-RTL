--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:28:47 05/26/2023
-- Design Name:   
-- Module Name:   C:/Users/umair khan/Videos/Desktop/direct/tb_xorop.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: xorop
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
 
ENTITY tb_xorop IS
END tb_xorop;
 
ARCHITECTURE behavior OF tb_xorop IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT xorop
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector (15 downto 0);
         C : OUT  std_logic_vector (15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A,B,C : std_logic_vector (15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: xorop PORT MAP (
          A => A,
          B => B,
          C => C
        );
		  

   -- Stimulus process

          A<="0000000000000000", "1000011100000000" after 200ns ;
			 B<="1111111111111111", "0100110011100011" after 300ns;
			 

    


END;
