library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.sys_definition.all;
--------------------------- 
entity cpu is
   Generic (
    DATA_WIDTH : integer := 16; -- Data Width
    ADDR_WIDTH : integer := 16  -- Address width
    );
   port ( 
			 nReset : in STD_LOGIC; -- low active reset signal
          clk : in STD_LOGIC; -- Clock
	       Addr_out : buffer STD_LOGIC_VECTOR (ADDR_WIDTH -1 downto 0);
	       ALU_out : out STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
			 IR_out : buffer STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
			 Data_in_wire, Data_out_wire : buffer STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
			 Mre, Mwe : buffer std_logic
			);
end cpu;
----------------------------
architecture struc of cpu is
-----------------------------
signal IRout_16_net : std_logic_vector (DATA_WIDTH -1 downto 0);
signal OPr2_out_wire : std_logic_vector (DATA_WIDTH -1 downto 0);
signal RFs_wire, ALUs_wire : std_logic_vector (1 downto 0);
signal RFwa_wire, OPr1a_wire, OPr2a_wire : std_logic_vector (3 downto 0); 
signal RFwe_wire, OPr1e_wire, OPr2e_wire, ALUz_wire : std_logic;
--
begin
  --control unit--------------
  CTRL_U: control_unit port map
	(
		clk => clk,
		Rst => nReset,
		Data_out => Data_out_wire,
		ALUz_net => ALUz_wire,
		OPr2_net => OPr2_out_wire,
		ADDR => Addr_out,
		IRout_net => IR_out,
		IRout_16 => IRout_16_net,
		RFs_net => RFs_wire,
		RFwa_net => RFwa_wire,
		OPr1a_net => OPr1a_wire,
		OPr2a_net => OPr2a_wire,
		RFwe_net => RFwe_wire,
		OPr1e_net => OPr1e_wire,
		OPr2e_net => OPr2e_wire,
		ALUs_net => ALUs_wire,
		Mre_net => Mre,
		Mwe_net => Mwe
	);
  -- datapath ------------
  DP_U : datapath port map 
	(
		clk => clk,
		IR_out => IRout_16_net,
      Data_out => Data_out_wire,
	   RFs_net => RFs_wire,
	   RFwa_net => RFwa_wire,
		OPr1a_net => OPr1a_wire,
		OPr2a_net => OPr2a_wire,
		RFwe_net => RFwe_wire,
		OPr1e_net => OPr1e_wire,
		OPr2e_net => OPr2e_wire,			 
		OPr2_out => OPr2_out_wire,
		Data_in => Data_in_wire,
		ALUs_net => ALUs_wire,
		ALUz_net => ALUz_wire,
		ALUr_net => ALU_out
	);
  -- dual port memory --
  MEM_U: dpmem port map 
	(
		clk => clk,
		nReset => nReset,
		addr => Addr_out,
		Wen => Mwe,
		Datain => Data_in_wire,
		Ren => Mre,
		Dataout => Data_out_wire
	);  
end struc;