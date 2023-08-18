
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM is
    port(
		A: in std_logic_vector(15 downto 0);
		Dout: out std_logic_vector(31 downto 0)
	);
end entity ROM;

architecture behavioural of ROM is
	type mem_index is array(63 downto 0) of std_logic_vector(15 downto 0);
	signal mem: mem_index := (
	0 => "0000001011010110",
	1 => "0001000011001000",
	2 => "0001000010010000",
	3 => "0001001011101010",
	4 => "0010010001101000",
	OTHERS => (OTHERS => '1'));
signal addr: std_logic_vector(15 downto 0);

begin
	process (A, mem)
	begin	
		addr <= A;
	end process;

	Dout <= mem(to_integer(unsigned(addr))) & mem(to_integer(unsigned(addr)) + 1);
end architecture behavioural;