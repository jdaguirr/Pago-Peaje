library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity contador1 is
port (clock, resetn, Ld, En: in std_logic;
		Ent: in std_logic;
		Q: out std_logic);
end contador1;

architecture desarrollo of contador1 is
signal temp: std_logic;
begin
process(En)
	begin
	if resetn='0' then temp<='0';
	elsif (clock'event and clock='1') then
		if (Ld='1' and En='1') then temp<=Ent;
			elsif En='1' then
				if temp='1' then temp<='0';
				else temp<=not(temp);
				end if;
		end if;
	end  if;
end process;
Q<=temp;
end desarrollo;