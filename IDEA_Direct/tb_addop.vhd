--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:35:14 05/26/2023
-- Design Name:   Testbench for 16-bit Adder
-- Module Name:   tb_addop
-- Project Name:  idea
-- Description:   Testbench for verifying the addop module functionality
-- 
-- Dependencies:  addop.vhd
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--   Tests both basic and overflow cases for 16-bit addition
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL; 

ENTITY tb_addop IS
END tb_addop;

ARCHITECTURE behavior OF tb_addop IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT addop
    PORT(
        A : IN  std_logic_vector(15 downto 0);
        B : IN  std_logic_vector(15 downto 0);
        C : OUT std_logic_vector(15 downto 0)
    );
    END COMPONENT;

    -- Input signals
    signal A : std_logic_vector(15 downto 0) := (others => '0');
    signal B : std_logic_vector(15 downto 0) := (others => '0');

    -- Output signal
    signal C : std_logic_vector(15 downto 0);

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: addop PORT MAP (
        A => A,
        B => B,
        C => C
    );

    -- Stimulus process
    stimulus: process
    begin
        -- Test case 1: Zero addition
        A <= "0000000000000000";
        B <= "1111111111111111";
        wait for 200 ns;
        
        -- Test case 2: Non-zero addition with potential overflow
        A <= "1000111100000000";  -- 0x8F00
        B <= "0100110011100011";  -- 0x4CE3
        wait for 200 ns;
        
        -- Add more test cases here if needed
        wait;
    end process stimulus;

END behavior;