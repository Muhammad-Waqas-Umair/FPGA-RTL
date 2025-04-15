----------------------------------------------------------------------------------
-- Company:  
-- Engineer:     Waqas Umair
--  
-- Create Date:    13:51:53 06/17/2023  
-- Design Name:  
-- Module Name:    Set_time_function - Behavioral  
-- Project Name:  
-- Target Devices:  
-- Tool versions:  
-- Description:  
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
use IEEE.NUMERIC_STD.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
 
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
 
entity Set_time_function is
    Port (
        clock,reset : in std_logic;
        alarm_mode : in std_logic_vector(2 downto 0);
        key_enable,key_plus_minus: in std_logic;
        set_hour : out std_logic_vector (4 downto 0);
        set_minute: out std_logic_vector (5 downto 0);
        set_second: out std_logic_vector (5 downto 0)
      ---  set_second: out std_logic_vector (5 downto 0)
    );
end Set_time_function;
 
architecture Behavioral of Set_time_function is
signal  counter: integer range 0 to 1439 := 16;
 -- signal logic, logic_0: std_logic_vector (11 downto 0);
begin
 
 set_time_proc: process (clock, reset, alarm_mode,key_plus_minus,key_enable,counter)
    
  begin
      if clock'event and clock= '1' then -----clk change
      ----- if alarm_modification_act= '1' then

            if reset = '1' then
                 counter<= 16;
            else
                if alarm_mode= "010" then
                 if (key_enable = '1')  and (key_plus_minus = '1')  then
                       if counter= 1439 then
                             counter<=0;
                 else       
                         counter<=counter+1;    
                end if;
                    
                elsif (key_enable = '1')  and (key_plus_minus = '0')  then
                         if counter= 0 then
                             counter<=1439;
                         else       
                         counter<=counter-1;
                        end if;  
                end if;
           end if;
           end if;   
   end if;
  end process;
 
out_proc: process (counter )
------variable logic,logic_0: std_logic_vector (11 downto 0);
 begin
 set_hour <= std_logic_vector(to_unsigned((counter /60),set_hour'length));
 set_minute <= std_logic_vector(to_unsigned((counter mod 60),set_minute'length));
 set_second <="000000";
 end process;
end Behavioral;