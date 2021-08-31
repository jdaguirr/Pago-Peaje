library ieee;
use ieee.std_logic_1164.all;

entity sostenimiento4 is
port (clock, reset, En: in std_logic;
		Ent: in std_logic_vector(3 downto 0);
		Q: out std_logic_vector(3 downto 0));
end sostenimiento4;

architecture desarrollo of sostenimiento4 is
signal temp: std_logic_vector(3 downto 0);
begin
process(En)
	begin
	if reset='0' then temp<="0000";
	elsif (clock'event and clock='1') then
		if En='1' then temp<=Ent;
			else temp<=temp;
		end if;
	end  if;
end process;
Q<=temp;
end desarrollo;