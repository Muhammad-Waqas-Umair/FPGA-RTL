--------------------------------------------------------------------------------
-- Company: 
-- Engineer:     Waqas Umair
--
-- Create Date:   20:42:31 05/28/2023
-- Design Name:   Testbench for Modular Multiplier
-- Module Name:   tb_mulop
-- Project Name:  idea
-- Description:   Testbench for verifying the mulop module functionality
--                Tests modular multiplication with special zero handling
-- 
-- Dependencies:  mulop.vhd
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--   Tests various cases including:
--   - Zero inputs (special case)
--   - Small values
--   - Maximum values
--   - Overflow cases
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_mulop IS
END tb_mulop;

ARCHITECTURE behavior OF tb_mulop IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT mulop
    PORT(
        I_1 : IN  std_logic_vector(15 downto 0);
        I_2 : IN  std_logic_vector(15 downto 0);
        O_1 : OUT std_logic_vector(15 downto 0)
    );
    END COMPONENT;

    -- Input signals
    signal I_1 : std_logic_vector(15 downto 0) := (others => '0');
    signal I_2 : std_logic_vector(15 downto 0) := (others => '0');

    -- Output signal
    signal O_1 : std_logic_vector(15 downto 0);

    -- Clock period definitions (if needed)
    -- constant clk_period : time := 10 ns;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: mulop PORT MAP (
        I_1 => I_1,
        I_2 => I_2,
        O_1 => O_1
    );

    -- Stimulus process
    stimulus: process
    begin
        -- Test Case 1
        I_1 <= x"0000";
        I_2 <= x"0000";
        wait for 100 ns;
        
        -- Test Case 2
        I_1 <= x"0001";
        I_2 <= x"0000";
        wait for 100 ns;
        
        -- Test Case 3
        I_1 <= x"0001";
        I_2 <= x"0001";
        wait for 100 ns;
        
        -- Test Case 4
        I_1 <= x"0003";
        I_2 <= x"0001";
        wait for 100 ns;
        
        -- Test Case 5
        I_1 <= x"0003";
        I_2 <= x"0003";
        wait for 100 ns;
        
        -- Test Case 6
        I_1 <= x"ffff";
        I_2 <= x"7fff";
        wait for 100 ns;
        
        -- Test Case 7
        I_1 <= x"8000";
        I_2 <= x"ffff";
        wait for 100 ns;
        
        -- Test Case 8
        I_1 <= x"8000";
        I_2 <= x"0001";
        wait for 100 ns;
        
        wait;
    end process stimulus;


END behavior;

