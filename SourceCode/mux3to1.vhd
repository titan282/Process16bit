library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.numeric_std.all ;
use IEEE.std_logic_unsigned.all;
use work.Sys_Definition.all;
----------------------------
ENTITY mux3to1 IS
   GENERIC ( DATA_WIDTH : integer := 16);
   PORT (A, B, C: IN  	std_logic_vector (DATA_WIDTH-1 downto 0);
        SEL : IN 	 std_logic_vector (1 downto 0);
        Z : OUT 	std_logic_vector (DATA_WIDTH-1 downto 0)
               );
END mux3to1;
------------------------------
ARCHITECTURE bev OF mux3to1 IS
BEGIN
proc_mux: PROCESS(A, B, C, SEL)
 BEGIN
  IF SEL = "00" THEN
	Z <= C;
  ELSIF SEL = "01" THEN
	Z <= B;
  ELSIF SEL = "10" THEN
	Z <= A;
  ELSE Z <= A; 
  END IF;
 END PROCESS proc_mux;
END bev;