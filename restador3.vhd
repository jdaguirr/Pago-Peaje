library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity restador3 is
port(A, B: in std_logic_vector(2 downto 0);
		R: out std_logic_vector(2 downto 0));
end restador3;

architecture arq of restador3 is
signal temp: std_logic_vector(2 downto 0);
begin
temp<=A-B when (A>B) else "000";
R<=temp;
end arq;