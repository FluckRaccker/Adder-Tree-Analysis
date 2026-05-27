library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux21 is
generic(n : integer := 32); 
port (	a,b: in unsigned(n/2-1 downto 0);
	sel: in std_logic;
	y: out unsigned(n/2-1 downto 0)
	);
end mux21;

architecture rtl of mux21 is
begin
y <=	a when sel = '0' else
	b;
end rtl;
