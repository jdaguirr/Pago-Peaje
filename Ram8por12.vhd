library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity RAM8por12 is
port(clock, WE: in std_logic;
		Data: in std_logic_vector(11 downto 0);
		Address: in std_logic_vector(7 downto 0);
		Q: out std_logic_vector(11 downto 0));
end RAM8por12;

architecture comp of RAM8por12 is
type ram_type is array (255 downto 0) of std_logic_vector (11 downto 0);
signal memram: ram_type;
--signal temp: std_logic_vector(7 downto 0);
begin
process(clock)
begin
	if (clock'event and clock='1') then
		if WE='1' then
			memram(conv_integer(address)) <= Data;
		else
			Q <= memram(conv_integer(address));
		end if;
	end if;
end process;
end comp;