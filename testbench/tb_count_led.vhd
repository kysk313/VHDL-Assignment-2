--testbench for count_led : all 8192 vt patterns with en='1' and en='0'
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity tb_count_led is
end entity tb_count_led;

architecture sim of tb_count_led is
	type table is array (0 to 15) of std_logic_vector(7 downto 0);
	constant EXPECTED : table := (
		"11111100", "01100000", "11011010", "11110010",	--0 1 2 3
		"01100110", "10110110", "10111110", "11100000",	--4 5 6 7
		"11111110", "11100110", "11101110", "00111110",	--8 9 A b
		"10011100", "01111010", "10011110", "10001110");	--C d E F
	signal en : std_logic;
	signal vt : std_logic_vector(13 downto 1);
	signal display : std_logic_vector(7 downto 0);

	function ones(x : std_logic_vector) return integer is
		variable n : integer := 0;
	begin
		for i in x'range loop
			if x(i) = '1' then n := n + 1; end if;
		end loop;
		return n;
	end function;
begin
	uut : entity work.count_led port map(en=>en, vt=>vt, display=>display);

	process
	variable p : std_logic_vector(13 downto 1);
	begin
		for e in 0 to 1 loop
			for i in 0 to 8191 loop
				p := conv_std_logic_vector(i, 13);
				vt <= p;
				if e = 1 then en <= '1'; else en <= '0'; end if;
				wait for 10 ns;
				if e = 1 then
					assert display = EXPECTED(ones(p)) report "display error at vt=" & integer'image(i) severity error;
				else
					assert display = "ZZZZZZZZ" report "display not off at vt=" & integer'image(i) severity error;
				end if;
			end loop;
		end loop;
		report "tb_count_led finished";
		wait;
	end process;
end architecture sim;
