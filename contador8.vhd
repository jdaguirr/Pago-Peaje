library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity contador8 is
port (clock, resetn, Ld, En: in std_logic;
		Ent: in std_logic_vector(7 downto 0);
		Q: out std_logic_vector(7 downto 0));
end contador8;

architecture desarrollo of contador8 is
signal temp: std_logic_vector(7 downto 0);
begin
process(En)
	begin
	if resetn='0' then temp<="00000000";
	elsif (clock'event and clock='1') then
		if (Ld='1' and En='1') then temp<=Ent;
			elsif En='1' then
				if temp="11111111" then temp<="00000000";
				else temp<=temp+1;
				end if;
		end if;
	end  if;
end process;
Q<=temp;
end desarrollo;