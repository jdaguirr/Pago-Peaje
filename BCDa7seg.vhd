library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity BCDa7seg is
	port(	N: in std_logic_vector(3 downto 0);
			S: out std_logic_vector(6 downto 0));
end entity;

architecture solucion of BCDa7seg is
	begin
	process(N)
	begin
		case N is 
			when "0000"=> S<="1111110";
			when "0001"=> S<="0110000";
			when "0010"=> S<="1101101";
			when "0011"=> S<="1111001";
			when "0100"=> S<="0110011";
			when "0101"=> S<="1011011";
			when "0110"=> S<="1011111";
			when "0111"=> S<="1110000";
			when "1000"=> S<="1111111";
			when "1001"=> S<="1111011";
			when others=> S<="0000001";
		end case;
	end process;
end solucion;