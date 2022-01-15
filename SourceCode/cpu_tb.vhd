library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use work.sys_definition.all;
use std.textio.all;
---------------------------- 
entity cpu_tb is
end cpu_tb;
---------------------------------- 
architecture behavior of cpu_tb is

	constant CLKTIME : time := 20 ns;
	
	signal nReset : STD_LOGIC; -- INPUT low active reset signal
   signal clk : STD_LOGIC; -- INPUT Clock
	signal Addr_out : STD_LOGIC_VECTOR (ADDR_WIDTH -1 downto 0);
	signal ALU_out : STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
	signal IR_out : STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
	signal Data_in_wire, Data_out_wire : STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
	signal Mre, Mwe : std_logic;
-----------------------------------------------------------
Begin
-- clock generation
--	clk <= not clk after CLKTIME/2;
-- UUT component
	dut : cpu
	generic map 
	(
    DATA_WIDTH => 16, -- Data Width
    ADDR_WIDTH => 16  -- Address width
    )	 
	 port map 
	 (
		nReset => nReset,
		clk => clk,
		Addr_out => Addr_out,
		ALU_out => ALU_out,
		IR_out => IR_out,
		Mre => Mre,
		Mwe => Mwe,
		Data_in_wire => Data_in_wire,
		Data_out_wire => Data_out_wire
	 );
 -- Read process
	clk_proc : process
	begin
		clk <= '0';
		wait for CLKTIME/2;
		clk <= '1';
		wait for CLKTIME/2;
	end process;
	--
	rst_proc : process
	begin
		nReset <= '0';
		wait for CLKTIME * 3;
		nReset <= '1';
		wait;
	end process;
End behavior;