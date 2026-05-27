
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum16xn is
    generic(
        n : integer := 32;
        h : integer := 4
    );
    port (
        a0 , a1 , a2 , a3 ,
        a4 , a5 , a6 , a7 ,
        a8 , a9 , a10, a11,
        a12, a13, a14, a15 : in  unsigned(n-1 downto 0);
        sum : out unsigned(n-1 downto 0)
    );
end sum16xn;

architecture rtl of sum16xn is

    constant M : integer := 16;

    type input_array_t is array (0 to M-1) of unsigned(n-1 downto 0);

    signal a_in    : input_array_t;
    signal a_shift : input_array_t;

    component tree_msb is
        generic(n : integer := 32);
        port (
            a0 , a1 , a2 , a3 ,
            a4 , a5 , a6 , a7 ,
            a8 , a9 , a10, a11,
            a12, a13, a14, a15 : in unsigned(n-1 downto 0);
            f3_1, f3_0 : out unsigned(n-1 downto 0);
            sum : out unsigned(n-1 downto 0)
        );
    end component;

    component tree_lsb is
        generic(n : integer := 32);
        port (
            a0 , a1 , a2 , a3 ,
            a4 , a5 , a6 , a7 ,
            a8 , a9 , a10, a11,
            a12, a13, a14, a15 : in unsigned(n-1 downto 0);
            sum : out unsigned(n+3 downto 0)
        );
    end component;

    --------------------------------------------------------------------------
    -- Saídas da árvore MSB
    --------------------------------------------------------------------------
    signal f3_0_msb, f3_1_msb : unsigned(n/2+h-1 downto 0);
    signal sum_tree_msb : unsigned(n/2+h-1 downto 0);

    --------------------------------------------------------------------------
    -- Saída da árvore LSB
    --------------------------------------------------------------------------
    signal sum_tree_lsb : unsigned(n/2-1 downto 0);

    --------------------------------------------------------------------------
    -- Carry parcial entre LSB e MSB
    --------------------------------------------------------------------------
    signal csum : unsigned(h downto 0);

    --------------------------------------------------------------------------
    -- Sinais do CSLA
    --------------------------------------------------------------------------
    signal sum_msb : unsigned(n/2-1 downto 0);

    signal sum_c0 : unsigned(n/2-1 downto 0);
    signal sum_c1 : unsigned(n/2 downto 0);

begin

    --------------------------------------------------------------------------
    -- Vetoriza as entradas originais
    --------------------------------------------------------------------------
    a_in <= (
          0 => a0,   1 => a1,   2 => a2,   3 => a3,
          4 => a4,   5 => a5,   6 => a6,   7 => a7,
          8 => a8,   9 => a9,  10 => a10,  11 => a11,
         12 => a12,  13 => a13,  14 => a14,  15 => a15
    );

    --------------------------------------------------------------------------
    -- Deslocamento diagonal feito no TOP
    --
    -- a_shift(0)   = a0
    -- a_shift(1)   = a1 sll 1
    -- a_shift(2)   = a2 sll 2
    -- ...
    -- a_shift(M-1) = a(M-1) sll M-1
    --
    -- Como a_shift tem n bits, a soma final fica truncada em n bits.
    --------------------------------------------------------------------------
    gen_shift : for i in 0 to M-1 generate
        a_shift(i) <= shift_left(a_in(i), i);
    end generate;

    --------------------------------------------------------------------------
    -- Árvore MSB original
    -- Recebe a parte alta das entradas ja deslocadas.
    --------------------------------------------------------------------------
    u_tree_msb : tree_msb
        generic map(
            n => n/2 + h
        )
        port map(
            a0  => a_shift(0)(n-1 downto n/2-h),
            a1  => a_shift(1)(n-1 downto n/2-h),
            a2  => a_shift(2)(n-1 downto n/2-h),
            a3  => a_shift(3)(n-1 downto n/2-h),
            a4  => a_shift(4)(n-1 downto n/2-h),
            a5  => a_shift(5)(n-1 downto n/2-h),
            a6  => a_shift(6)(n-1 downto n/2-h),
            a7  => a_shift(7)(n-1 downto n/2-h),
            a8  => a_shift(8)(n-1 downto n/2-h),
            a9  => a_shift(9)(n-1 downto n/2-h),
            a10 => a_shift(10)(n-1 downto n/2-h),
            a11 => a_shift(11)(n-1 downto n/2-h),
            a12 => a_shift(12)(n-1 downto n/2-h),
            a13 => a_shift(13)(n-1 downto n/2-h),
            a14 => a_shift(14)(n-1 downto n/2-h),
            a15 => a_shift(15)(n-1 downto n/2-h),
            f3_0 => f3_0_msb,
            f3_1 => f3_1_msb,
            sum => sum_tree_msb
        );

    --------------------------------------------------------------------------
    -- Árvore LSB original
    -- Recebe a parte baixa das entradas ja deslocadas.
    --------------------------------------------------------------------------
    u_tree_lsb : tree_lsb
        generic map(
            n => n/2 - h
        )
        port map(
            a0  => a_shift(0)(n/2-h-1 downto 0),
            a1  => a_shift(1)(n/2-h-1 downto 0),
            a2  => a_shift(2)(n/2-h-1 downto 0),
            a3  => a_shift(3)(n/2-h-1 downto 0),
            a4  => a_shift(4)(n/2-h-1 downto 0),
            a5  => a_shift(5)(n/2-h-1 downto 0),
            a6  => a_shift(6)(n/2-h-1 downto 0),
            a7  => a_shift(7)(n/2-h-1 downto 0),
            a8  => a_shift(8)(n/2-h-1 downto 0),
            a9  => a_shift(9)(n/2-h-1 downto 0),
            a10 => a_shift(10)(n/2-h-1 downto 0),
            a11 => a_shift(11)(n/2-h-1 downto 0),
            a12 => a_shift(12)(n/2-h-1 downto 0),
            a13 => a_shift(13)(n/2-h-1 downto 0),
            a14 => a_shift(14)(n/2-h-1 downto 0),
            a15 => a_shift(15)(n/2-h-1 downto 0),
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
    sum_c0 <= f3_0_msb(n/2+h-1 downto h) +
              f3_1_msb(n/2+h-1 downto h);

    sum_c1 <= ('0' & f3_0_msb(n/2+h-1 downto h)) +
              ('0' & f3_1_msb(n/2+h-1 downto h)) +
              to_unsigned(1, n/2+1);

    --------------------------------------------------------------------------
    -- MUX
    --------------------------------------------------------------------------
    sum_msb <= sum_c0 when csum(h) = '0' else sum_c1(n/2-1 downto 0);

    --------------------------------------------------------------------------
    -- Soma final
    --------------------------------------------------------------------------
    sum <= sum_msb &
           csum(h-1 downto 0) &
           sum_tree_lsb(n/2-h-1 downto 0);

end rtl;
