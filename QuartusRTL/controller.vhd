library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.sys_definition.all;
----------------------------
entity controller is             	
  Generic (
    DATA_WIDTH : integer := 16;  -- Data Width
    ADDR_WIDTH : integer := 16   -- Address width
    );
   port (
         nReset : in STD_LOGIC; -- low active reset signal
			--start : in STD_LOGIC; -- high active Start: enable cpu
         clk : in STD_LOGIC;    -- Clock
         IRout: in STD_LOGIC_VECTOR (DATA_WIDTH -1 downto 0);
			ALUz: in STD_LOGIC;
			RFs, ALUs, Ms: out STD_LOGIC_VECTOR(1 downto 0);
			PCclr, PCld, PCinc: out STD_LOGIC;
			IRld: out STD_LOGIC;
			Mre, Mwe: out STD_LOGIC;
			RFwe, OPr1e, OPr2e: out STD_LOGIC;
			RFwa, OPr1a, OPr2a: out STD_LOGIC_VECTOR(3 downto 0)
        );                              
end controller;
--------------------------------
architecture fsm of controller is
-------------------------------------------		
signal opcode: STD_LOGIC_VECTOR(3 downto 0);
signal opr1: STD_LOGIC_VECTOR(3 downto 0);
signal opr2: STD_LOGIC_VECTOR(7 downto 0);

-- constants declared for ease of reading code				 
begin
opcode <= IRout(15 downto 12);
opr1 <= IRout(11 downto 8);
opr2 <= IRout(7 downto 0);
------------------------
 process(clk, nReset, opcode, opr1, opr2)
  begin 
   if(nReset = '0') THEN
	PCclr <= '1';
	PCld <= '0';
	PCinc <= '0';
	IRld <= '1';
	Mre <= '1';
	Mwe <= '0';
	RFwe <= '0';
	OPr1e <= '0';
	OPr2e <= '0';
	Ms <= "10";
   elsif rising_edge (clk) then 
   case opcode is
    when "0000" => --MOV1 MOV Rn, direct
	Ms <= "01";
	Mre <= '1';
	RFs <= "10";
	RFwa <= opr1;
	RFwe <= '1';
	PCclr <= '0';
    when "0001" => -- MOV2 MOV direct, Rn
	OPr1a <= opr1;
	OPr1e <= '1';
	Ms <= "01";
	Mwe <= '1';
	PCclr <= '0';
    when "0010" => --MOV3 MOV Rn, @Rm
	OPr1a <= opr1;
	OPr1e <= '1';
	OPr2a <= opr2(7 downto 4);
	OPr2e <= '1';
	Ms <= "00";
	Mwe <= '1';
	PCclr <= '0';
    when "0011" => --MOV4 MOV Rn, #immed
	RFs <= "01";
	RFwa <= opr1;
	RFwe <= '1';
	PCclr <= '0';
    when "0100" => -- ADD ADD Rn, Rm
	OPr1a <= opr1;
	OPr2a <= opr2(7 downto 4);
	OPr1e <= '1';
	OPr2e <= '1';
	ALUs <= "00";
	RFs <="00";
	RFwa <= opr1;
	RFwe <= '1';
	PCclr <= '0';
    when "0101" => --SUB SUB Rn, Rm
	OPr1a <= opr1;
	OPr2a <= opr2(7 downto 4);
	OPr1e <= '1';
	OPr2e <= '1';
	ALUs <= "01";
	RFs <="00";
	RFwa <= opr1;
	RFwe <= '1';
	PCclr <= '0';
    when "0110" => --JZ JZ  Rn, Addr
	OPr1a <= opr1;
	OPr1e <= '1';
	PCld <= ALUz;
	PCclr <= '0';
    when others =>
   end case;
   end if;
end process;
end fsm;