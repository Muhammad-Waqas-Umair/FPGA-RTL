----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Waqas Umair
-- 
-- Create Date:     
-- Design Name:    IDEA Cryptographic Algorithm
-- Module Name:    idea - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    Implementation of the IDEA block cipher algorithm
--                 with 8 rounds and output transformation
--
-- Dependencies:   round, trafo components
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--   Implements complete IDEA cipher with key scheduling and 8 rounds
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity idea is
    Port ( 
        -- 128-bit encryption key
        KEY : in  STD_LOGIC_VECTOR(127 downto 0);
        
        -- Input data blocks
        X_1 : in  STD_LOGIC_VECTOR(15 downto 0);
        X_2 : in  STD_LOGIC_VECTOR(15 downto 0);
        X_3 : in  STD_LOGIC_VECTOR(15 downto 0);
        X_4 : in  STD_LOGIC_VECTOR(15 downto 0);
        
        -- Output data blocks
        Y_1 : out STD_LOGIC_VECTOR(15 downto 0);
        Y_2 : out STD_LOGIC_VECTOR(15 downto 0);
        Y_3 : out STD_LOGIC_VECTOR(15 downto 0);
        Y_4 : out STD_LOGIC_VECTOR(15 downto 0)
    );
end idea;

architecture Structural of idea is
    ----- Component Declarations -----
    component round
        Port ( 
            X1 : in  STD_LOGIC_VECTOR(15 downto 0);
            X2 : in  STD_LOGIC_VECTOR(15 downto 0);
            X3 : in  STD_LOGIC_VECTOR(15 downto 0);
            X4 : in  STD_LOGIC_VECTOR(15 downto 0);
            Z1 : in  STD_LOGIC_VECTOR(15 downto 0);
            Z2 : in  STD_LOGIC_VECTOR(15 downto 0);
            Z3 : in  STD_LOGIC_VECTOR(15 downto 0);
            Z4 : in  STD_LOGIC_VECTOR(15 downto 0);
            Z5 : in  STD_LOGIC_VECTOR(15 downto 0);
            Z6 : in  STD_LOGIC_VECTOR(15 downto 0);
            Y1 : out STD_LOGIC_VECTOR(15 downto 0);
            Y2 : out STD_LOGIC_VECTOR(15 downto 0);
            Y3 : out STD_LOGIC_VECTOR(15 downto 0);
            Y4 : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component trafo
        Port ( 
            x1 : in  STD_LOGIC_VECTOR(15 downto 0);
            x2 : in  STD_LOGIC_VECTOR(15 downto 0);
            x3 : in  STD_LOGIC_VECTOR(15 downto 0);
            x4 : in  STD_LOGIC_VECTOR(15 downto 0);
            z1 : in  STD_LOGIC_VECTOR(15 downto 0);
            z2 : in  STD_LOGIC_VECTOR(15 downto 0);
            z3 : in  STD_LOGIC_VECTOR(15 downto 0);
            z4 : in  STD_LOGIC_VECTOR(15 downto 0);
            y1 : out STD_LOGIC_VECTOR(15 downto 0);
            y2 : out STD_LOGIC_VECTOR(15 downto 0);
            y3 : out STD_LOGIC_VECTOR(15 downto 0);
            y4 : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    ----- Internal Signals -----
    -- Round intermediate results
    signal A,B,C,D       : std_logic_vector(15 downto 0);  -- Round 1 outputs
    signal A1,B1,C1,D1   : std_logic_vector(15 downto 0);  -- Round 2 outputs
    signal A3,B3,C3,D3   : std_logic_vector(15 downto 0);  -- Round 3 outputs
    signal A4,B4,C4,D4   : std_logic_vector(15 downto 0);  -- Round 4 outputs
    signal A5,B5,C5,D5   : std_logic_vector(15 downto 0);  -- Round 5 outputs
    signal A6,B6,C6,D6   : std_logic_vector(15 downto 0);  -- Round 6 outputs
    signal A7,B7,C7,D7   : std_logic_vector(15 downto 0);  -- Round 7 outputs
    signal A8,B8,C8,D8   : std_logic_vector(15 downto 0);  -- Round 8 outputs
    signal A9,B9,C9,D9   : std_logic_vector(15 downto 0);  -- Final transformation outputs

    -- Key schedule signals
    signal Z1_1, Z2_1, Z3_1, Z4_1, Z5_1, Z6_1 : STD_LOGIC_VECTOR(15 downto 0);  -- Round 1 keys
    signal Z1_2, Z2_2, Z3_2, Z4_2, Z5_2, Z6_2 : STD_LOGIC_VECTOR(15 downto 0);  -- Round 2 keys
    signal Z1_3, Z2_3, Z3_3, Z4_3, Z5_3, Z6_3 : STD_LOGIC_VECTOR(15 downto 0);  -- Round 3 keys
    signal Z1_4, Z2_4, Z3_4, Z4_4, Z5_4, Z6_4 : STD_LOGIC_VECTOR(15 downto 0);  -- Round 4 keys
    signal Z1_5, Z2_5, Z3_5, Z4_5, Z5_5, Z6_5 : STD_LOGIC_VECTOR(15 downto 0);  -- Round 5 keys
    signal Z1_6, Z2_6, Z3_6, Z4_6, Z5_6, Z6_6 : STD_LOGIC_VECTOR(15 downto 0);  -- Round 6 keys
    signal Z1_7, Z2_7, Z3_7, Z4_7, Z5_7, Z6_7 : STD_LOGIC_VECTOR(15 downto 0);  -- Round 7 keys
    signal Z1_0, Z2_0, Z3_0, Z4_0, Z5_0, Z6_0 : STD_LOGIC_VECTOR(15 downto 0);  -- Round 8 keys
    signal Z1_9, Z2_9, Z3_9, Z4_9             : STD_LOGIC_VECTOR(15 downto 0);  -- Output transformation keys

begin
    ----- Key Scheduling -----
    -- Round 1 key assignment
    Z1_1 <= KEY(127 downto 112);
    Z2_1 <= KEY(111 downto 96);
    Z3_1 <= KEY(95 downto 80);
    Z4_1 <= KEY(79 downto 64);
    Z5_1 <= KEY(63 downto 48);
    Z6_1 <= KEY(47 downto 32);
    
    -- Round 2 key assignment
    Z1_2 <= KEY(31 downto 16);
    Z2_2 <= KEY(15 downto 0);
    Z3_2 <= KEY(102 downto 87);
    Z4_2 <= KEY(86 downto 71);
    Z5_2 <= KEY(70 downto 55);
    Z6_2 <= KEY(54 downto 39);
    
    -- Round 3 key assignment
    Z1_3 <= KEY(38 downto 23);
    Z2_3 <= KEY(22 downto 7);
    Z3_3 <= KEY(6 downto 0) & KEY(127 downto 119);
    Z4_3 <= KEY(118 downto 103);
    Z5_3 <= KEY(77 downto 62);
    Z6_3 <= KEY(61 downto 46);
    
    -- Round 4 key assignment
    Z1_4 <= KEY(45 downto 30);
    Z2_4 <= KEY(29 downto 14);
    Z3_4 <= KEY(13 downto 0) & KEY(127 downto 126);
    Z4_4 <= KEY(125 downto 110);
    Z5_4 <= KEY(109 downto 94);
    Z6_4 <= KEY(93 downto 78);
    
    -- Round 5 key assignment
    Z1_5 <= KEY(52 downto 37);
    Z2_5 <= KEY(36 downto 21);
    Z3_5 <= KEY(20 downto 5);
    Z4_5 <= KEY(4 downto 0) & KEY(127 downto 117);
    Z5_5 <= KEY(116 downto 101);
    Z6_5 <= KEY(100 downto 85);
    
    -- Round 6 key assignment
    Z1_6 <= KEY(84 downto 69);
    Z2_6 <= KEY(68 downto 53);
    Z3_6 <= KEY(27 downto 12);
    Z4_6 <= KEY(11 downto 0) & KEY(127 downto 124);
    Z5_6 <= KEY(123 downto 108);
    Z6_6 <= KEY(107 downto 92);
    
    -- Round 7 key assignment
    Z1_7 <= KEY(91 downto 76);
    Z2_7 <= KEY(75 downto 60);
    Z3_7 <= KEY(59 downto 44);
    Z4_7 <= KEY(43 downto 28);
    Z5_7 <= KEY(2 downto 0) & KEY(127 downto 115);
    Z6_7 <= KEY(114 downto 99);
    
    -- Round 8 key assignment
    Z1_0 <= KEY(98 downto 83);
    Z2_0 <= KEY(82 downto 67);
    Z3_0 <= KEY(66 downto 51);
    Z4_0 <= KEY(50 downto 35);
    Z5_0 <= KEY(34 downto 19);
    Z6_0 <= KEY(18 downto 3);
    
    -- Output transformation key assignment
    Z1_9 <= KEY(105 downto 90);
    Z2_9 <= KEY(89 downto 74);
    Z3_9 <= KEY(73 downto 58);
    Z4_9 <= KEY(57 downto 42);

    ----- Encryption Rounds -----
    round_1: round port map (
        X1 => X_1, X2 => X_2, X3 => X_3, X4 => X_4,
        Z1 => Z1_1, Z2 => Z2_1, Z3 => Z3_1, Z4 => Z4_1, Z5 => Z5_1, Z6 => Z6_1,
        Y1 => A, Y2 => B, Y3 => C, Y4 => D
    );
    
    round_2: round port map (
        X1 => A, X2 => B, X3 => C, X4 => D,
        Z1 => Z1_2, Z2 => Z2_2, Z3 => Z3_2, Z4 => Z4_2, Z5 => Z5_2, Z6 => Z6_2,
        Y1 => A1, Y2 => B1, Y3 => C1, Y4 => D1
    );
    
    round_3: round port map (
        X1 => A1, X2 => B1, X3 => C1, X4 => D1,
        Z1 => Z1_3, Z2 => Z2_3, Z3 => Z3_3, Z4 => Z4_3, Z5 => Z5_3, Z6 => Z6_3,
        Y1 => A3, Y2 => B3, Y3 => C3, Y4 => D3
    );
    
    round_4: round port map (
        X1 => A3, X2 => B3, X3 => C3, X4 => D3,
        Z1 => Z1_4, Z2 => Z2_4, Z3 => Z3_4, Z4 => Z4_4, Z5 => Z5_4, Z6 => Z6_4,
        Y1 => A4, Y2 => B4, Y3 => C4, Y4 => D4
    );
    
    round_5: round port map (
        X1 => A4, X2 => B4, X3 => C4, X4 => D4,
        Z1 => Z1_5, Z2 => Z2_5, Z3 => Z3_5, Z4 => Z4_5, Z5 => Z5_5, Z6 => Z6_5,
        Y1 => A5, Y2 => B5, Y3 => C5, Y4 => D5
    );
    
    round_6: round port map (
        X1 => A5, X2 => B5, X3 => C5, X4 => D5,
        Z1 => Z1_6, Z2 => Z2_6, Z3 => Z3_6, Z4 => Z4_6, Z5 => Z5_6, Z6 => Z6_6,
        Y1 => A6, Y2 => B6, Y3 => C6, Y4 => D6
    );
    
    round_7: round port map (
        X1 => A6, X2 => B6, X3 => C6, X4 => D6,
        Z1 => Z1_7, Z2 => Z2_7, Z3 => Z3_7, Z4 => Z4_7, Z5 => Z5_7, Z6 => Z6_7,
        Y1 => A7, Y2 => B7, Y3 => C7, Y4 => D7
    );
    
    round_8: round port map (
        X1 => A7, X2 => B7, X3 => C7, X4 => D7,
        Z1 => Z1_0, Z2 => Z2_0, Z3 => Z3_0, Z4 => Z4_0, Z5 => Z5_0, Z6 => Z6_0,
        Y1 => A8, Y2 => B8, Y3 => C8, Y4 => D8
    );
    
    ----- Output Transformation -----
    trafo_1: trafo port map (
        x1 => A8, x2 => B8, x3 => C8, x4 => D8,
        z1 => Z1_9, z2 => Z2_9, z3 => Z3_9, z4 => Z4_9,
        y1 => A9, y2 => B9, y3 => C9, y4 => D9
    );

    ----- Final Outputs -----
    Y_1 <= A9;
    Y_2 <= B9;
    Y_3 <= C9;
    Y_4 <= D9;

end Structural;