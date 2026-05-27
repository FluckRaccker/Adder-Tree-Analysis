
    library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

    entity sum64xn is
        generic(
            n : integer := 128;
            h : integer := 6
        );
        port (
            a0  : in  unsigned(n-1 downto 0);
            a1  : in  unsigned(n-1 downto 0);
            sum : out unsigned(2*n-1 downto 0)
        );
    end sum64xn;

    architecture rtl of sum64xn is

        constant M : integer := 64;
        constant W : integer := 2*n;

        type input_array_t is array (0 to M-1) of unsigned(W-1 downto 0);

        signal pp      : input_array_t;
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

        signal f5_0_msb, f5_1_msb : unsigned(W/2+h-1 downto 0);
        signal sum_tree_msb : unsigned(W/2+h-1 downto 0);

        signal sum_tree_lsb : unsigned(W/2-1 downto 0);

        signal csum : unsigned(h downto 0);

        signal sum_msb : unsigned(W/2-1 downto 0);

        signal sum_c0 : unsigned(W/2-1 downto 0);
        signal sum_c1 : unsigned(W/2 downto 0);

    begin

        --------------------------------------------------------------------------
        -- Produtos parciais por AND bit a bit, estendidos para 2n bits
        --
        -- pp(i)(j) = a0(j) AND a1(i), para j = 0 até n-1
        -- pp(i)(j) = 0,                para j = n até 2n-1
        --
        -- Para M = n:
        --   gera o produto completo n x n -> 2n.
        --
        -- Se n > M:
        --   usa apenas a1(0) até a1(M-1).
        --------------------------------------------------------------------------
        gen_pp_i : for i in 0 to M-1 generate

            gen_pp_low : for j in 0 to n-1 generate
                pp(i)(j) <= a0(j) and a1(i);
            end generate;

            gen_pp_high : for j in n to W-1 generate
                pp(i)(j) <= '0';
            end generate;

        end generate;

        --------------------------------------------------------------------------
        -- Deslocamento diagonal com largura 2n
        --------------------------------------------------------------------------
        gen_shift : for i in 0 to M-1 generate
            a_shift(i) <= shift_left(pp(i), i);
        end generate;

        --------------------------------------------------------------------------
        -- Árvore MSB original
        --------------------------------------------------------------------------
        u_tree_msb : tree_msb
            generic map(
                n => W/2 + h
            )
            port map(
                a0  => a_shift(0)(W-1 downto W/2-h),
            a1  => a_shift(1)(W-1 downto W/2-h),
            a2  => a_shift(2)(W-1 downto W/2-h),
            a3  => a_shift(3)(W-1 downto W/2-h),
            a4  => a_shift(4)(W-1 downto W/2-h),
            a5  => a_shift(5)(W-1 downto W/2-h),
            a6  => a_shift(6)(W-1 downto W/2-h),
            a7  => a_shift(7)(W-1 downto W/2-h),
            a8  => a_shift(8)(W-1 downto W/2-h),
            a9  => a_shift(9)(W-1 downto W/2-h),
            a10 => a_shift(10)(W-1 downto W/2-h),
            a11 => a_shift(11)(W-1 downto W/2-h),
            a12 => a_shift(12)(W-1 downto W/2-h),
            a13 => a_shift(13)(W-1 downto W/2-h),
            a14 => a_shift(14)(W-1 downto W/2-h),
            a15 => a_shift(15)(W-1 downto W/2-h),
            a16 => a_shift(16)(W-1 downto W/2-h),
            a17 => a_shift(17)(W-1 downto W/2-h),
            a18 => a_shift(18)(W-1 downto W/2-h),
            a19 => a_shift(19)(W-1 downto W/2-h),
            a20 => a_shift(20)(W-1 downto W/2-h),
            a21 => a_shift(21)(W-1 downto W/2-h),
            a22 => a_shift(22)(W-1 downto W/2-h),
            a23 => a_shift(23)(W-1 downto W/2-h),
            a24 => a_shift(24)(W-1 downto W/2-h),
            a25 => a_shift(25)(W-1 downto W/2-h),
            a26 => a_shift(26)(W-1 downto W/2-h),
            a27 => a_shift(27)(W-1 downto W/2-h),
            a28 => a_shift(28)(W-1 downto W/2-h),
            a29 => a_shift(29)(W-1 downto W/2-h),
            a30 => a_shift(30)(W-1 downto W/2-h),
            a31 => a_shift(31)(W-1 downto W/2-h),
            a32 => a_shift(32)(W-1 downto W/2-h),
            a33 => a_shift(33)(W-1 downto W/2-h),
            a34 => a_shift(34)(W-1 downto W/2-h),
            a35 => a_shift(35)(W-1 downto W/2-h),
            a36 => a_shift(36)(W-1 downto W/2-h),
            a37 => a_shift(37)(W-1 downto W/2-h),
            a38 => a_shift(38)(W-1 downto W/2-h),
            a39 => a_shift(39)(W-1 downto W/2-h),
            a40 => a_shift(40)(W-1 downto W/2-h),
            a41 => a_shift(41)(W-1 downto W/2-h),
            a42 => a_shift(42)(W-1 downto W/2-h),
            a43 => a_shift(43)(W-1 downto W/2-h),
            a44 => a_shift(44)(W-1 downto W/2-h),
            a45 => a_shift(45)(W-1 downto W/2-h),
            a46 => a_shift(46)(W-1 downto W/2-h),
            a47 => a_shift(47)(W-1 downto W/2-h),
            a48 => a_shift(48)(W-1 downto W/2-h),
            a49 => a_shift(49)(W-1 downto W/2-h),
            a50 => a_shift(50)(W-1 downto W/2-h),
            a51 => a_shift(51)(W-1 downto W/2-h),
            a52 => a_shift(52)(W-1 downto W/2-h),
            a53 => a_shift(53)(W-1 downto W/2-h),
            a54 => a_shift(54)(W-1 downto W/2-h),
            a55 => a_shift(55)(W-1 downto W/2-h),
            a56 => a_shift(56)(W-1 downto W/2-h),
            a57 => a_shift(57)(W-1 downto W/2-h),
            a58 => a_shift(58)(W-1 downto W/2-h),
            a59 => a_shift(59)(W-1 downto W/2-h),
            a60 => a_shift(60)(W-1 downto W/2-h),
            a61 => a_shift(61)(W-1 downto W/2-h),
            a62 => a_shift(62)(W-1 downto W/2-h),
            a63 => a_shift(63)(W-1 downto W/2-h),
                f5_0 => f5_0_msb,
                f5_1 => f5_1_msb,
                sum => sum_tree_msb
            );

        --------------------------------------------------------------------------
        -- Árvore LSB original
        --------------------------------------------------------------------------
        u_tree_lsb : tree_lsb
            generic map(
                n => W/2 - h
            )
            port map(
                a0  => a_shift(0)(W/2-h-1 downto 0),
            a1  => a_shift(1)(W/2-h-1 downto 0),
            a2  => a_shift(2)(W/2-h-1 downto 0),
            a3  => a_shift(3)(W/2-h-1 downto 0),
            a4  => a_shift(4)(W/2-h-1 downto 0),
            a5  => a_shift(5)(W/2-h-1 downto 0),
            a6  => a_shift(6)(W/2-h-1 downto 0),
            a7  => a_shift(7)(W/2-h-1 downto 0),
            a8  => a_shift(8)(W/2-h-1 downto 0),
            a9  => a_shift(9)(W/2-h-1 downto 0),
            a10 => a_shift(10)(W/2-h-1 downto 0),
            a11 => a_shift(11)(W/2-h-1 downto 0),
            a12 => a_shift(12)(W/2-h-1 downto 0),
            a13 => a_shift(13)(W/2-h-1 downto 0),
            a14 => a_shift(14)(W/2-h-1 downto 0),
            a15 => a_shift(15)(W/2-h-1 downto 0),
            a16 => a_shift(16)(W/2-h-1 downto 0),
            a17 => a_shift(17)(W/2-h-1 downto 0),
            a18 => a_shift(18)(W/2-h-1 downto 0),
            a19 => a_shift(19)(W/2-h-1 downto 0),
            a20 => a_shift(20)(W/2-h-1 downto 0),
            a21 => a_shift(21)(W/2-h-1 downto 0),
            a22 => a_shift(22)(W/2-h-1 downto 0),
            a23 => a_shift(23)(W/2-h-1 downto 0),
            a24 => a_shift(24)(W/2-h-1 downto 0),
            a25 => a_shift(25)(W/2-h-1 downto 0),
            a26 => a_shift(26)(W/2-h-1 downto 0),
            a27 => a_shift(27)(W/2-h-1 downto 0),
            a28 => a_shift(28)(W/2-h-1 downto 0),
            a29 => a_shift(29)(W/2-h-1 downto 0),
            a30 => a_shift(30)(W/2-h-1 downto 0),
            a31 => a_shift(31)(W/2-h-1 downto 0),
            a32 => a_shift(32)(W/2-h-1 downto 0),
            a33 => a_shift(33)(W/2-h-1 downto 0),
            a34 => a_shift(34)(W/2-h-1 downto 0),
            a35 => a_shift(35)(W/2-h-1 downto 0),
            a36 => a_shift(36)(W/2-h-1 downto 0),
            a37 => a_shift(37)(W/2-h-1 downto 0),
            a38 => a_shift(38)(W/2-h-1 downto 0),
            a39 => a_shift(39)(W/2-h-1 downto 0),
            a40 => a_shift(40)(W/2-h-1 downto 0),
            a41 => a_shift(41)(W/2-h-1 downto 0),
            a42 => a_shift(42)(W/2-h-1 downto 0),
            a43 => a_shift(43)(W/2-h-1 downto 0),
            a44 => a_shift(44)(W/2-h-1 downto 0),
            a45 => a_shift(45)(W/2-h-1 downto 0),
            a46 => a_shift(46)(W/2-h-1 downto 0),
            a47 => a_shift(47)(W/2-h-1 downto 0),
            a48 => a_shift(48)(W/2-h-1 downto 0),
            a49 => a_shift(49)(W/2-h-1 downto 0),
            a50 => a_shift(50)(W/2-h-1 downto 0),
            a51 => a_shift(51)(W/2-h-1 downto 0),
            a52 => a_shift(52)(W/2-h-1 downto 0),
            a53 => a_shift(53)(W/2-h-1 downto 0),
            a54 => a_shift(54)(W/2-h-1 downto 0),
            a55 => a_shift(55)(W/2-h-1 downto 0),
            a56 => a_shift(56)(W/2-h-1 downto 0),
            a57 => a_shift(57)(W/2-h-1 downto 0),
            a58 => a_shift(58)(W/2-h-1 downto 0),
            a59 => a_shift(59)(W/2-h-1 downto 0),
            a60 => a_shift(60)(W/2-h-1 downto 0),
            a61 => a_shift(61)(W/2-h-1 downto 0),
            a62 => a_shift(62)(W/2-h-1 downto 0),
            a63 => a_shift(63)(W/2-h-1 downto 0),
                sum => sum_tree_lsb
            );

        --------------------------------------------------------------------------
        -- Carry entre LSB e MSB
        --------------------------------------------------------------------------
        csum <= ('0' & f5_0_msb(h-1 downto 0)) +
                ('0' & f5_1_msb(h-1 downto 0)) +
                ('0' & sum_tree_lsb(W/2-1 downto W/2-h));

        --------------------------------------------------------------------------
        -- CSLA
        --------------------------------------------------------------------------
        sum_c0 <= f5_0_msb(W/2+h-1 downto h) +
                f5_1_msb(W/2+h-1 downto h);

        sum_c1 <= ('0' & f5_0_msb(W/2+h-1 downto h)) +
                ('0' & f5_1_msb(W/2+h-1 downto h)) +
                to_unsigned(1, W/2+1);

        --------------------------------------------------------------------------
        -- MUX
        --------------------------------------------------------------------------
        sum_msb <= sum_c0 when csum(h) = '0' else sum_c1(W/2-1 downto 0);

        --------------------------------------------------------------------------
        -- Soma final retangular/completa
        --------------------------------------------------------------------------
        sum <= sum_msb &
            csum(h-1 downto 0) &
            sum_tree_lsb(W/2-h-1 downto 0);

    end rtl;
    