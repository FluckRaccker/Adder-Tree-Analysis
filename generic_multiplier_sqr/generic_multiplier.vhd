library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity generic_multiplier is
    generic(
        n : integer := 512
    );
    port (
        a0 , a1 : in  unsigned(n-1 downto 0);
        sum : out unsigned(n -1 downto 0)
    );
end generic_multiplier;

architecture rtl of generic_multiplier is

signal sum_hold : unsigned(2*n -1 downto 0);

begin

	sum_hold <= a0 * a1;
	
	sum <= sum_hold(n -1 downto 0);

end rtl;
