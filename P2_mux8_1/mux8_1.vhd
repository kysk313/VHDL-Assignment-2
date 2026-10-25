--library and package
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--entity
entity mux8_1 is
	port(
		a,b,c,d,e,f,g,h :in std_logic;
		ch :in std_logic_vector(2 downto 0);
		data :out std_logic
	);
end entity mux8_1;

--architecture
architecture bhv of mux8_1 is
begin
	process(a,b,c,d,e,f,g,h,ch)
	begin
		case ch is
			when "000" => data <= a;
			when "001" => data <= b;
			when "010" => data <= c;
			when "011" => data <= d;
			when "100" => data <= e;
			when "101" => data <= f;
			when "110" => data <= g;
			when "111" => data <= h;
			when others => data <= '0';
		end case;
	end process;
end architecture bhv;
