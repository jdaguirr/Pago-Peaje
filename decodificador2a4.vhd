library ieee;
use ieee.std_logic_1164.all;

entity decodificador2a4 is
	port(	N: in std_logic_vector(1 downto 0);
			S: out std_logic_vector(3 downto 0));
end entity;

architecture solucion of decodificador2a4 is
	begin
	process(N)
	begin
		case N is 
			when "00"=> S<="0001";
			when "01"=> S<="0010";
			when "10"=> S<="0100";
			when "11"=> S<="1000";
			when others=> S<="0001";
		end case;
	end process;
end solucion;