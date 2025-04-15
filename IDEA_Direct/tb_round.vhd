--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:01:44 05/28/2023
-- Design Name:   
-- Module Name:   tb_round
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: round
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

ENTITY tb_round IS
END tb_round;

ARCHITECTURE behavior OF tb_round IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT round
    PORT(
        X1 : IN  std_logic_vector(15 downto 0);
        X2 : IN  std_logic_vector(15 downto 0);
        X3 : IN  std_logic_vector(15 downto 0);
        X4 : IN  std_logic_vector(15 downto 0);
        Z1 : IN  std_logic_vector(15 downto 0);
        Z2 : IN  std_logic_vector(15 downto 0);
        Z3 : IN  std_logic_vector(15 downto 0);
        Z4 : IN  std_logic_vector(15 downto 0);
        Z5 : IN  std_logic_vector(15 downto 0);
        Z6 : IN  std_logic_vector(15 downto 0);
        Y1 : OUT std_logic_vector(15 downto 0);
        Y2 : OUT std_logic_vector(15 downto 0);
        Y3 : OUT std_logic_vector(15 downto 0);
        Y4 : OUT std_logic_vector(15 downto 0)
    );
    END COMPONENT;

    -- Inputs
    signal X1 : std_logic_vector(15 downto 0) := (others => '0');
    signal X2 : std_logic_vector(15 downto 0) := (others => '0');
    signal X3 : std_logic_vector(15 downto 0) := (others => '0');
    signal X4 : std_logic_vector(15 downto 0) := (others => '0');
    signal Z1 : std_logic_vector(15 downto 0) := (others => '0');
    signal Z2 : std_logic_vector(15 downto 0) := (others => '0');
    signal Z3 : std_logic_vector(15 downto 0) := (others => '0');
    signal Z4 : std_logic_vector(15 downto 0) := (others => '0');
    signal Z5 : std_logic_vector(15 downto 0) := (others => '0');
    signal Z6 : std_logic_vector(15 downto 0) := (others => '0');

    -- Outputs
    signal Y1 : std_logic_vector(15 downto 0);
    signal Y2 : std_logic_vector(15 downto 0);
    signal Y3 : std_logic_vector(15 downto 0);
    signal Y4 : std_logic_vector(15 downto 0);

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: round PORT MAP(
        X1 => X1,
        X2 => X2,
        X3 => X3,
        X4 => X4,
        Z1 => Z1,
        Z2 => Z2,
        Z3 => Z3,
        Z4 => Z4,
        Z5 => Z5,
        Z6 => Z6,
        Y1 => Y1,
        Y2 => Y2,
        Y3 => Y3,
        Y4 => Y4
    );

    -- Stimulus process
    stimulus_proc: process
    begin
        -- Initial values (all zeros)
        
        -- Input stimulus with 100ns increments
        X1 <= x"0000", x"ffff" after 100 ns;
        X2 <= x"0000", x"aaaa" after 200 ns;
        X3 <= x"0000", x"5555" after 300 ns;
        X4 <= x"0000", x"2492" after 400 ns;
        
        -- Key stimulus with 100ns increments
        Z1 <= x"0000", x"db6d" after 500 ns;
        Z2 <= x"0000", x"1c71" after 600 ns;
        Z3 <= x"0000", x"cccc" after 700 ns;
        Z4 <= x"0000", x"0002" after 800 ns;
        Z5 <= x"0000", x"eeee" after 900 ns;
        Z6 <= x"0000", x"8888" after 1000 ns;
        
        wait;
    end process stimulus_proc;

END behavior;