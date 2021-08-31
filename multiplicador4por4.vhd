library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Multiplicador4por4 is
	port(a,b: in std_logic_vector(3 downto 0);
			p: out std_logic_vector(7 downto 0));
end entity;

architecture producto4 of Multiplicador4por4 is
	begin
	p<= (a*b);
end producto4;