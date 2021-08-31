library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Sumador is
generic(m: integer:=4);
port(A, B: in std_logic_vector(m-1 downto 0);
		R: out std_logic_vector(m-1 downto 0));
end Sumador;

architecture arq of Sumador is
	begin
	R<=A+B;
end arq;