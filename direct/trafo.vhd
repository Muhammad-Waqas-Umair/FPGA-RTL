----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:08:35 05/28/2023 
-- Design Name:    Transformation Module
-- Module Name:    trafo - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    Performs transformation using multiplication and addition operations
--                 on input vectors with key mixing
--
-- Dependencies:   mulop, addop components
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--   Maps inputs through multiplication and addition operations with key values
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity trafo is
    Port ( 
        -- Input vectors
        x1 : in  STD_LOGIC_VECTOR(15 downto 0);
        x2 : in  STD_LOGIC_VECTOR(15 downto 0);
        x3 : in  STD_LOGIC_VECTOR(15 downto 0);
        x4 : in  STD_LOGIC_VECTOR(15 downto 0);
        
        -- Key vectors
        z1 : in  STD_LOGIC_VECTOR(15 downto 0);
        z2 : in  STD_LOGIC_VECTOR(15 downto 0);
        z3 : in  STD_LOGIC_VECTOR(15 downto 0);
        z4 : in  STD_LOGIC_VECTOR(15 downto 0);
        
        -- Output vectors
        y1 : out STD_LOGIC_VECTOR(15 downto 0);
        y2 : out STD_LOGIC_VECTOR(15 downto 0);
        y3 : out STD_LOGIC_VECTOR(15 downto 0);
        y4 : out STD_LOGIC_VECTOR(15 downto 0)
    );
end trafo;

architecture Behavioral of trafo is
    ----- Component Declarations -----
    component mulop 
        port (
            I_1 : in  STD_LOGIC_VECTOR(15 downto 0);
            I_2 : in  STD_LOGIC_VECTOR(15 downto 0);
            O_1 : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;
    
    component addop 
        port (
            A : in  STD_LOGIC_VECTOR(15 downto 0);
            B : in  STD_LOGIC_VECTOR(15 downto 0);
            C : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;
    
    ----- Internal Signals -----
    signal O_1 : std_logic_vector(15 downto 0);
    signal O_2 : std_logic_vector(15 downto 0);
    signal O_3 : std_logic_vector(15 downto 0);
    signal O_4 : std_logic_vector(15 downto 0);
    
begin
    ----- Components Instantiation -----
    -- Multiplication operations
    mulop_1: mulop 
        port map (
            I_1 => x1,
            I_2 => z1,
            O_1 => O_1
        );
    
    mulop_2: mulop 
        port map (
            I_1 => x4,
            I_2 => z4,
            O_1 => O_4
        );
    
    -- Addition operations
    addop_1: addop 
        port map (
            A => x3,
            B => z2,
            C => O_2
        );
    
    addop_2: addop 
        port map (
            A => x2,
            B => z3,
            C => O_3
        );
    
    ----- Output Assignments -----
    y1 <= O_1;
    y2 <= O_2;
    y3 <= O_3;
    y4 <= O_4;
    
end Behavioral;