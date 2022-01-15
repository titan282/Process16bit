library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.sys_definition.all;
----------------------------
entity datapath is
  Generic (
				DATA_WIDTH : integer := 16; -- Data Width
				ADDR_WIDTH : integer := 16  -- Address width
			  );
   port ( 
          --nReset : in STD_LOGIC;
          clk : in std_logic;
			 IR_out: in std_logic_vector(DATA_WIDTH -1 downto 0);
          Data_out: in std_logic_vector (DATA_WIDTH - 1 downto 0);
			 RFs_net : in std_logic_vector (1 downto 0);
			 RFwa_net, OPr1a_net, OPr2a_net : in std_logic_vector (3 downto 0);
			 RFwe_net, OPr1e_net, OPr2e_net: in std_logic;
			 
			 OPr2_out : buffer std_logic_vector (DATA_WIDTH -1 downto 0);
			 Data_in : buffer std_logic_vector(DATA_WIDTH - 1 downto 0);
			 ALUs_net : in std_logic_vector (1 downto 0);
			 ALUz_net : out std_logic;
			 ALUr_net : buffer std_logic_vector (DATA_WIDTH -1 downto 0)
        );
end datapath;
---------------------------------
architecture struct of datapath is
--signal ALUr_net : std_logic_vector (DATA_WIDTH - 1 downto 0);
signal OPr1_net : std_logic_vector (DATA_WIDTH - 1 downto 0);
signal RFin_net : std_logic_vector (DATA_WIDTH - 1 downto 0);
begin
-- write your code here
  -- mux3to1-------------
  MUX_U: mux3to1 port map
	(
		SEL => RFs_net,
		A => Data_out,
		B => IR_out,
		C => ALUr_net,
		Z => RFin_net
	);
  -- register file------------
  RF_U: register_file port map 
	(
		clk => clk,
		RFin => RFin_net,
		RFwa => RFwa_net,
		RFwe => RFwe_net,
		OPr1a => Opr1a_net,
		OPr1e => OPr1e_net,--
		OPr2a => OPr2a_net,
		OPr2e => OPr2e_net,--
		OPr2 => OPr2_out,
		OPr1 => Data_in
	);
  -- alu--------------
  ALU_U: alu port map 
	(
		Op1 => Data_in,
		Op2 => OPr2_out,
		ALUs => ALUs_net,
		ALUz =>ALUz_net,
		ALUr => ALUr_net
	);  
---------------
end struct;
