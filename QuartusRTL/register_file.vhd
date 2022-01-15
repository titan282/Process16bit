library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
-------------------------
entity register_file is 
port (
 clk: in STD_LOGIC;
 --RFclr: in STD_LOGIC;
 RFwe, OPr1e, OPr2e: in STD_LOGIC;
 RFwa, OPr1a, OPr2a: in STD_LOGIC_VECTOR(3 downto 0);
 RFin: in STD_LOGIC_VECTOR(15 downto 0);
 OPr1, OPr2: out STD_LOGIC_VECTOR(15 downto 0)
);
end register_file;
-----------------------------------------------------
architecture register_file_arch of register_file is
 type reg_type is array(0 to 15) of STD_LOGIC_VECTOR(15 downto 0);
 signal reg_array: reg_type := (others=>(others => '0'));
 begin 
  process(clk, RFwe)
   begin
    if clk'event and clk='1' and RFwe ='1' then
	reg_array(to_integer(unsigned(RFwa))) <= RFin;
    end if;
  end process;
  --
  read_proc : process (OPr1e, OPr2e, reg_array, OPr1a, OPr2a)
	begin
		if OPr1e = '1' then
			OPr1 <= reg_array(to_integer(unsigned(OPr1a)));
		end if;
		if OPr2e = '1' then
			OPr2 <= reg_array(to_integer(unsigned(OPr2a)));
		end if;
	end process;
	--
end register_file_arch;