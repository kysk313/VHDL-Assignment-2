--testbench for mux8_1 : every data pattern (256) x every select value (8)
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity tb_mux8_1 is
end entity tb_mux8_1;

architecture sim of tb_mux8_1 is
	signal x : std_logic_vector(7 downto 0);	--x(0)=a ... x(7)=h
	signal ch : std_logic_vector(2 downto 0);
	signal data : std_logic;
begin
	uut : entity work.mux8_1 port map(a=>x(0), b=>x(1), c=>x(2), d=>x(3), e=>x(4), f=>x(5),
	                                  g=>x(6), h=>x(7), ch=>ch, data=>data);

	process
	begin
		for i in 0 to 255 loop
			for s in 0 to 7 loop
				x <= conv_std_logic_vector(i, 8);
				ch <= conv_std_logic_vector(s, 3);
				wait for 10 ns;
				assert data = x(s) report "mux error: x=" & integer'image(i) & " ch=" & integer'image(s) severity error;
			end loop;
		end loop;
		report "tb_mux8_1 finished";
		wait;
	end process;
end architecture sim;
