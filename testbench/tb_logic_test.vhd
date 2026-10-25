--testbench for logic_test : all 16 input combinations
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity tb_logic_test is
end entity tb_logic_test;

architecture sim of tb_logic_test is
	signal a,b,c,d,out1,out2 : std_logic;
begin
	uut : entity work.logic_test port map(a=>a, b=>b, c=>c, d=>d, out1=>out1, out2=>out2);

	process
	variable v : std_logic_vector(3 downto 0);
	begin
		for i in 0 to 15 loop
			v := conv_std_logic_vector(i, 4);
			a <= v(3); b <= v(2); c <= v(1); d <= v(0);
			wait for 10 ns;
			assert out1 = (v(3) and v(2) and v(1) and v(0)) report "out1 error at " & integer'image(i) severity error;
			assert out2 = (v(3) or v(2) or v(1) or v(0)) report "out2 error at " & integer'image(i) severity error;
		end loop;
		report "tb_logic_test finished";
		wait;
	end process;
end architecture sim;
