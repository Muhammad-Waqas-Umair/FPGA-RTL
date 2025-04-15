--------------------------------------------------------------------------------
-- Company: 
-- Engineer:     Waqas Umair
--
-- Create Date:   20:42:31 05/28/2023
-- Design Name:   
-- Module Name:   C:/Users/umair khan/Videos/Desktop/direct/tb_mulop.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mulop
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
 
ENTITY tb_mulop IS
END tb_mulop;
 
ARCHITECTURE behavior OF tb_mulop IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mulop
    PORT(
         I_1 : IN  std_logic_vector(15 downto 0);
         I_2 : IN  std_logic_vector(15 downto 0);
         O_1 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_1 : std_logic_vector(15 downto 0) := (others => '0');
   signal I_2 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal O_1 : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mulop PORT MAP (
          I_1 => I_1,
          I_2 => I_2,
          O_1 => O_1
        );

   -- Clock process definitions
   
 	
		I_1<=x"0000",x"0001" after 100 ns, x"0001" after 200 ns, x"0003"after 300 ns,x"0003" after 400 ns,x"ffff" after 500 ns,x"8000" after 700ns;
		I_2<=x"0000" ,x"0000" after 100 ns,x"0001" after 200 ns,x"0001" after 300ns, x"0003" after 400 ns,x"7fff" after 500 ns,x"ffff" after 600 ns;

END;

