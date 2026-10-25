--testbench for vote25
--  2^25 inputs are too many, so it applies
--  (1) k votes for k = 0..25, packed at the low end and at the high end
--  (2) 2000 pseudo-random patterns (LFSR), each checked against a reference count
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity tb_vote25 is
end entity tb_vote25;

architecture sim of tb_vote25 is
	signal vt : std_logic_vector(25 downto 1);
	signal result : std_logic;

	function ones(x : std_logic_vector) return integer is
		variable n : integer := 0;
	begin
		for i in x'range loop
			if x(i) = '1' then n := n + 1; end if;
		end loop;
		return n;
	end function;
begin
	uut : entity work.vote25 port map(vt=>vt, result=>result);

	process
	variable p : std_logic_vector(25 downto 1);
	variable lfsr : std_logic_vector(31 downto 0) := x"ACE12468";
	variable expect : std_logic;
	begin
		for k in 0 to 25 loop
			for side in 0 to 1 loop
				p := (others => '0');
				for i in 1 to k loop
					if side = 0 then p(i) := '1'; else p(26 - i) := '1'; end if;
				end loop;
				vt <= p;
				wait for 10 ns;
				if k >= 13 then expect := '1'; else expect := '0'; end if;
				assert result = expect report "vote error with " & integer'image(k) & " votes" severity error;
			end loop;
		end loop;

		for t in 1 to 2000 loop
			for s in 1 to 25 loop	--32-bit Galois LFSR
				if lfsr(0) = '1' then
					lfsr := ('0' & lfsr(31 downto 1)) xor x"80200003";
				else
					lfsr := '0' & lfsr(31 downto 1);
				end if;
			end loop;
			vt <= lfsr(24 downto 0);
			wait for 10 ns;
			if ones(lfsr(24 downto 0)) >= 13 then expect := '1'; else expect := '0'; end if;
			assert result = expect report "vote error on random pattern #" & integer'image(t) severity error;
		end loop;
		report "tb_vote25 finished";
		wait;
	end process;
end architecture sim;
