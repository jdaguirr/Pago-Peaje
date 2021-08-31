library ieee;
use ieee.std_logic_1164.all;

entity comparador is
generic(m: integer:=4);
port(A, B: in std_logic_vector(m-1 downto 0);
		AmayorB, AigualB, AmenorB: out std_logic);
end comparador;

architecture solve of comparador is
begin
AigualB<='1' when A=B else '0';
AmenorB<='1' when A<B else '0';
AmayorB<='1' when A>B else '0';
end solve;