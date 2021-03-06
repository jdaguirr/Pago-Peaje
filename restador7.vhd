library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity restador7 is
port(A, B: in std_logic_vector(6 downto 0);
		R: out std_logic_vector(6 downto 0));
end restador7;

architecture arq of restador7 is
signal temp: std_logic_vector(6 downto 0);
begin
temp<=A-B when (A>B) else "0000000";
R<=temp;
end arq;