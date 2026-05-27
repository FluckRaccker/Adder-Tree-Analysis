
    library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

    entity sum128xn is
        generic(
            n : integer := 256;
            h : integer := 7
        );
        port (
            a0  : in  unsigned(n-1 downto 0);
            a1  : in  unsigned(n-1 downto 0);
            sum : out unsigned(2*n-1 downto 0)
        );
    end sum128xn;

    architecture rtl of sum128xn is

        constant M : integer := 128;
        constant W : integer := 2*n;

        type input_array_t is array (0 to M-1) of unsigned(W-1 downto 0);

        signal pp      : input_array_t;
        signal a_shift : input_array_t;

        component tree_msb is
            generic(n : integer := 256);
            port (
                a0  , a1  , a2  , a3  ,
            a4  , a5  , a6  , a7  ,
            a8  , a9  , a10 , a11 ,
            a12 , a13 , a14 , a15 ,
            a16 , a17 , a18 , a19 ,
            a20 , a21 , a22 , a23 ,
            a24 , a25 , a26 , a27 ,
            a28 , a29 , a30 , a31 ,
            a32 , a33 , a34 , a35 ,
            a36 , a37 , a38 , a39 ,
            a40 , a41 , a42 , a43 ,
            a44 , a45 , a46 , a47 ,
            a48 , a49 , a50 , a51 ,
            a52 , a53 , a54 , a55 ,
            a56 , a57 , a58 , a59 ,
            a60 , a61 , a62 , a63 ,
            a64 , a65 , a66 , a67 ,
            a68 , a69 , a70 , a71 ,
            a72 , a73 , a74 , a75 ,
            a76 , a77 , a78 , a79 ,
            a80 , a81 , a82 , a83 ,
            a84 , a85 , a86 , a87 ,
            a88 , a89 , a90 , a91 ,
            a92 , a93 , a94 , a95 ,
            a96 , a97 , a98 , a99 ,
            a100, a101, a102, a103,
            a104, a105, a106, a107,
            a108, a109, a110, a111,
            a112, a113, a114, a115,
            a116, a117, a118, a119,
            a120, a121, a122, a123,
            a124, a125, a126, a127 : in unsigned(n-1 downto 0);
                f6_1, f6_0 : out unsigned(n-1 downto 0);
                sum : out unsigned(n-1 downto 0)
            );
        end component;

        component tree_lsb is
            generic(n : integer := 256);
            port (
                a0  , a1  , a2  , a3  ,
            a4  , a5  , a6  , a7  ,
            a8  , a9  , a10 , a11 ,
            a12 , a13 , a14 , a15 ,
            a16 , a17 , a18 , a19 ,
            a20 , a21 , a22 , a23 ,
            a24 , a25 , a26 , a27 ,
            a28 , a29 , a30 , a31 ,
            a32 , a33 , a34 , a35 ,
            a36 , a37 , a38 , a39 ,
            a40 , a41 , a42 , a43 ,
            a44 , a45 , a46 , a47 ,
            a48 , a49 , a50 , a51 ,
            a52 , a53 , a54 , a55 ,
            a56 , a57 , a58 , a59 ,
            a60 , a61 , a62 , a63 ,
            a64 , a65 , a66 , a67 ,
            a68 , a69 , a70 , a71 ,
            a72 , a73 , a74 , a75 ,
            a76 , a77 , a78 , a79 ,
            a80 , a81 , a82 , a83 ,
            a84 , a85 , a86 , a87 ,
            a88 , a89 , a90 , a91 ,
            a92 , a93 , a94 , a95 ,
            a96 , a97 , a98 , a99 ,
            a100, a101, a102, a103,
            a104, a105, a106, a107,
            a108, a109, a110, a111,
            a112, a113, a114, a115,
            a116, a117, a118, a119,
            a120, a121, a122, a123,
            a124, a125, a126, a127 : in unsigned(n-1 downto 0);
                sum : out unsigned(n+6 downto 0)
            );
        end component;

        signal f6_0_msb, f6_1_msb : unsigned(W/2+h-1 downto 0);
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
                a0   => a_shift(0)(W-1 downto W/2-h),
            a1   => a_shift(1)(W-1 downto W/2-h),
            a2   => a_shift(2)(W-1 downto W/2-h),
            a3   => a_shift(3)(W-1 downto W/2-h),
            a4   => a_shift(4)(W-1 downto W/2-h),
            a5   => a_shift(5)(W-1 downto W/2-h),
            a6   => a_shift(6)(W-1 downto W/2-h),
            a7   => a_shift(7)(W-1 downto W/2-h),
            a8   => a_shift(8)(W-1 downto W/2-h),
            a9   => a_shift(9)(W-1 downto W/2-h),
            a10  => a_shift(10)(W-1 downto W/2-h),
            a11  => a_shift(11)(W-1 downto W/2-h),
            a12  => a_shift(12)(W-1 downto W/2-h),
            a13  => a_shift(13)(W-1 downto W/2-h),
            a14  => a_shift(14)(W-1 downto W/2-h),
            a15  => a_shift(15)(W-1 downto W/2-h),
            a16  => a_shift(16)(W-1 downto W/2-h),
            a17  => a_shift(17)(W-1 downto W/2-h),
            a18  => a_shift(18)(W-1 downto W/2-h),
            a19  => a_shift(19)(W-1 downto W/2-h),
            a20  => a_shift(20)(W-1 downto W/2-h),
            a21  => a_shift(21)(W-1 downto W/2-h),
            a22  => a_shift(22)(W-1 downto W/2-h),
            a23  => a_shift(23)(W-1 downto W/2-h),
            a24  => a_shift(24)(W-1 downto W/2-h),
            a25  => a_shift(25)(W-1 downto W/2-h),
            a26  => a_shift(26)(W-1 downto W/2-h),
            a27  => a_shift(27)(W-1 downto W/2-h),
            a28  => a_shift(28)(W-1 downto W/2-h),
            a29  => a_shift(29)(W-1 downto W/2-h),
            a30  => a_shift(30)(W-1 downto W/2-h),
            a31  => a_shift(31)(W-1 downto W/2-h),
            a32  => a_shift(32)(W-1 downto W/2-h),
            a33  => a_shift(33)(W-1 downto W/2-h),
            a34  => a_shift(34)(W-1 downto W/2-h),
            a35  => a_shift(35)(W-1 downto W/2-h),
            a36  => a_shift(36)(W-1 downto W/2-h),
            a37  => a_shift(37)(W-1 downto W/2-h),
            a38  => a_shift(38)(W-1 downto W/2-h),
            a39  => a_shift(39)(W-1 downto W/2-h),
            a40  => a_shift(40)(W-1 downto W/2-h),
            a41  => a_shift(41)(W-1 downto W/2-h),
            a42  => a_shift(42)(W-1 downto W/2-h),
            a43  => a_shift(43)(W-1 downto W/2-h),
            a44  => a_shift(44)(W-1 downto W/2-h),
            a45  => a_shift(45)(W-1 downto W/2-h),
            a46  => a_shift(46)(W-1 downto W/2-h),
            a47  => a_shift(47)(W-1 downto W/2-h),
            a48  => a_shift(48)(W-1 downto W/2-h),
            a49  => a_shift(49)(W-1 downto W/2-h),
            a50  => a_shift(50)(W-1 downto W/2-h),
            a51  => a_shift(51)(W-1 downto W/2-h),
            a52  => a_shift(52)(W-1 downto W/2-h),
            a53  => a_shift(53)(W-1 downto W/2-h),
            a54  => a_shift(54)(W-1 downto W/2-h),
            a55  => a_shift(55)(W-1 downto W/2-h),
            a56  => a_shift(56)(W-1 downto W/2-h),
            a57  => a_shift(57)(W-1 downto W/2-h),
            a58  => a_shift(58)(W-1 downto W/2-h),
            a59  => a_shift(59)(W-1 downto W/2-h),
            a60  => a_shift(60)(W-1 downto W/2-h),
            a61  => a_shift(61)(W-1 downto W/2-h),
            a62  => a_shift(62)(W-1 downto W/2-h),
            a63  => a_shift(63)(W-1 downto W/2-h),
            a64  => a_shift(64)(W-1 downto W/2-h),
            a65  => a_shift(65)(W-1 downto W/2-h),
            a66  => a_shift(66)(W-1 downto W/2-h),
            a67  => a_shift(67)(W-1 downto W/2-h),
            a68  => a_shift(68)(W-1 downto W/2-h),
            a69  => a_shift(69)(W-1 downto W/2-h),
            a70  => a_shift(70)(W-1 downto W/2-h),
            a71  => a_shift(71)(W-1 downto W/2-h),
            a72  => a_shift(72)(W-1 downto W/2-h),
            a73  => a_shift(73)(W-1 downto W/2-h),
            a74  => a_shift(74)(W-1 downto W/2-h),
            a75  => a_shift(75)(W-1 downto W/2-h),
            a76  => a_shift(76)(W-1 downto W/2-h),
            a77  => a_shift(77)(W-1 downto W/2-h),
            a78  => a_shift(78)(W-1 downto W/2-h),
            a79  => a_shift(79)(W-1 downto W/2-h),
            a80  => a_shift(80)(W-1 downto W/2-h),
            a81  => a_shift(81)(W-1 downto W/2-h),
            a82  => a_shift(82)(W-1 downto W/2-h),
            a83  => a_shift(83)(W-1 downto W/2-h),
            a84  => a_shift(84)(W-1 downto W/2-h),
            a85  => a_shift(85)(W-1 downto W/2-h),
            a86  => a_shift(86)(W-1 downto W/2-h),
            a87  => a_shift(87)(W-1 downto W/2-h),
            a88  => a_shift(88)(W-1 downto W/2-h),
            a89  => a_shift(89)(W-1 downto W/2-h),
            a90  => a_shift(90)(W-1 downto W/2-h),
            a91  => a_shift(91)(W-1 downto W/2-h),
            a92  => a_shift(92)(W-1 downto W/2-h),
            a93  => a_shift(93)(W-1 downto W/2-h),
            a94  => a_shift(94)(W-1 downto W/2-h),
            a95  => a_shift(95)(W-1 downto W/2-h),
            a96  => a_shift(96)(W-1 downto W/2-h),
            a97  => a_shift(97)(W-1 downto W/2-h),
            a98  => a_shift(98)(W-1 downto W/2-h),
            a99  => a_shift(99)(W-1 downto W/2-h),
            a100 => a_shift(100)(W-1 downto W/2-h),
            a101 => a_shift(101)(W-1 downto W/2-h),
            a102 => a_shift(102)(W-1 downto W/2-h),
            a103 => a_shift(103)(W-1 downto W/2-h),
            a104 => a_shift(104)(W-1 downto W/2-h),
            a105 => a_shift(105)(W-1 downto W/2-h),
            a106 => a_shift(106)(W-1 downto W/2-h),
            a107 => a_shift(107)(W-1 downto W/2-h),
            a108 => a_shift(108)(W-1 downto W/2-h),
            a109 => a_shift(109)(W-1 downto W/2-h),
            a110 => a_shift(110)(W-1 downto W/2-h),
            a111 => a_shift(111)(W-1 downto W/2-h),
            a112 => a_shift(112)(W-1 downto W/2-h),
            a113 => a_shift(113)(W-1 downto W/2-h),
            a114 => a_shift(114)(W-1 downto W/2-h),
            a115 => a_shift(115)(W-1 downto W/2-h),
            a116 => a_shift(116)(W-1 downto W/2-h),
            a117 => a_shift(117)(W-1 downto W/2-h),
            a118 => a_shift(118)(W-1 downto W/2-h),
            a119 => a_shift(119)(W-1 downto W/2-h),
            a120 => a_shift(120)(W-1 downto W/2-h),
            a121 => a_shift(121)(W-1 downto W/2-h),
            a122 => a_shift(122)(W-1 downto W/2-h),
            a123 => a_shift(123)(W-1 downto W/2-h),
            a124 => a_shift(124)(W-1 downto W/2-h),
            a125 => a_shift(125)(W-1 downto W/2-h),
            a126 => a_shift(126)(W-1 downto W/2-h),
            a127 => a_shift(127)(W-1 downto W/2-h),
                f6_0 => f6_0_msb,
                f6_1 => f6_1_msb,
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
                a0   => a_shift(0)(W/2-h-1 downto 0),
            a1   => a_shift(1)(W/2-h-1 downto 0),
            a2   => a_shift(2)(W/2-h-1 downto 0),
            a3   => a_shift(3)(W/2-h-1 downto 0),
            a4   => a_shift(4)(W/2-h-1 downto 0),
            a5   => a_shift(5)(W/2-h-1 downto 0),
            a6   => a_shift(6)(W/2-h-1 downto 0),
            a7   => a_shift(7)(W/2-h-1 downto 0),
            a8   => a_shift(8)(W/2-h-1 downto 0),
            a9   => a_shift(9)(W/2-h-1 downto 0),
            a10  => a_shift(10)(W/2-h-1 downto 0),
            a11  => a_shift(11)(W/2-h-1 downto 0),
            a12  => a_shift(12)(W/2-h-1 downto 0),
            a13  => a_shift(13)(W/2-h-1 downto 0),
            a14  => a_shift(14)(W/2-h-1 downto 0),
            a15  => a_shift(15)(W/2-h-1 downto 0),
            a16  => a_shift(16)(W/2-h-1 downto 0),
            a17  => a_shift(17)(W/2-h-1 downto 0),
            a18  => a_shift(18)(W/2-h-1 downto 0),
            a19  => a_shift(19)(W/2-h-1 downto 0),
            a20  => a_shift(20)(W/2-h-1 downto 0),
            a21  => a_shift(21)(W/2-h-1 downto 0),
            a22  => a_shift(22)(W/2-h-1 downto 0),
            a23  => a_shift(23)(W/2-h-1 downto 0),
            a24  => a_shift(24)(W/2-h-1 downto 0),
            a25  => a_shift(25)(W/2-h-1 downto 0),
            a26  => a_shift(26)(W/2-h-1 downto 0),
            a27  => a_shift(27)(W/2-h-1 downto 0),
            a28  => a_shift(28)(W/2-h-1 downto 0),
            a29  => a_shift(29)(W/2-h-1 downto 0),
            a30  => a_shift(30)(W/2-h-1 downto 0),
            a31  => a_shift(31)(W/2-h-1 downto 0),
            a32  => a_shift(32)(W/2-h-1 downto 0),
            a33  => a_shift(33)(W/2-h-1 downto 0),
            a34  => a_shift(34)(W/2-h-1 downto 0),
            a35  => a_shift(35)(W/2-h-1 downto 0),
            a36  => a_shift(36)(W/2-h-1 downto 0),
            a37  => a_shift(37)(W/2-h-1 downto 0),
            a38  => a_shift(38)(W/2-h-1 downto 0),
            a39  => a_shift(39)(W/2-h-1 downto 0),
            a40  => a_shift(40)(W/2-h-1 downto 0),
            a41  => a_shift(41)(W/2-h-1 downto 0),
            a42  => a_shift(42)(W/2-h-1 downto 0),
            a43  => a_shift(43)(W/2-h-1 downto 0),
            a44  => a_shift(44)(W/2-h-1 downto 0),
            a45  => a_shift(45)(W/2-h-1 downto 0),
            a46  => a_shift(46)(W/2-h-1 downto 0),
            a47  => a_shift(47)(W/2-h-1 downto 0),
            a48  => a_shift(48)(W/2-h-1 downto 0),
            a49  => a_shift(49)(W/2-h-1 downto 0),
            a50  => a_shift(50)(W/2-h-1 downto 0),
            a51  => a_shift(51)(W/2-h-1 downto 0),
            a52  => a_shift(52)(W/2-h-1 downto 0),
            a53  => a_shift(53)(W/2-h-1 downto 0),
            a54  => a_shift(54)(W/2-h-1 downto 0),
            a55  => a_shift(55)(W/2-h-1 downto 0),
            a56  => a_shift(56)(W/2-h-1 downto 0),
            a57  => a_shift(57)(W/2-h-1 downto 0),
            a58  => a_shift(58)(W/2-h-1 downto 0),
            a59  => a_shift(59)(W/2-h-1 downto 0),
            a60  => a_shift(60)(W/2-h-1 downto 0),
            a61  => a_shift(61)(W/2-h-1 downto 0),
            a62  => a_shift(62)(W/2-h-1 downto 0),
            a63  => a_shift(63)(W/2-h-1 downto 0),
            a64  => a_shift(64)(W/2-h-1 downto 0),
            a65  => a_shift(65)(W/2-h-1 downto 0),
            a66  => a_shift(66)(W/2-h-1 downto 0),
            a67  => a_shift(67)(W/2-h-1 downto 0),
            a68  => a_shift(68)(W/2-h-1 downto 0),
            a69  => a_shift(69)(W/2-h-1 downto 0),
            a70  => a_shift(70)(W/2-h-1 downto 0),
            a71  => a_shift(71)(W/2-h-1 downto 0),
            a72  => a_shift(72)(W/2-h-1 downto 0),
            a73  => a_shift(73)(W/2-h-1 downto 0),
            a74  => a_shift(74)(W/2-h-1 downto 0),
            a75  => a_shift(75)(W/2-h-1 downto 0),
            a76  => a_shift(76)(W/2-h-1 downto 0),
            a77  => a_shift(77)(W/2-h-1 downto 0),
            a78  => a_shift(78)(W/2-h-1 downto 0),
            a79  => a_shift(79)(W/2-h-1 downto 0),
            a80  => a_shift(80)(W/2-h-1 downto 0),
            a81  => a_shift(81)(W/2-h-1 downto 0),
            a82  => a_shift(82)(W/2-h-1 downto 0),
            a83  => a_shift(83)(W/2-h-1 downto 0),
            a84  => a_shift(84)(W/2-h-1 downto 0),
            a85  => a_shift(85)(W/2-h-1 downto 0),
            a86  => a_shift(86)(W/2-h-1 downto 0),
            a87  => a_shift(87)(W/2-h-1 downto 0),
            a88  => a_shift(88)(W/2-h-1 downto 0),
            a89  => a_shift(89)(W/2-h-1 downto 0),
            a90  => a_shift(90)(W/2-h-1 downto 0),
            a91  => a_shift(91)(W/2-h-1 downto 0),
            a92  => a_shift(92)(W/2-h-1 downto 0),
            a93  => a_shift(93)(W/2-h-1 downto 0),
            a94  => a_shift(94)(W/2-h-1 downto 0),
            a95  => a_shift(95)(W/2-h-1 downto 0),
            a96  => a_shift(96)(W/2-h-1 downto 0),
            a97  => a_shift(97)(W/2-h-1 downto 0),
            a98  => a_shift(98)(W/2-h-1 downto 0),
            a99  => a_shift(99)(W/2-h-1 downto 0),
            a100 => a_shift(100)(W/2-h-1 downto 0),
            a101 => a_shift(101)(W/2-h-1 downto 0),
            a102 => a_shift(102)(W/2-h-1 downto 0),
            a103 => a_shift(103)(W/2-h-1 downto 0),
            a104 => a_shift(104)(W/2-h-1 downto 0),
            a105 => a_shift(105)(W/2-h-1 downto 0),
            a106 => a_shift(106)(W/2-h-1 downto 0),
            a107 => a_shift(107)(W/2-h-1 downto 0),
            a108 => a_shift(108)(W/2-h-1 downto 0),
            a109 => a_shift(109)(W/2-h-1 downto 0),
            a110 => a_shift(110)(W/2-h-1 downto 0),
            a111 => a_shift(111)(W/2-h-1 downto 0),
            a112 => a_shift(112)(W/2-h-1 downto 0),
            a113 => a_shift(113)(W/2-h-1 downto 0),
            a114 => a_shift(114)(W/2-h-1 downto 0),
            a115 => a_shift(115)(W/2-h-1 downto 0),
            a116 => a_shift(116)(W/2-h-1 downto 0),
            a117 => a_shift(117)(W/2-h-1 downto 0),
            a118 => a_shift(118)(W/2-h-1 downto 0),
            a119 => a_shift(119)(W/2-h-1 downto 0),
            a120 => a_shift(120)(W/2-h-1 downto 0),
            a121 => a_shift(121)(W/2-h-1 downto 0),
            a122 => a_shift(122)(W/2-h-1 downto 0),
            a123 => a_shift(123)(W/2-h-1 downto 0),
            a124 => a_shift(124)(W/2-h-1 downto 0),
            a125 => a_shift(125)(W/2-h-1 downto 0),
            a126 => a_shift(126)(W/2-h-1 downto 0),
            a127 => a_shift(127)(W/2-h-1 downto 0),
                sum => sum_tree_lsb
            );

        --------------------------------------------------------------------------
        -- Carry entre LSB e MSB
        --------------------------------------------------------------------------
        csum <= ('0' & f6_0_msb(h-1 downto 0)) +
                ('0' & f6_1_msb(h-1 downto 0)) +
                ('0' & sum_tree_lsb(W/2-1 downto W/2-h));

        --------------------------------------------------------------------------
        -- CSLA
        --------------------------------------------------------------------------
        sum_c0 <= f6_0_msb(W/2+h-1 downto h) +
                f6_1_msb(W/2+h-1 downto h);

        sum_c1 <= ('0' & f6_0_msb(W/2+h-1 downto h)) +
                ('0' & f6_1_msb(W/2+h-1 downto h)) +
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
    