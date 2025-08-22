------------------------------------------------------------------
--Copyright 2025 Andrey S. Ionisyan (anserion@gmail.com)
--Licensed under the Apache License, Version 2.0 (the "License");
--you may not use this file except in compliance with the License.
--You may obtain a copy of the License at
--    http://www.apache.org/licenses/LICENSE-2.0
--Unless required by applicable law or agreed to in writing, software
--distributed under the License is distributed on an "AS IS" BASIS,
--WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--See the License for the specific language governing permissions and
--limitations under the License.
------------------------------------------------------------------

library IEEE; use IEEE.STD_LOGIC_1164.ALL;
library UNISIM; use UNISIM.VComponents.all;

entity JK_trigger is
    Port (KEY1,KEY2,KEY3,KEY4,RESET: in STD_LOGIC; --J, K, C, S, R inputs
          LED1, LED2: out STD_LOGIC);   -- Q, nQ outputs
end JK_trigger;

architecture RTL of JK_trigger is
component INV port(I:in std_logic; O:out std_logic); end component;
component OR2 port(I0,I1:in std_logic; O:out std_logic); end component;
component AND2 port(I0,I1:in std_logic; O:out std_logic); end component;
component NAND2 port(I0,I1:in std_logic; O:out std_logic); end component;
component NAND3 port(I0,I1,I2:in std_logic; O:out std_logic); end component;
signal j,k,c,r,s,q,nq: std_logic;
signal p1,p2,p3,p3r,p3rs,p3n,p4,p5,p6,p7,p7r,p7rs,p7n,p8,p8r,ns:std_logic;
begin
j<=KEY1; K<=KEY2; c<=KEY3; s<=KEY4; r<=RESET;
DD1:NAND3 port map(p7n,j,c,p1);
DD2:NAND3 port map(c,k,p7rs,p2);
DD3:NAND2 port map(p1,p4,p3);
DD4:NAND2 port map(p3,p2,p4);
DD5:NAND2 port map(p1,p3rs,p5);
DD6:NAND2 port map(p3n,p2,p6);
DD7:NAND2 port map(p5,p8,p7);
DD8:NAND2 port map(p7,p6,p8);
DD9:INV port map(p7rs,p7n);
DD10:INV port map(p3rs,p3n);
DD11:AND2 port map(p7,r,p7r);
DD12:AND2 port map(p3,r,p3r);
DD13:INV port map(s,ns);
DD14:OR2 port map(ns,p7r,p7rs);
DD15:OR2 port map(ns,p3r,p3rs);
q<=p7r; nq<=p7n;
LED1<=q; LED2<=nq;
end RTL;
