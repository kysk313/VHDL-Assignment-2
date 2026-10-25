--library and package
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--entity
--display = a b c d e f g dp
--dat : "000"=A, "001"=b, "010"=C, "011"=d, "100"=F, "101"=g
entity led_letter is
	port(
		en :in std_logic;
		dat :in std_logic_vector(2 downto 0);
		display :out std_logic_vector(7 downto 0)
	);
end entity led_letter;

--architecture
architecture bhv of led_letter is
begin
	process(en,dat)
	begin
		if en='0' then
			display <= "ZZZZZZZZ";
		else
			case dat is
				when "000" => display <= "11101110";	--A
				when "001" => display <= "00111110";	--b
				when "010" => display <= "10011100";	--C
				when "011" => display <= "01111010";	--d
				when "100" => display <= "10001110";	--F
				when "101" => display <= "11110110";	--g
				when others => display <= "00000000";
			end case;
		end if;
	end process;
end architecture bhv;
