--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:35:14 05/26/2023
-- Design Name:   
-- Module Name:   C:/Users/umair khan/Videos/Desktop/direct/tb_addop.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: addop
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
USE IEEE.std_logic_unsigned.all; 
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_addop IS
END tb_addop;
 
ARCHITECTURE behavior OF tb_addop IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT addop
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         C : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal C : std_logic_vector(15 downto 0);
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: addop PORT MAP (
          A => A,
          B => B,
          C => C
        );

 

   -- Stimulus process
    A<="0000000000000000", "1000111100000000" after 200ns ;
    B<="1111111111111111", "0100110011100011" after 200ns;
			  
  

END;
