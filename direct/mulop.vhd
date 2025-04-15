----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Waqas Umair
-- 
-- Create Date:     
-- Design Name:    16-bit Modular Multiplier
-- Module Name:    mulop - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    Performs 16-bit multiplication with modulo 2^16+1 operation
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--      Implements multiplication in GF(2^16+1) with special case for zero inputs
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mulop is
    Port ( 
        I_1 : in  STD_LOGIC_VECTOR(15 downto 0);
        I_2 : in  STD_LOGIC_VECTOR(15 downto 0);
        O_1 : out STD_LOGIC_VECTOR(15 downto 0)
    );
end mulop;

architecture Behavioral of mulop is
    -- Internal signals
    signal XY_product       : STD_LOGIC_VECTOR(33 downto 0);
    signal XY_product_div   : STD_LOGIC_VECTOR(16 downto 0);
    signal XY_product_modulo : STD_LOGIC_VECTOR(16 downto 0);

begin
    -- Process handles special case for zero inputs and performs multiplication
    Process_both_zero_inp: process(I_1, I_2)
        variable X : STD_LOGIC_VECTOR(16 downto 0);
        variable Y : STD_LOGIC_VECTOR(16 downto 0);
    begin
        -- Handle special case for I_1 = 0 (treat as 2^16)
        if I_1 = x"0000" then 
            X := '1' & x"0000";
        else 
            X := '0' & I_1;
        end if;
        
        -- Handle special case for I_2 = 0 (treat as 2^16)
        if I_2 = x"0000" then 
            Y := '1' & x"0000";
        else 
            Y := '0' & I_2;
        end if;
        
        XY_product <= X * Y;  -- Perform multiplication
    end process Process_both_zero_inp;

    -- Split product into quotient and remainder parts
    XY_product_div     <= XY_product(32 downto 16);
    XY_product_modulo <= "0" & XY_product(15 downto 0);

    -- Process performs the modulo 2^16+1 operation
    mult_mod_process: process(XY_product_modulo, XY_product_div)
        variable output : STD_LOGIC_VECTOR(16 downto 0);
    begin
        if XY_product_modulo >= XY_product_div then 
            output := XY_product_modulo - XY_product_div;
        else 
            output := XY_product_modulo - XY_product_div + 
                     std_logic_vector(to_unsigned(2**16+1, 17));
        end if;
        
        O_1 <= output(15 downto 0);  -- Final output
    end process mult_mod_process;
    
end Behavioral;