----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Waqas Umair
-- 
-- Create Date:    01:34:03 05/26/2023 
-- Design Name:    Adder Module
-- Module Name:    addop - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    16-bit adder implementation
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addop is
    Port (
        A : in  STD_LOGIC_VECTOR(15 downto 0);
        B : in  STD_LOGIC_VECTOR(15 downto 0);
        C : out STD_LOGIC_VECTOR(15 downto 0)
    );
end addop;

architecture Behavioral of addop is
begin
    -- Addition process
    proc_addop: process(A, B) 
        variable sum_temp : std_logic_vector(15 downto 0);  -- Temporary sum variable
    begin
        sum_temp := A + B;  -- Perform addition
        C <= sum_temp;      -- Assign result to output
    end process proc_addop;
    
end Behavioral;