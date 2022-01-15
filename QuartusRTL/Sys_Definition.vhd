library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.numeric_std.all ;
use std.textio.all;
-------------------------
package Sys_Definition is
-- Constant for datapath
  Constant   DATA_WIDTH : integer   := 16; -- Word Width
  Constant   ADDR_WIDTH : integer   := 16 ; -- Address width

-- **************************************************************
--COMPONENTs
-- CPU
COMPONENT cpu
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
			 Mre, Mwe : buffer std_logic
			);
END COMPONENT;
-----------------------
-- Controller
component controller 
  Generic (
    DATA_WIDTH : integer := 16;     -- Data Width
    ADDR_WIDTH : integer := 16      -- Address width
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
			Mre,Mwe: out STD_LOGIC;
			RFwe, OPr1e, OPr2e: out STD_LOGIC;
			RFwa, OPr1a, OPr2a: out STD_LOGIC_VECTOR(3 downto 0)
        );  
end component;
-----------------------------
-- Datapath
component datapath
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
end component;
-------------------------------------
-- Dual port memory 
component dpmem 
   generic (
     DATA_WIDTH : integer := 16; -- Word Width
     ADDR_WIDTH : integer := 16  -- Address width
     );
 
   port (
     -- Writing
     Clk : in  std_logic; -- clock
     nReset : in  std_logic; -- Reset input
     addr : in  std_logic_vector(ADDR_WIDTH -1 downto 0);  --  Address
     -- Writing Port
     Wen : in  std_logic; -- Write Enable
     Datain : in  std_logic_vector(DATA_WIDTH -1 downto 0) := (others => '0');   -- Input Data
     -- Reading Port    
     Ren : in  std_logic; -- Read Enable
     Dataout : out std_logic_vector(DATA_WIDTH -1 downto 0) -- Output data    
     ); 
  end component;
------------------------------------------------------
-- mux3to1
Component mux3to1 
   Generic ( 
		    DATA_WIDTH : integer := 16);
   PORT (A, B, C: IN  std_logic_vector (DATA_WIDTH-1 downto 0);
        SEL : IN 	std_logic_vector (1 downto 0);
        Z : OUT std_logic_vector (DATA_WIDTH-1 downto 0)
               );
END Component;
-----------------
-- program counter
component pc is
	port( 	
		clk : in std_logic;
		PC_in : in std_logic_vector(15 downto 0);  
		PCclr: in std_logic; --Active low reset signl
		PCld : in std_logic;
		PCinc: in std_logic;
		PC_out:  out std_logic_vector(15 downto 0)
		);

end component;
-----------------
-- instruction register 
component ir is
	port( 	
		clk : in std_logic;
		IR_in : in std_logic_vector(15 downto 0);  
		IRld : in std_logic;
		IR_out: out std_logic_vector(15 downto 0)
	);

end component;
------------------
-- alu
component alu IS
  port (
	Op1, Op2: in STD_LOGIC_VECTOR(15 downto 0) ;
	ALUs: in STD_LOGIC_VECTOR(1 downto 0);
	ALUz: out STD_LOGIC;
	ALUr: out STD_LOGIC_VECTOR(15 downto 0)
	);
END component;
------------------
-- register file 
component register_file is 
port (
 clk: in STD_LOGIC;
 --RFclr: in STD_LOGIC;
 RFwe, OPr1e, OPr2e: in STD_LOGIC;
 RFwa, OPr1a, OPr2a: in STD_LOGIC_VECTOR(3 downto 0);
 RFin: in STD_LOGIC_VECTOR(15 downto 0);
 OPr1, OPr2: out STD_LOGIC_VECTOR(15 downto 0)
);
end component;
-----------------
-- control unit 
component control_unit is
   port ( 
          clk : in STD_LOGIC;
			 Rst : in std_logic;
			 Data_out : in std_logic_vector (DATA_WIDTH -1 downto 0);
			 ALUz_net : in std_logic;
			 OPr2_net : in std_logic_vector (DATA_WIDTH -1 downto 0);
			 ADDR : out std_logic_vector(DATA_WIDTH -1 downto 0);
			 IRout_net : buffer std_logic_vector (DATA_WIDTH -1 downto 0); 
			 IRout_16 : out std_logic_vector (DATA_WIDTH -1 downto 0);
			 -- X"00" + IR (7 downto 0)
			 RFs_net : out std_logic_vector (1 downto 0);
			 RFwa_net, OPr1a_net, OPr2a_net : out std_logic_vector (3 downto 0);
			 RFwe_net, OPr1e_net, OPr2e_net: out std_logic;
			 ALUs_net : out std_logic_vector (1 downto 0);
			 Mre_net, Mwe_net : out std_logic	 
			);
end component;
---------------------
end Sys_Definition;

PACKAGE BODY Sys_Definition IS
	-- package body declarations
END PACKAGE BODY Sys_Definition;