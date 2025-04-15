----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Waqas Umair
-- 
-- Create Date:    04:22:52 06/27/2023 
-- Design Name: 
-- Module Name:    Alarm_ - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Alarm_clock_fsm is
port
     (clk: in std_logic;
  reset: in std_logic;
  alarm_mode: in std_logic_vector( 2 downto 0);
  key_action_long: in std_logic;
  key_action_imp: in std_logic;
  
  led_blink_2Hz:in std_logic;
      current_second: in std_logic_vector(5 downto 0); 
  current_minute: in std_logic_vector(5 downto 0);
  current_hour: in std_logic_vector(4 downto 0);
  set_second: in std_logic_vector(5 downto 0); 
  set_minute: in std_logic_vector(5 downto 0);
  set_hour: in std_logic_vector(4 downto 0);
          ------outputs
     led_alarm_act,led_alarm_ring : out std_logic;
     ringing_out:out std_logic;
     lcd_al_snooze, lcd_al_act: out std_logic
);

end Alarm_clock_fsm;

architecture Behavioral of Alarm_clock_fsm is
signal counter_a: integer range 0 to 599999:=0;
signal counter_s: integer range 0 to 599999:=0;
type state_type is (set_time,active,ring,snooze,inactive);
signal current_state,next_state: state_type;
 
 begin
  clock:process(clk,reset)
begin
   --- if clk'EVENT and clk='1' then
        if reset = '1' THEN
           current_state <= inactive;
        elsif clk'EVENT and clk='1' then
           current_state <= next_state;
            if current_state=ring  then 
                 counter_a<=counter_a+1; 
             else     
                  counter_a<=0; 
            end if;
            if current_state=snooze  then 
                 counter_s<=counter_s+1; 
             else     
                  counter_s<=0;        
                 
              end if;
          end if;
              
  
    end process;
fsm: process(current_state,key_action_imp,key_action_long, current_hour, current_minute,set_hour, set_minute,current_second,set_second,counter_a,counter_s,alarm_mode)
  
begin
next_state<=current_state;
case current_state is
     when inactive =>
                if (alarm_mode="010") and ((key_action_imp) ='1') then 
      next_state<= active;
                else 
      next_state<= inactive;
                end if;

     when active =>
              
               if(current_hour=set_hour and current_minute=set_minute and current_second="000000") then 
  next_state<= ring;
elsif(key_action_imp='1') and (alarm_mode="010") then
       next_state<= inactive;

               else 
next_state<= active;
               end if;
  when ring =>
              
--if(current_hour/=set_hour and current_minute/=set_minute ) then 
-- next_state<= active;
  if counter_a>= 599999 and (key_action_long='0') and (key_action_imp='0') then
      next_state<= active;
              elsif (key_action_long='1')then 
next_state<= active;
elsif(key_action_imp='1' ) then  
next_state<= snooze;
              else 
                ---- counter<=counter+1;
next_state<= ring;
              end if;
  when snooze =>
        
               if counter_s>=599999 then
                      
next_state<= ring;
    elsif (key_action_long='1')then 
next_state<= active;  
 
                else 
next_state<= snooze;
               end if;

  when others =>
              
                   next_state <= inactive;
 end case;

end process;
process(current_state)
begin
case current_state is
     when inactive =>
                 led_alarm_act<='0';
                 led_alarm_ring<='0';
lcd_al_act<='0';
     lcd_al_snooze<='0';
       ringing_out<='0';
             
    when active =>
                led_alarm_act<='1';
led_alarm_ring<='0';
lcd_al_act<='1';
lcd_al_snooze<='0';
                 ringing_out<='0';
     when ring =>
                led_alarm_act<='1';
led_alarm_ring<='1';
lcd_al_act<='1';
lcd_al_snooze<='0';
ringing_out<='1';
    when snooze =>
     
  
                led_alarm_act<= led_blink_2Hz; 
        led_alarm_ring<='0';
    lcd_al_act<='0';
lcd_al_snooze<='1';
ringing_out<='0';
             
               
   when  =>
                led_alarm_act<='0';
led_alarm_ring<='0';
lcd_al_act<='0';
lcd_al_snooze<='0';
ringing_out<='0';
              
 end case;


end process;


end Behavioral;

