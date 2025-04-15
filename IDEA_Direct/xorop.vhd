----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Waqas Umair
-- 
-- Create Date:    01:26:27 05/26/2023 
-- Design Name:    XOR Operation Module
-- Module Name:    xorop - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    16-bit bitwise XOR operation
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity xorop is
    Port (
        A : in  STD_LOGIC_VECTOR(15 downto 0);
        B : in  STD_LOGIC_VECTOR(15 downto 0);
        C : out STD_LOGIC_VECTOR(15 downto 0)
    );
end xorop;

architecture Behavioral of xorop is
begin
    -- Bitwise XOR process
    xor_process: process(A, B)
    begin
        C <= A xor B;
    end process xor_process;
    
end Behavioral;