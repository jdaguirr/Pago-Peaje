library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ConvBCDaBinario is
	Port(	din_1,din_0: in std_logic_vector(3 downto 0);
	dout: out std_logic_vector(6 downto 0));
end ConvBCDaBinario;

architecture comportamiento of ConvBCDaBinario is

begin
 bdc2binary: process(din_1,din_0)
 constant complement: unsigned(2 downto 0):= (others => '0');
 variable suma: unsigned(6 downto 0):=(others =>'0');
 begin
 suma:=(others =>'0');
 suma:=shift_left(complement & unsigned(din_1),3)+shift_left(complement & unsigned(din_1),1)+ (complement & unsigned(din_0));
 dout<=std_logic_vector(suma);
end process;
end comportamiento;