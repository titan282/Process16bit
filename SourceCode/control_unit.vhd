library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.sys_definition.all;
---------------------------
entity control_unit is
 Generic (
				DATA_WIDTH : integer := 16; -- Data Width
				ADDR_WIDTH : integer := 16  -- Address width
			 );
   port ( 
          clk : in STD_LOGIC;
			 Rst : in std_logic;
			 Data_out : in std_logic_vector (DATA_WIDTH -1 downto 0);
			 ALUz_net : in std_logic;
			 OPr2_net : in std_logic_vector (DATA_WIDTH -1 downto 0);
			 ADDR : out std_logic_vector(DATA_WIDTH -1 downto 0);
			 IRout_net : buffer std_logic_vector (DATA_WIDTH -1 downto 0); 
			 IRout_16 : buffer std_logic_vector (DATA_WIDTH -1 downto 0);
			 -- X"00" + IR (7 downto 0)
			 RFs_net : out std_logic_vector (1 downto 0);
			 RFwa_net, OPr1a_net, OPr2a_net : out std_logic_vector (3 downto 0);
			 RFwe_net, OPr1e_net, OPr2e_net: out std_logic;
			 ALUs_net : out std_logic_vector (1 downto 0);
			 Mre_net, Mwe_net : out std_logic	 
			);
end entity;
---------------------------
architecture beh of control_unit is
signal Ms_net : std_logic_vector (1 downto 0);
--signal IRout_wire : std_logic_vector (DATA_WIDTH -1 downto 0);
signal IR_out_8 : std_logic_vector (7 downto 0);
signal PCClr_net, PCinc_net, PCld_net, IRld_net : std_logic;
signal PCout_net : std_logic_vector (DATA_WIDTH -1 downto 0);
begin
	-- inmmediate block
	IR_out_8 <= IRout_net (7 downto 0);
	IRout_16 (7 downto 0) <= IR_out_8;
	IRout_16 (DATA_WIDTH -1 downto 8) <= x"00";	
	---------------------------------------
	CONTROLLER_U : controller port map
	(
		clk => clk,
		nReset => Rst,
		IRout => IRout_net,
		ALUz => ALUz_net,
		RFs => RFs_net,
		ALUs => ALUs_net,
		Ms => Ms_net,
		PCclr => PCclr_net,
		PCld => PCld_net,
		PCinc => PCinc_net,
		IRld => IRld_net,
		Mre => Mre_net,
		Mwe => Mwe_net,
		RFwe => RFwe_net,
		OPr1e => OPr1e_net,
		OPr2e => OPr2e_net,
		RFwa => RFwa_net,
		OPr1a => OPr1a_net,
		OPr2a => OPr2a_net
	);
	IR_U : ir port map
	(
		clk => clk,
		IR_in => Data_out,
		IRld => IRld_net,
		IR_out => IRout_net
	);
	PC_U : pc port map
	(
		clk => clk,
		PC_in => IRout_16,
		PCclr => PCclr_net,
		PCinc => PCinc_net,
		PCld => PCld_net,
		PC_out => PCout_net
	);
	MUX_U: mux3to1 port map
	(
		SEL => Ms_net,
		A => PCout_net,
		B => IRout_16,
		C => OPr2_net,
		Z => ADDR
	);
end architecture;