library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity restador8 is
port(A, B: in std_logic_vector(7 downto 0);
		R: out std_logic_vector(7 downto 0));
end restador8;

architecture arq of restador8 is
signal temp: std_logic_vector(7 downto 0);
begin
temp<=A-B when (A>B) else "00000000";
R<=temp;
end arq;