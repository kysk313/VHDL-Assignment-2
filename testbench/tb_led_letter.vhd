--testbench for led_letter : all 8 codes with en='1', plus en='0'
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity tb_led_letter is
end entity tb_led_letter;

architecture sim of tb_led_letter is
	type table is array (0 to 7) of std_logic_vector(7 downto 0);
	constant EXPECTED : table := ("11101110", "00111110", "10011100", "01111010",	--A b C d
	                              "10001110", "11110110", "00000000", "00000000");	--F g - -
	signal en : std_logic;
	signal dat : std_logic_vector(2 downto 0);
	signal display : std_logic_vector(7 downto 0);
begin
	uut : entity work.led_letter port map(en=>en, dat=>dat, display=>display);

	process
	begin
		for i in 0 to 7 loop
			dat <= conv_std_logic_vector(i, 3);
			en <= '1';
			wait for 10 ns;
			assert display = EXPECTED(i) report "display error at dat=" & integer'image(i) severity error;
			en <= '0';
			wait for 10 ns;
			assert display = "ZZZZZZZZ" report "display not off at dat=" & integer'image(i) severity error;
		end loop;
		report "tb_led_letter finished";
		wait;
	end process;
end architecture sim;
