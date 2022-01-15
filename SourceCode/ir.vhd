Library ieee;
Use ieee.std_logic_1164.all;
--------------------------
entity ir is
	port( 	
		clk : in std_logic;
		IR_in : in std_logic_vector(15 downto 0);  
		IRld : in std_logic;
		IR_out: out std_logic_vector(15 downto 0)
	);
end ir;
----------------------------------------------
architecture ir_arch of ir is
begin
process(clk, IRld)
begin
 IF clk'event and clk='1' and IRld='1' THEN
	 	IR_out <= IR_in;
 END IF;
END PROCESS;

end ir_arch;