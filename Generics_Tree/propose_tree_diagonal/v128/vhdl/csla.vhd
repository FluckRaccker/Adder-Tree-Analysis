library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity csla is
generic(n : integer := 32); 
port (	a0,a1:	in unsigned(n/2-1 downto 0);
	cin: 	in std_logic;
	s:	out unsigned(n/2-1 downto 0)
	);
end csla;

architecture rtl of csla is

component mux21 is
generic(n : integer := 32);  
port (	a,b: in unsigned(n/2-1 downto 0);
	sel: in std_logic;
	y: out unsigned(n/2-1 downto 0)
	);
end component;

signal sum_c0: unsigned(n/2-1 downto 0);
signal sum_c1: unsigned(n/2 downto 0);

begin

sum_c0 <= a0 + a1;
sum_c1 <= (a0 & '1') + (a1 & '1');

umux: mux21	generic map(n)
		port map(sum_c0,sum_c1(n/2-1 downto 0),cin,s);

end rtl;
