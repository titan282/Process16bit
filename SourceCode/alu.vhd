library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_signed.all;
use IEEE.std_logic_arith.all;
use work.sys_definition.all;
----------------------------
ENTITY alu IS
  port (
	Op1, Op2: in STD_LOGIC_VECTOR(15 downto 0) ;
	ALUs: in STD_LOGIC_VECTOR(1 downto 0);
	ALUz: out STD_LOGIC; -- Zero flag
	ALUr: out STD_LOGIC_VECTOR(15 downto 0)
	);
END alu;
--------------------------------------------
ARCHITECTURE alu_arch of alu is
 signal result: STD_LOGIC_VECTOR(15 downto 0);
 begin
  process(ALUs, Op1, Op2)
   begin
    case ALUs is 
	when "00" =>
		result <= Op1 + Op2; --add
	when "01" =>
		result <= Op1 - Op2; --subtract
	when "10" =>
		result <= Op1 and Op2;
	when others =>
		result <= Op1 or Op2;
    end case;
   end process;
   ALUz <= '1' when Op1 = x"0000" else '0';
   ALUr <= result;
end alu_arch;