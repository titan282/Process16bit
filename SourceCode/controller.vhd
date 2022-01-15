library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
----------------------------
entity controller is             	
  Generic (
    DATA_WIDTH : integer := 16;  -- Data Width
    ADDR_WIDTH : integer := 16   -- Address width
    );
   port (
         nReset : in STD_LOGIC; -- low active reset signal
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
type state is 
	(
		reset, fetch, decoder, loadIR, incPC,
		readMem_1, readMem_2, readMem_3, readMem_4, readMem_add,readMem_sub,readMem_jpz, readMem_or, readMEM_and, jmp,
		writeRF_1, writeRF_2, writeRF_3, writeRF_add, writeRF_sub, writeRF_jpz, writeRF_or, writeRF_and
	);
signal current_state : state;
-------------------------------------------		
signal opcode: STD_LOGIC_VECTOR(3 downto 0);
signal opr1: STD_LOGIC_VECTOR(3 downto 0);
signal opr2: STD_LOGIC_VECTOR(7 downto 0);
-------------------------------------------
begin
	 opcode <= IRout(15 downto 12);	
----------------------------------
state_proc : process (clk, nReset)
	begin
		if nReset = '0' then
			current_state <= reset;
		elsif (clk'event and clk = '1') then

	case current_state is
		when reset =>
		current_state <= fetch;
		when fetch => 
		current_state <= loadIR;
		when loadIR =>
		current_state <= incPC;
		when incPC =>
		current_state <= decoder;
		when decoder =>
			case opcode is 
				when "0000" =>
				current_state <= readMem_1;
				when "0001" => 
				current_state <= readMem_2;
				when "0010" => 
				current_state<= readMem_3;
				when "0011" =>
				current_state <= readMem_4;
				when "0100" => 
				current_state <= readMem_add;
				when "0101" => 
				current_state <= readMem_sub;
				when "0110" =>
				current_state <= readMem_jpz;
				when "0111" =>
				current_state <= readMem_or;
				when "1000" =>
				current_state <= readMem_and;
				when "1001" => 
				current_state <= jmp;
				when others =>
			end case;
			-----------------------------
			when readMem_1 =>
			current_state <= writeRF_1;
			when readMem_2 => 
			current_state <= writeRF_2;
			when readMem_3 =>
			current_state <= writeRF_3;
			when readMem_4 =>
			current_state <= fetch;
			when readMem_add =>
			current_state <= writeRF_add;
			when readMem_sub =>
			current_state <= writeRF_sub;
			when readMem_jpz =>
			current_state <= writeRF_jpz;
			when readMem_or =>
			current_state <= writeRF_or;
			when readMem_and => 
			current_state <= writeRF_and;
			when jmp =>
			current_state <= fetch;
			------------------------------
			when writeRF_1 =>
			current_state <= fetch;
			when writeRF_2 =>
			current_state <= fetch;
			when writeRF_3 =>
			current_state <= fetch;
			when writeRF_add =>
			current_state <= fetch;
			when writeRF_sub =>
			current_state <= fetch;
			when writeRF_jpz => 
			current_state <= fetch;
			when writeRF_or =>
			current_state <= fetch;
			when writeRF_and =>
			current_state <= fetch;
			when others =>
	end case;
 --------------------------------------
 case current_state is
 -------------
 when reset => 
	-- program counter control signal
	 PCclr <= '1';  -- active
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '0';
	 OPr1e <= '0';
	 OPr2e <= '0';
 when fetch =>
	-- select signal 
	 Ms <= "10";  --active
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '1'; --active 
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '0';
	 OPr1e <= '0';
	 OPr2e <= '0';
 when loadIR =>
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '1';-- active
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '0';
	 OPr1e <= '0';
	 OPr2e <= '0';
 when incPC =>
-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '1';--active
	-- instruction register control signal
	 IRld <= '0';--
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '0';
	 OPr1e <= '0';
	 OPr2e <= '0';
 when decoder =>
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '0';
	 OPr1e <= '0';
	 OPr2e <= '0';
	 ------------
	opr1 <= IRout(11 downto 8); --active
	opr2 <= IRout(7 downto 0); --active
 when readMem_1 =>
	-- select signal 
	 Ms <= "01"; --active
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '1'; --active
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '0';
	 OPr1e <= '0';
	 OPr2e <= '0';
 when writeRF_1 =>
	-- select signal 
	 RFs <= "10"; --active
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '1'; --active
	 OPr1e <= '0';
	 OPr2e <= '0';
	-- opr1
	 RFwa <= opr1; --active
	-------------
 when readMem_2 => 
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '0';
	 OPr1e <= '1';--active
	 OPr2e <= '0';
	-- opr
	 OPr1a <= opr1; --active
	---------------
 when writeRF_2 => 
	-- select signal 
	 Ms <= "01"; --active
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '1'; --active
	-- register file control signal 
	 RFwe <= '0';
	 OPr1e <= '0';
	 OPr2e <= '0'; 
	 --
 when readMem_3 => 
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';--
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '0';
	 OPr1e <= '1';--active
	 OPr2e <= '1';--active
	 --
	 OPr1a <= opr1; -- =rn
	 OPr2a <= opr2(7 downto 4); -- =rm
	 --
 when writeRF_3 => 
	-- select signal 
	 Ms <= "00"; --active
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '1';--active
	-- register file control signal 
	 RFwe <= '0';
	 OPr1e <= '0';
	 OPr2e <= '0';
	 --
 when readMem_4 => 
	-- select signal 
	 RFs <= "01"; --active
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '1';--active
	 OPr1e <= '0';
	 OPr2e <= '0';
	 --
	 RFwa <= opr1; -- =rn
when readMem_add => 
	-- select signal 
	 ALUs <= "00"; --active
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '0';
	 OPr1e <= '1';--active
	 OPr2e <= '1';--active
	 --
	 OPr1a <= opr1; -- =rn
	 OPr2a <= opr2(7 downto 4); -- =rm
when writeRF_add => 
	-- select signal 
	 RFs <= "00"; --active
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '1';--active
	 OPr1e <= '0';
	 OPr2e <= '0';
	 --
	 RFwa <= opr1; -- =rn
when readMem_sub => 
	-- select signal 
	 ALUs <= "01"; --active
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '0';
	 OPr1e <= '1';--active
	 OPr2e <= '1';--active
	 --
	 OPr1a <= opr1; --=rn
	 OPr2a <= opr2(7 downto 4); -- =rm
when writeRF_sub =>
	-- select signal 
	 RFs <= "00"; --active
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '1';--active
	 OPr1e <= '0';
	 OPr2e <= '0';
	 --
	 RFwa <= opr1; --active
when readMem_jpz => 
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '0';
	 OPr1e <= '1'; --active
	 OPr2e <= '0';
	 --
	 OPr1a <= opr1; -- =rn
when writeRF_jpz => 
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= ALUz;-- active
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '0';--
	 OPr1e <= '0';
	 OPr2e <= '0';
	 --
when readMem_and =>
	-- select signal 
	 ALUs <= "10"; --active
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '0';
	 OPr1e <= '1';--active
	 OPr2e <= '1';--active
	 --
	 OPr1a <= opr1; --active
	 OPr2a <= opr2(7 downto 4); --active
when writeRF_and =>
	-- select signal 
	 RFs <= "00"; --active
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '1';-- active
	 OPr1e <= '0';
	 OPr2e <= '0';
	 --
	 RFwa <= opr1; --active
when readMem_or =>
	-- select signal 
	 ALUs <= "11"; --active
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '0';
	 OPr1e <= '1';--active
	 OPr2e <= '1';--active
	 --
	 OPr1a <= opr1; --active
	 OPr2a <= opr2(7 downto 4); --active
when writeRF_or =>
	-- select signal 
	 RFs <= "00"; --active
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '0';
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '1';--active
	 OPr1e <= '0';
	 OPr2e <= '0';
	 --
	 RFwa <= opr1; --active
when jmp => 
	-- program counter control signal
	 PCclr <= '0';
	 PCld <= '1'; --active
	 PCinc <= '0';
	-- instruction register control signal
	 IRld <= '0';
	-- dual port memory signal 
	 Mre <= '0';
	 Mwe <= '0';
	-- register file control signal 
	 RFwe <= '0';
	 OPr1e <= '0';
	 OPr2e <= '0';
end case;
end if; 
end process;	 
end fsm;	