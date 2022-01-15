library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use work.sys_definition.all;
use std.textio.all;
------------------ 
entity dpmem_tb is
end dpmem_tb;
-------------------------------------
architecture behavior of dpmem_tb is
  Constant   CLKTIME : time := 20 ns;
   
  signal clk : std_logic := '0';
  signal nReset : std_logic := '0';
  signal addr : std_logic_vector( ADDR_WIDTH-1 downto 0);
  signal  wen  : std_logic;
  signal  datain : std_logic_vector(DATA_WIDTH -1 downto 0); 
  signal  ren : std_logic;
  signal dataout : std_logic_vector(DATA_WIDTH -1 downto 0);
------------------------------------------------------------- 
begin 
-- Clock generation 
  clk <= not clk after CLKTIME/2;  
-- UUT componenet
  dut:  dpmem
    generic map
    (
      DATA_WIDTH     => 16,
      ADDR_WIDTH => 16
      )    
    port map (       
      clk      => clk,
      nReset   => nReset,
      addr     => addr,
      Wen       => wen,
      Datain    => datain,     
      Ren       => ren,      
      Dataout   => dataout     
      ); 
-- Read process
  stimuli_proc :  process
  Begin
      -- Reset generation 
        nReset  <= '0'; REn <= '0'; WEn <= '0'; Addr <= (OTHERS => '0');
        wait for  50 ns;                                         
        nReset  <= '1';
        wait for  10 ns;
        
        Ren <= '1'; -- read enable at address 0
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
        Addr <= X"0001";  Ren <= '1'; -- read enable at address 1
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
        
        Addr <= X"0000";  Datain <= X"000E"; Wen <= '1'; -- write enable at address 0
        wait for  20 ns;  Wen <= '0';  wait for  10 ns;
        Addr <= X"0001";  Datain <= X"000F"; Wen <= '1'; -- write enable at address 1
        wait for  20 ns;  Wen <= '0';  wait for  10 ns;
        
        Addr <= X"0000";  Ren <= '1'; -- read enable at address 0
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
        Addr <= X"0001";  Ren <= '1'; -- read enable at address 1
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;  
        Addr <= X"0002";  Ren <= '1'; -- read enable at address 2
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
        Addr <= X"0003";  Ren <= '1'; -- read enable at address 3
        wait for  20 ns;  Ren <= '0';  wait for  10 ns; 
		  Addr <= X"0004";  Ren <= '1'; -- read enable at address 4
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
		  Addr <= X"0005";  Ren <= '1'; -- read enable at address 5
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
		  Addr <= X"0006";  Ren <= '1'; -- read enable at address 6
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
		  Addr <= X"0007";  Ren <= '1'; -- read enable at address 7
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
		  Addr <= X"0008";  Ren <= '1'; -- read enable at address 8
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
		  Addr <= X"0009";  Ren <= '1'; -- read enable at address 9
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
		  Addr <= X"000A";  Ren <= '1'; -- read enable at address 10
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
		  Addr <= X"000B";  Ren <= '1'; -- read enable at address 11
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
		  Addr <= X"000C";  Ren <= '1'; -- read enable at address 12
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
		  Addr <= X"000D";  Ren <= '1'; -- read enable at address 13
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
		  Addr <= X"000E";  Ren <= '1'; -- read enable at address 14
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
		  Addr <= X"000F";  Ren <= '1'; -- read enable at address 15
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
		  Addr <= X"0010";  Ren <= '1'; -- read enable at address 16
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
		  Addr <= X"0011";  Ren <= '1'; -- read enable at address 17
        wait for  20 ns;  Ren <= '0';  wait for  10 ns;
  end process stimuli_proc;
end behavior;