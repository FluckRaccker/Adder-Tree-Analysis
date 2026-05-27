
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum64xn is
    generic(
        n : integer := 128;
        h : integer := 6
    );
    port (
        a0 , a1 , a2 , a3 ,
        a4 , a5 , a6 , a7 ,
        a8 , a9 , a10, a11,
        a12, a13, a14, a15,
        a16, a17, a18, a19,
        a20, a21, a22, a23,
        a24, a25, a26, a27,
        a28, a29, a30, a31,
        a32, a33, a34, a35,
        a36, a37, a38, a39,
        a40, a41, a42, a43,
        a44, a45, a46, a47,
        a48, a49, a50, a51,
        a52, a53, a54, a55,
        a56, a57, a58, a59,
        a60, a61, a62, a63 : in  unsigned(n-1 downto 0);
        sum : out unsigned(n-1 downto 0)
    );
end sum64xn;

architecture rtl of sum64xn is

    constant M : integer := 64;

    type input_array_t is array (0 to M-1) of unsigned(n-1 downto 0);

    signal a_in    : input_array_t;
    signal a_shift : input_array_t;

    component tree_msb is
        generic(n : integer := 128);
        port (
            a0 , a1 , a2 , a3 ,
            a4 , a5 , a6 , a7 ,
            a8 , a9 , a10, a11,
            a12, a13, a14, a15,
            a16, a17, a18, a19,
            a20, a21, a22, a23,
            a24, a25, a26, a27,
            a28, a29, a30, a31,
            a32, a33, a34, a35,
            a36, a37, a38, a39,
            a40, a41, a42, a43,
            a44, a45, a46, a47,
            a48, a49, a50, a51,
            a52, a53, a54, a55,
            a56, a57, a58, a59,
            a60, a61, a62, a63 : in unsigned(n-1 downto 0);
            f5_1, f5_0 : out unsigned(n-1 downto 0);
            sum : out unsigned(n-1 downto 0)
        );
    end component;

    component tree_lsb is
        generic(n : integer := 128);
        port (
            a0 , a1 , a2 , a3 ,
            a4 , a5 , a6 , a7 ,
            a8 , a9 , a10, a11,
            a12, a13, a14, a15,
            a16, a17, a18, a19,
            a20, a21, a22, a23,
            a24, a25, a26, a27,
            a28, a29, a30, a31,
            a32, a33, a34, a35,
            a36, a37, a38, a39,
            a40, a41, a42, a43,
            a44, a45, a46, a47,
            a48, a49, a50, a51,
            a52, a53, a54, a55,
            a56, a57, a58, a59,
            a60, a61, a62, a63 : in unsigned(n-1 downto 0);
            sum : out unsigned(n+5 downto 0)
        );
    end component;

    --------------------------------------------------------------------------
    -- Saídas da árvore MSB
    --------------------------------------------------------------------------
    signal f5_0_msb, f5_1_msb : unsigned(n/2+h-1 downto 0);
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
         12 => a12,  13 => a13,  14 => a14,  15 => a15,
         16 => a16,  17 => a17,  18 => a18,  19 => a19,
         20 => a20,  21 => a21,  22 => a22,  23 => a23,
         24 => a24,  25 => a25,  26 => a26,  27 => a27,
         28 => a28,  29 => a29,  30 => a30,  31 => a31,
         32 => a32,  33 => a33,  34 => a34,  35 => a35,
         36 => a36,  37 => a37,  38 => a38,  39 => a39,
         40 => a40,  41 => a41,  42 => a42,  43 => a43,
         44 => a44,  45 => a45,  46 => a46,  47 => a47,
         48 => a48,  49 => a49,  50 => a50,  51 => a51,
         52 => a52,  53 => a53,  54 => a54,  55 => a55,
         56 => a56,  57 => a57,  58 => a58,  59 => a59,
         60 => a60,  61 => a61,  62 => a62,  63 => a63
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
            a16 => a_shift(16)(n-1 downto n/2-h),
            a17 => a_shift(17)(n-1 downto n/2-h),
            a18 => a_shift(18)(n-1 downto n/2-h),
            a19 => a_shift(19)(n-1 downto n/2-h),
            a20 => a_shift(20)(n-1 downto n/2-h),
            a21 => a_shift(21)(n-1 downto n/2-h),
            a22 => a_shift(22)(n-1 downto n/2-h),
            a23 => a_shift(23)(n-1 downto n/2-h),
            a24 => a_shift(24)(n-1 downto n/2-h),
            a25 => a_shift(25)(n-1 downto n/2-h),
            a26 => a_shift(26)(n-1 downto n/2-h),
            a27 => a_shift(27)(n-1 downto n/2-h),
            a28 => a_shift(28)(n-1 downto n/2-h),
            a29 => a_shift(29)(n-1 downto n/2-h),
            a30 => a_shift(30)(n-1 downto n/2-h),
            a31 => a_shift(31)(n-1 downto n/2-h),
            a32 => a_shift(32)(n-1 downto n/2-h),
            a33 => a_shift(33)(n-1 downto n/2-h),
            a34 => a_shift(34)(n-1 downto n/2-h),
            a35 => a_shift(35)(n-1 downto n/2-h),
            a36 => a_shift(36)(n-1 downto n/2-h),
            a37 => a_shift(37)(n-1 downto n/2-h),
            a38 => a_shift(38)(n-1 downto n/2-h),
            a39 => a_shift(39)(n-1 downto n/2-h),
            a40 => a_shift(40)(n-1 downto n/2-h),
            a41 => a_shift(41)(n-1 downto n/2-h),
            a42 => a_shift(42)(n-1 downto n/2-h),
            a43 => a_shift(43)(n-1 downto n/2-h),
            a44 => a_shift(44)(n-1 downto n/2-h),
            a45 => a_shift(45)(n-1 downto n/2-h),
            a46 => a_shift(46)(n-1 downto n/2-h),
            a47 => a_shift(47)(n-1 downto n/2-h),
            a48 => a_shift(48)(n-1 downto n/2-h),
            a49 => a_shift(49)(n-1 downto n/2-h),
            a50 => a_shift(50)(n-1 downto n/2-h),
            a51 => a_shift(51)(n-1 downto n/2-h),
            a52 => a_shift(52)(n-1 downto n/2-h),
            a53 => a_shift(53)(n-1 downto n/2-h),
            a54 => a_shift(54)(n-1 downto n/2-h),
            a55 => a_shift(55)(n-1 downto n/2-h),
            a56 => a_shift(56)(n-1 downto n/2-h),
            a57 => a_shift(57)(n-1 downto n/2-h),
            a58 => a_shift(58)(n-1 downto n/2-h),
            a59 => a_shift(59)(n-1 downto n/2-h),
            a60 => a_shift(60)(n-1 downto n/2-h),
            a61 => a_shift(61)(n-1 downto n/2-h),
            a62 => a_shift(62)(n-1 downto n/2-h),
            a63 => a_shift(63)(n-1 downto n/2-h),
            f5_0 => f5_0_msb,
            f5_1 => f5_1_msb,
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
            a16 => a_shift(16)(n/2-h-1 downto 0),
            a17 => a_shift(17)(n/2-h-1 downto 0),
            a18 => a_shift(18)(n/2-h-1 downto 0),
            a19 => a_shift(19)(n/2-h-1 downto 0),
            a20 => a_shift(20)(n/2-h-1 downto 0),
            a21 => a_shift(21)(n/2-h-1 downto 0),
            a22 => a_shift(22)(n/2-h-1 downto 0),
            a23 => a_shift(23)(n/2-h-1 downto 0),
            a24 => a_shift(24)(n/2-h-1 downto 0),
            a25 => a_shift(25)(n/2-h-1 downto 0),
            a26 => a_shift(26)(n/2-h-1 downto 0),
            a27 => a_shift(27)(n/2-h-1 downto 0),
            a28 => a_shift(28)(n/2-h-1 downto 0),
            a29 => a_shift(29)(n/2-h-1 downto 0),
            a30 => a_shift(30)(n/2-h-1 downto 0),
            a31 => a_shift(31)(n/2-h-1 downto 0),
            a32 => a_shift(32)(n/2-h-1 downto 0),
            a33 => a_shift(33)(n/2-h-1 downto 0),
            a34 => a_shift(34)(n/2-h-1 downto 0),
            a35 => a_shift(35)(n/2-h-1 downto 0),
            a36 => a_shift(36)(n/2-h-1 downto 0),
            a37 => a_shift(37)(n/2-h-1 downto 0),
            a38 => a_shift(38)(n/2-h-1 downto 0),
            a39 => a_shift(39)(n/2-h-1 downto 0),
            a40 => a_shift(40)(n/2-h-1 downto 0),
            a41 => a_shift(41)(n/2-h-1 downto 0),
            a42 => a_shift(42)(n/2-h-1 downto 0),
            a43 => a_shift(43)(n/2-h-1 downto 0),
            a44 => a_shift(44)(n/2-h-1 downto 0),
            a45 => a_shift(45)(n/2-h-1 downto 0),
            a46 => a_shift(46)(n/2-h-1 downto 0),
            a47 => a_shift(47)(n/2-h-1 downto 0),
            a48 => a_shift(48)(n/2-h-1 downto 0),
            a49 => a_shift(49)(n/2-h-1 downto 0),
            a50 => a_shift(50)(n/2-h-1 downto 0),
            a51 => a_shift(51)(n/2-h-1 downto 0),
            a52 => a_shift(52)(n/2-h-1 downto 0),
            a53 => a_shift(53)(n/2-h-1 downto 0),
            a54 => a_shift(54)(n/2-h-1 downto 0),
            a55 => a_shift(55)(n/2-h-1 downto 0),
            a56 => a_shift(56)(n/2-h-1 downto 0),
            a57 => a_shift(57)(n/2-h-1 downto 0),
            a58 => a_shift(58)(n/2-h-1 downto 0),
            a59 => a_shift(59)(n/2-h-1 downto 0),
            a60 => a_shift(60)(n/2-h-1 downto 0),
            a61 => a_shift(61)(n/2-h-1 downto 0),
            a62 => a_shift(62)(n/2-h-1 downto 0),
            a63 => a_shift(63)(n/2-h-1 downto 0),
            sum => sum_tree_lsb
        );

    --------------------------------------------------------------------------
    -- Carry entre LSB e MSB
    --------------------------------------------------------------------------
    csum <= ('0' & f5_0_msb(h-1 downto 0)) +
            ('0' & f5_1_msb(h-1 downto 0)) +
            ('0' & sum_tree_lsb(n/2-1 downto n/2-h));

    --------------------------------------------------------------------------
    -- CSLA
    --------------------------------------------------------------------------
    sum_c0 <= f5_0_msb(n/2+h-1 downto h) +
              f5_1_msb(n/2+h-1 downto h);

    sum_c1 <= ('0' & f5_0_msb(n/2+h-1 downto h)) +
              ('0' & f5_1_msb(n/2+h-1 downto h)) +
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
