library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum16xn is
    generic(
        n : integer := 4096;
        h : integer := 4
    );
    port (
        a0,  a1,  a2,  a3,
        a4,  a5,  a6,  a7,
        a8,  a9,  a10, a11,
        a12, a13, a14, a15 : in  unsigned(n-1 downto 0);
        sum                 : out unsigned(n-1 downto 0)
    );
end sum16xn;

architecture rtl of sum16xn is

    component tree_msb is
        generic(n : integer := 4096);
        port (
            a0,  a1,  a2,  a3,
            a4,  a5,  a6,  a7,
            a8,  a9,  a10, a11,
            a12, a13, a14, a15 : in unsigned(n-1 downto 0);
            f3_1, f3_0         : out unsigned(n-1 downto 0);
            sum                : out unsigned(n-1 downto 0)
        );
    end component;

    component tree_lsb is
        generic(n : integer := 4096);
        port (
            a0,  a1,  a2,  a3,
            a4,  a5,  a6,  a7,
            a8,  a9,  a10, a11,
            a12, a13, a14, a15 : in unsigned(n-1 downto 0);
            sum                 : out unsigned(n+3 downto 0)
        );
    end component;


	-- saídas da árvore MSB
	signal f3_0_msb, f3_1_msb : unsigned(n/2+h-1 downto 0);
	signal sum_tree_msb       : unsigned(n/2+h-1 downto 0);

	-- saída da árvore LSB
	signal sum_tree_lsb       : unsigned(n/2-h+3 downto 0);

	-- carry parcial entre ramos MSB
	signal csum     : unsigned(h downto 0);

	signal sum_msb            : unsigned(n/2-1 downto 0);

	signal sum_c0: unsigned(n/2-1 downto 0);
	signal sum_c1: unsigned(n/2 downto 0);


begin

    --------------------------------------------------------------------------
    -- Árvore MSB
    --------------------------------------------------------------------------
    u_tree_msb : tree_msb
        generic map(
            n => n/2 + h
        )
        port map(
            a0  => a0 (n-1 downto n/2-h),
            a1  => a1 (n-1 downto n/2-h),
            a2  => a2 (n-1 downto n/2-h),
            a3  => a3 (n-1 downto n/2-h),
            a4  => a4 (n-1 downto n/2-h),
            a5  => a5 (n-1 downto n/2-h),
            a6  => a6 (n-1 downto n/2-h),
            a7  => a7 (n-1 downto n/2-h),
            a8  => a8 (n-1 downto n/2-h),
            a9  => a9 (n-1 downto n/2-h),
            a10 => a10(n-1 downto n/2-h),
            a11 => a11(n-1 downto n/2-h),
            a12 => a12(n-1 downto n/2-h),
            a13 => a13(n-1 downto n/2-h),
            a14 => a14(n-1 downto n/2-h),
            a15 => a15(n-1 downto n/2-h),
            f3_0 => f3_0_msb,
            f3_1 => f3_1_msb,
            sum  => sum_tree_msb
        );

    --------------------------------------------------------------------------
    -- Árvore LSB
    --------------------------------------------------------------------------
    u_tree_lsb : tree_lsb
        generic map(
            n => n/2 - h
        )
        port map(
            a0  => a0 (n/2-h-1 downto 0),
            a1  => a1 (n/2-h-1 downto 0),
            a2  => a2 (n/2-h-1 downto 0),
            a3  => a3 (n/2-h-1 downto 0),
            a4  => a4 (n/2-h-1 downto 0),
            a5  => a5 (n/2-h-1 downto 0),
            a6  => a6 (n/2-h-1 downto 0),
            a7  => a7 (n/2-h-1 downto 0),
            a8  => a8 (n/2-h-1 downto 0),
            a9  => a9 (n/2-h-1 downto 0),
            a10 => a10(n/2-h-1 downto 0),
            a11 => a11(n/2-h-1 downto 0),
            a12 => a12(n/2-h-1 downto 0),
            a13 => a13(n/2-h-1 downto 0),
            a14 => a14(n/2-h-1 downto 0),
            a15 => a15(n/2-h-1 downto 0),
            sum => sum_tree_lsb
        );

    --------------------------------------------------------------------------
    -- Carry entre LSB e MSB
    --------------------------------------------------------------------------

	  csum <= ('0' & f3_0_msb(h-1 downto 0)) +
			('0' & f3_1_msb(h-1 downto 0)) +
			('0' & sum_tree_lsb(n/2-1 downto n/2-h));

    --------------------------------------------------------------------------
    -- CSLA
    --------------------------------------------------------------------------


		sum_c0 <= f3_0_msb(n/2+h-1 downto h) + f3_1_msb(n/2+h-1 downto h);
		sum_c1 <= (f3_0_msb(n/2+h-1 downto h) & '1') + (f3_1_msb(n/2+h-1 downto h) & '1');

    --------------------------------------------------------------------------
    -- MUX
    --------------------------------------------------------------------------
		sum_msb <=	sum_c0 when csum(h) = '0' else sum_c1(n/2-1 downto 0);
		
    --------------------------------------------------------------------------
    -- Soma final
    --------------------------------------------------------------------------
    sum <= sum_msb & csum(h-1 downto 0) & sum_tree_lsb(n/2-h-1 downto 0);

end rtl;