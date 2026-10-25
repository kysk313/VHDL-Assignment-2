--library and package
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--entity
--display = a b c d e f g dp
entity count_led is
	port(
		en :in std_logic;
		vt :in std_logic_vector(13 downto 1);
		display :out std_logic_vector(7 downto 0)
	);
end entity count_led;

--architecture
architecture bhv of count_led is
begin
	process(en,vt)
	variable sum:integer range 0 to 15;
	begin
		sum:= 0;
		for i in 1 to 13 loop
			if (vt(i)='1') then
				sum:=sum+1;
			end if;
		end loop;
		if en='0' then
			display <= "ZZZZZZZZ";
		else
			case sum is
				when 0 => display <= "11111100";
				when 1 => display <= "01100000";
				when 2 => display <= "11011010";
				when 3 => display <= "11110010";
				when 4 => display <= "01100110";
				when 5 => display <= "10110110";
				when 6 => display <= "10111110";
				when 7 => display <= "11100000";
				when 8 => display <= "11111110";
				when 9 => display <= "11100110";
				when 10 => display <= "11101110";	--A
				when 11 => display <= "00111110";	--b
				when 12 => display <= "10011100";	--C
				when 13 => display <= "01111010";	--d
				when 14 => display <= "10011110";	--E
				when 15 => display <= "10001110";	--F
				when others => display <= "00000000";
			end case;
		end if;
	end process;
end architecture bhv;
