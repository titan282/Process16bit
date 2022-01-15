Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Use ieee.std_logic_arith.all;
------------------------------
entity pc is
	port( 	
		clk : in std_logic;
		PC_in : in std_logic_vector(15 downto 0);  
		PCclr : in std_logic; --Active low reset signal
		PCld : in std_logic;
		PCinc : in std_logic;
		PC_out: out std_logic_vector(15 downto 0)
		);
end pc;
---------------------------
architecture pc_arch of pc is
	signal pc_temp: STD_LOGIC_VECTOR(15 downto 0):=x"0000";
begin
process(clk, PCclr)
begin
 IF PCclr='1' THEN
	pc_temp <=x"0000";
 ELSIF (clk'event and clk='1') THEN
	IF PCld='1' THEN
		pc_temp <= PC_in;
	ELSIF PCinc='1' THEN 	
		pc_temp <= pc_temp + x"0001";
	END IF;
 END IF;
END PROCESS;

PC_out <= pc_temp;	
end pc_arch; 