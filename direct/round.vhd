----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Waqas Umair
-- 
-- Create Date:    18:48:57 05/28/2023 
-- Design Name:    Cryptographic Round Module
-- Module Name:    round - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    Implements one round of a cryptographic algorithm
--                 using modular arithmetic operations (add, multiply, xor)
--                 with key mixing
--
-- Dependencies:   addop, xorop, mulop components
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--   Implements a Feistel-like structure with multiplication and addition operations
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity round is
    Port ( 
        -- Input data words
        X1 : in  STD_LOGIC_VECTOR(15 downto 0);
        X2 : in  STD_LOGIC_VECTOR(15 downto 0);
        X3 : in  STD_LOGIC_VECTOR(15 downto 0);
        X4 : in  STD_LOGIC_VECTOR(15 downto 0);
        
        -- Round keys
        Z1 : in  STD_LOGIC_VECTOR(15 downto 0);
        Z2 : in  STD_LOGIC_VECTOR(15 downto 0);
        Z3 : in  STD_LOGIC_VECTOR(15 downto 0);
        Z4 : in  STD_LOGIC_VECTOR(15 downto 0);
        Z5 : in  STD_LOGIC_VECTOR(15 downto 0);
        Z6 : in  STD_LOGIC_VECTOR(15 downto 0);
        
        -- Output data words
        Y1 : out STD_LOGIC_VECTOR(15 downto 0);
        Y2 : out STD_LOGIC_VECTOR(15 downto 0);
        Y3 : out STD_LOGIC_VECTOR(15 downto 0);
        Y4 : out STD_LOGIC_VECTOR(15 downto 0)
    );
end round;

architecture Behavioral of round is
    ----- Component Declarations -----
    component addop 
        port (
            A : in  STD_LOGIC_VECTOR(15 downto 0);
            B : in  STD_LOGIC_VECTOR(15 downto 0);
            C : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component xorop
        port (
            A : in  STD_LOGIC_VECTOR(15 downto 0);
            B : in  STD_LOGIC_VECTOR(15 downto 0);
            C : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component mulop
        port (
            I_1 : in  STD_LOGIC_VECTOR(15 downto 0);
            I_2 : in  STD_LOGIC_VECTOR(15 downto 0);
            O_1 : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    ----- Internal Signals -----
    -- Intermediate computation results
    signal S1, S2, S3, S4  : std_logic_vector(15 downto 0);  -- First operation results
    signal S5, S6          : std_logic_vector(15 downto 0);  -- XOR results
    signal S7, S8, S9, S10 : std_logic_vector(15 downto 0);  -- Second stage results
    signal O_1, O_2, O_3, O_4 : std_logic_vector(15 downto 0);  -- Final outputs

begin
    ----- Component Instantiations -----
    -- First stage operations (key mixing)
    mulop_1: mulop port map (I_1 => X1, I_2 => Z1, O_1 => S1);
    addop_1: addop port map (A => X2, B => Z2, C => S2);
    addop_2: addop port map (A => X3, B => Z3, C => S3);
    mulop_2: mulop port map (I_1 => X4, I_2 => Z4, O_1 => S4);
    
    -- Intermediate XOR operations
    xorop_1: xorop port map (A => S1, B => S3, C => S5);
    xorop_2: xorop port map (A => S2, B => S4, C => S6);
    
    -- Second stage operations
    mulop_3: mulop port map (I_1 => Z5, I_2 => S5, O_1 => S7);
    addop_3: addop port map (A => S7, B => S6, C => S8);
    mulop_4: mulop port map (I_1 => Z6, I_2 => S8, O_1 => S9);
    addop_4: addop port map (A => S7, B => S9, C => S10);
    
    -- Final output computations
    xorop_3: xorop port map (A => S9, B => S1, C => O_1);
    xorop_4: xorop port map (A => S3, B => S9, C => O_2);
    xorop_5: xorop port map (A => S2, B => S10, C => O_3);
    xorop_6: xorop port map (A => S10, B => S4, C => O_4);

    ----- Output Assignments -----
    Y1 <= O_1;  -- First output word
    Y2 <= O_2;  -- Second output word
    Y3 <= O_3;  -- Third output word
    Y4 <= O_4;  -- Fourth output word

end Behavioral;