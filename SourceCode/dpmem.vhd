library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-------------------------------
entity dpmem is
  generic (
    DATA_WIDTH : integer := 16; -- Word Width
    ADDR_WIDTH : integer := 16  -- Address width
    );
--
  port (
			clk : in  std_logic;
			nReset : in  std_logic; -- Reset input
			addr : in  std_logic_vector(ADDR_WIDTH -1 downto 0); -- Address
			-- Writing Port
			Wen : in  std_logic; -- Write Enable
			Datain : in  std_logic_vector(DATA_WIDTH -1 downto 0) := (others => '0'); -- Input Data
			-- Reading Port    
			Ren : in std_logic;  -- Read Enable
			Dataout : out std_logic_vector(DATA_WIDTH -1 downto 0) -- Output data    
		 );
end dpmem;
----------------------------------- 
architecture dpmem_arch of dpmem is
-----------------------------------
type DATA_ARRAY is array (integer range <>) of std_logic_vector(DATA_WIDTH -1 downto 0); -- Memory Type
  signal  M : DATA_ARRAY(0 to (2**ADDR_WIDTH) -1) := (others => (others => '0'));  -- Memory model

  constant PM_Size : Integer := 18; --18
  constant PM : DATA_ARRAY(0 to PM_Size-1) := 
  (	
   --- Machine code
	X"0911", -- 0: Mov R9, 0x11  => R9 = M(0x11)
	X"1980", -- 1: Mov 0x80, R9 => M(0x80) = R9
	X"3210", -- 2: Mov R2, #0x10 => R2 = 0x10
	X"2290", -- 3: Mov R2, @R9 => M(R9) = R2
	X"7920", -- 4: ADD R9, R2  => R9 = R9 + R2  4920
	X"8920", -- 5: SUB R9, R2  => R9 = R9 - R2  5920
	X"9201", -- 6: JZ R2,1 
	-- for (int i = 10; i! = 0; i--) total += 1
	X"3000", -- 7: Start : 	Mov R0, #R0 // total = 0
	X"310A", -- 8: 		Mov R1, #0  // i = 10
	X"3201", -- 9: 		Mov R2, #1  // constant 1
	X"3300", -- 10: 	Mov R3, #0  // constant 0
	X"6110", -- 11: Loop : JZ R1, Next // Done if i = 0
	X"4010", -- 12: 		  ADD R0, R1  // total += i
	X"2090", -- 13: 		  Mov R0, @R9 // M(R9) = R0 = total
	X"5120", -- 14: 		  SUB R1, R2  // i--
	X"630B", -- 15: 		  JZ R3, Loop // 
	X"6307", -- 16: Next   JZ R3, Start// total += i
	X"0100" -- 17: Addr-table         // address of external 7_SEGMENT	
    );
-------------------------------------------------------
begin
  --  Read/Write process
  RW_Proc : process (clk, nReset)
  begin  
    if nReset = '0' then
          Dataout <= (others => '0');
          M(0 to PM_Size-1) <= PM; -- initialize program memory
    elsif (clk'event and clk = '1') then   -- rising clock edge
        if Wen = '1' then
			   M(conv_integer(addr)) <= Datain; -- ensure that data cant overwrite on program --// +PM_Size
        else
			   if Ren = '1' then
				    Dataout <= M(conv_integer(addr));
			   else
				Dataout <= (others => 'Z');
			end if;
		end if;
      end if;
  end process  RW_Proc;
  
end dpmem_arch;