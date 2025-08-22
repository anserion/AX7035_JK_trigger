library IEEE; use IEEE.STD_LOGIC_1164.ALL;

entity tb_JK_trigger is
end tb_JK_trigger;

architecture Behavioral of tb_JK_trigger is
    COMPONENT JK_trigger
    PORT(KEY1,KEY2,KEY3,KEY4,RESET: IN std_logic; LED1,LED2: OUT std_logic);
    END COMPONENT;

component RSC_trigger is
    Port (R,S,C: in STD_LOGIC; Q,nQ: out STD_LOGIC);
end component;    
   --Inputs
   signal KEY1,KEY2,KEY3,KEY4,RESET: std_logic := '1';
 	--Outputs
   signal LED1,LED2: std_logic;
begin
   uut: JK_trigger PORT MAP (KEY1,KEY2,KEY3,KEY4,RESET,LED1,LED2);
   clk_process: process begin KEY3<='1'; wait for 50ns; KEY3<='0'; wait for 50ns; end process;
   reset_process: process 
   begin 
     reset<='1'; KEY4<='1'; wait for 10ns; 
     reset<='0'; wait for 10ns; 
     reset<='1'; KEY4<='0'; wait for 10ns;
     KEY4<='1'; wait;
   end process;
   tb_process: process
   begin
     wait for 100ns;
     KEY1<='0'; KEY2<='0'; WAIT FOR 100ns;
     KEY1<='0'; KEY2<='1'; WAIT FOR 100ns;
     KEY1<='0'; KEY2<='0'; WAIT FOR 100ns;
     KEY1<='1'; KEY2<='0'; WAIT FOR 100ns;
     KEY1<='1'; KEY2<='1'; WAIT FOR 100ns;
     KEY1<='0'; KEY2<='0'; WAIT FOR 100ns;
     KEY1<='1'; KEY2<='0'; WAIT FOR 100ns;
     KEY1<='0'; KEY2<='0'; WAIT FOR 100ns;
     KEY1<='0'; KEY2<='0'; WAIT;
   end process;
end Behavioral;
