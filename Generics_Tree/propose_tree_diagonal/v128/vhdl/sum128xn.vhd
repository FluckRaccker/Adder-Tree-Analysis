
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum128xn is
    generic(
        n : integer := 256;
        h : integer := 7
    );
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
        a124, a125, a126, a127 : in  unsigned(n-1 downto 0);
        sum : out unsigned(n-1 downto 0)
    );
end sum128xn;

architecture rtl of sum128xn is

    constant M : integer := 128;

    type input_array_t is array (0 to M-1) of unsigned(n-1 downto 0);

    signal a_in    : input_array_t;
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

    --------------------------------------------------------------------------
    -- Saídas da árvore MSB
    --------------------------------------------------------------------------
    signal f6_0_msb, f6_1_msb : unsigned(n/2+h-1 downto 0);
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
         60 => a60,  61 => a61,  62 => a62,  63 => a63,
         64 => a64,  65 => a65,  66 => a66,  67 => a67,
         68 => a68,  69 => a69,  70 => a70,  71 => a71,
         72 => a72,  73 => a73,  74 => a74,  75 => a75,
         76 => a76,  77 => a77,  78 => a78,  79 => a79,
         80 => a80,  81 => a81,  82 => a82,  83 => a83,
         84 => a84,  85 => a85,  86 => a86,  87 => a87,
         88 => a88,  89 => a89,  90 => a90,  91 => a91,
         92 => a92,  93 => a93,  94 => a94,  95 => a95,
         96 => a96,  97 => a97,  98 => a98,  99 => a99,
        100 => a100, 101 => a101, 102 => a102, 103 => a103,
        104 => a104, 105 => a105, 106 => a106, 107 => a107,
        108 => a108, 109 => a109, 110 => a110, 111 => a111,
        112 => a112, 113 => a113, 114 => a114, 115 => a115,
        116 => a116, 117 => a117, 118 => a118, 119 => a119,
        120 => a120, 121 => a121, 122 => a122, 123 => a123,
        124 => a124, 125 => a125, 126 => a126, 127 => a127
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
            a0   => a_shift(0)(n-1 downto n/2-h),
            a1   => a_shift(1)(n-1 downto n/2-h),
            a2   => a_shift(2)(n-1 downto n/2-h),
            a3   => a_shift(3)(n-1 downto n/2-h),
            a4   => a_shift(4)(n-1 downto n/2-h),
            a5   => a_shift(5)(n-1 downto n/2-h),
            a6   => a_shift(6)(n-1 downto n/2-h),
            a7   => a_shift(7)(n-1 downto n/2-h),
            a8   => a_shift(8)(n-1 downto n/2-h),
            a9   => a_shift(9)(n-1 downto n/2-h),
            a10  => a_shift(10)(n-1 downto n/2-h),
            a11  => a_shift(11)(n-1 downto n/2-h),
            a12  => a_shift(12)(n-1 downto n/2-h),
            a13  => a_shift(13)(n-1 downto n/2-h),
            a14  => a_shift(14)(n-1 downto n/2-h),
            a15  => a_shift(15)(n-1 downto n/2-h),
            a16  => a_shift(16)(n-1 downto n/2-h),
            a17  => a_shift(17)(n-1 downto n/2-h),
            a18  => a_shift(18)(n-1 downto n/2-h),
            a19  => a_shift(19)(n-1 downto n/2-h),
            a20  => a_shift(20)(n-1 downto n/2-h),
            a21  => a_shift(21)(n-1 downto n/2-h),
            a22  => a_shift(22)(n-1 downto n/2-h),
            a23  => a_shift(23)(n-1 downto n/2-h),
            a24  => a_shift(24)(n-1 downto n/2-h),
            a25  => a_shift(25)(n-1 downto n/2-h),
            a26  => a_shift(26)(n-1 downto n/2-h),
            a27  => a_shift(27)(n-1 downto n/2-h),
            a28  => a_shift(28)(n-1 downto n/2-h),
            a29  => a_shift(29)(n-1 downto n/2-h),
            a30  => a_shift(30)(n-1 downto n/2-h),
            a31  => a_shift(31)(n-1 downto n/2-h),
            a32  => a_shift(32)(n-1 downto n/2-h),
            a33  => a_shift(33)(n-1 downto n/2-h),
            a34  => a_shift(34)(n-1 downto n/2-h),
            a35  => a_shift(35)(n-1 downto n/2-h),
            a36  => a_shift(36)(n-1 downto n/2-h),
            a37  => a_shift(37)(n-1 downto n/2-h),
            a38  => a_shift(38)(n-1 downto n/2-h),
            a39  => a_shift(39)(n-1 downto n/2-h),
            a40  => a_shift(40)(n-1 downto n/2-h),
            a41  => a_shift(41)(n-1 downto n/2-h),
            a42  => a_shift(42)(n-1 downto n/2-h),
            a43  => a_shift(43)(n-1 downto n/2-h),
            a44  => a_shift(44)(n-1 downto n/2-h),
            a45  => a_shift(45)(n-1 downto n/2-h),
            a46  => a_shift(46)(n-1 downto n/2-h),
            a47  => a_shift(47)(n-1 downto n/2-h),
            a48  => a_shift(48)(n-1 downto n/2-h),
            a49  => a_shift(49)(n-1 downto n/2-h),
            a50  => a_shift(50)(n-1 downto n/2-h),
            a51  => a_shift(51)(n-1 downto n/2-h),
            a52  => a_shift(52)(n-1 downto n/2-h),
            a53  => a_shift(53)(n-1 downto n/2-h),
            a54  => a_shift(54)(n-1 downto n/2-h),
            a55  => a_shift(55)(n-1 downto n/2-h),
            a56  => a_shift(56)(n-1 downto n/2-h),
            a57  => a_shift(57)(n-1 downto n/2-h),
            a58  => a_shift(58)(n-1 downto n/2-h),
            a59  => a_shift(59)(n-1 downto n/2-h),
            a60  => a_shift(60)(n-1 downto n/2-h),
            a61  => a_shift(61)(n-1 downto n/2-h),
            a62  => a_shift(62)(n-1 downto n/2-h),
            a63  => a_shift(63)(n-1 downto n/2-h),
            a64  => a_shift(64)(n-1 downto n/2-h),
            a65  => a_shift(65)(n-1 downto n/2-h),
            a66  => a_shift(66)(n-1 downto n/2-h),
            a67  => a_shift(67)(n-1 downto n/2-h),
            a68  => a_shift(68)(n-1 downto n/2-h),
            a69  => a_shift(69)(n-1 downto n/2-h),
            a70  => a_shift(70)(n-1 downto n/2-h),
            a71  => a_shift(71)(n-1 downto n/2-h),
            a72  => a_shift(72)(n-1 downto n/2-h),
            a73  => a_shift(73)(n-1 downto n/2-h),
            a74  => a_shift(74)(n-1 downto n/2-h),
            a75  => a_shift(75)(n-1 downto n/2-h),
            a76  => a_shift(76)(n-1 downto n/2-h),
            a77  => a_shift(77)(n-1 downto n/2-h),
            a78  => a_shift(78)(n-1 downto n/2-h),
            a79  => a_shift(79)(n-1 downto n/2-h),
            a80  => a_shift(80)(n-1 downto n/2-h),
            a81  => a_shift(81)(n-1 downto n/2-h),
            a82  => a_shift(82)(n-1 downto n/2-h),
            a83  => a_shift(83)(n-1 downto n/2-h),
            a84  => a_shift(84)(n-1 downto n/2-h),
            a85  => a_shift(85)(n-1 downto n/2-h),
            a86  => a_shift(86)(n-1 downto n/2-h),
            a87  => a_shift(87)(n-1 downto n/2-h),
            a88  => a_shift(88)(n-1 downto n/2-h),
            a89  => a_shift(89)(n-1 downto n/2-h),
            a90  => a_shift(90)(n-1 downto n/2-h),
            a91  => a_shift(91)(n-1 downto n/2-h),
            a92  => a_shift(92)(n-1 downto n/2-h),
            a93  => a_shift(93)(n-1 downto n/2-h),
            a94  => a_shift(94)(n-1 downto n/2-h),
            a95  => a_shift(95)(n-1 downto n/2-h),
            a96  => a_shift(96)(n-1 downto n/2-h),
            a97  => a_shift(97)(n-1 downto n/2-h),
            a98  => a_shift(98)(n-1 downto n/2-h),
            a99  => a_shift(99)(n-1 downto n/2-h),
            a100 => a_shift(100)(n-1 downto n/2-h),
            a101 => a_shift(101)(n-1 downto n/2-h),
            a102 => a_shift(102)(n-1 downto n/2-h),
            a103 => a_shift(103)(n-1 downto n/2-h),
            a104 => a_shift(104)(n-1 downto n/2-h),
            a105 => a_shift(105)(n-1 downto n/2-h),
            a106 => a_shift(106)(n-1 downto n/2-h),
            a107 => a_shift(107)(n-1 downto n/2-h),
            a108 => a_shift(108)(n-1 downto n/2-h),
            a109 => a_shift(109)(n-1 downto n/2-h),
            a110 => a_shift(110)(n-1 downto n/2-h),
            a111 => a_shift(111)(n-1 downto n/2-h),
            a112 => a_shift(112)(n-1 downto n/2-h),
            a113 => a_shift(113)(n-1 downto n/2-h),
            a114 => a_shift(114)(n-1 downto n/2-h),
            a115 => a_shift(115)(n-1 downto n/2-h),
            a116 => a_shift(116)(n-1 downto n/2-h),
            a117 => a_shift(117)(n-1 downto n/2-h),
            a118 => a_shift(118)(n-1 downto n/2-h),
            a119 => a_shift(119)(n-1 downto n/2-h),
            a120 => a_shift(120)(n-1 downto n/2-h),
            a121 => a_shift(121)(n-1 downto n/2-h),
            a122 => a_shift(122)(n-1 downto n/2-h),
            a123 => a_shift(123)(n-1 downto n/2-h),
            a124 => a_shift(124)(n-1 downto n/2-h),
            a125 => a_shift(125)(n-1 downto n/2-h),
            a126 => a_shift(126)(n-1 downto n/2-h),
            a127 => a_shift(127)(n-1 downto n/2-h),
            f6_0 => f6_0_msb,
            f6_1 => f6_1_msb,
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
            a0   => a_shift(0)(n/2-h-1 downto 0),
            a1   => a_shift(1)(n/2-h-1 downto 0),
            a2   => a_shift(2)(n/2-h-1 downto 0),
            a3   => a_shift(3)(n/2-h-1 downto 0),
            a4   => a_shift(4)(n/2-h-1 downto 0),
            a5   => a_shift(5)(n/2-h-1 downto 0),
            a6   => a_shift(6)(n/2-h-1 downto 0),
            a7   => a_shift(7)(n/2-h-1 downto 0),
            a8   => a_shift(8)(n/2-h-1 downto 0),
            a9   => a_shift(9)(n/2-h-1 downto 0),
            a10  => a_shift(10)(n/2-h-1 downto 0),
            a11  => a_shift(11)(n/2-h-1 downto 0),
            a12  => a_shift(12)(n/2-h-1 downto 0),
            a13  => a_shift(13)(n/2-h-1 downto 0),
            a14  => a_shift(14)(n/2-h-1 downto 0),
            a15  => a_shift(15)(n/2-h-1 downto 0),
            a16  => a_shift(16)(n/2-h-1 downto 0),
            a17  => a_shift(17)(n/2-h-1 downto 0),
            a18  => a_shift(18)(n/2-h-1 downto 0),
            a19  => a_shift(19)(n/2-h-1 downto 0),
            a20  => a_shift(20)(n/2-h-1 downto 0),
            a21  => a_shift(21)(n/2-h-1 downto 0),
            a22  => a_shift(22)(n/2-h-1 downto 0),
            a23  => a_shift(23)(n/2-h-1 downto 0),
            a24  => a_shift(24)(n/2-h-1 downto 0),
            a25  => a_shift(25)(n/2-h-1 downto 0),
            a26  => a_shift(26)(n/2-h-1 downto 0),
            a27  => a_shift(27)(n/2-h-1 downto 0),
            a28  => a_shift(28)(n/2-h-1 downto 0),
            a29  => a_shift(29)(n/2-h-1 downto 0),
            a30  => a_shift(30)(n/2-h-1 downto 0),
            a31  => a_shift(31)(n/2-h-1 downto 0),
            a32  => a_shift(32)(n/2-h-1 downto 0),
            a33  => a_shift(33)(n/2-h-1 downto 0),
            a34  => a_shift(34)(n/2-h-1 downto 0),
            a35  => a_shift(35)(n/2-h-1 downto 0),
            a36  => a_shift(36)(n/2-h-1 downto 0),
            a37  => a_shift(37)(n/2-h-1 downto 0),
            a38  => a_shift(38)(n/2-h-1 downto 0),
            a39  => a_shift(39)(n/2-h-1 downto 0),
            a40  => a_shift(40)(n/2-h-1 downto 0),
            a41  => a_shift(41)(n/2-h-1 downto 0),
            a42  => a_shift(42)(n/2-h-1 downto 0),
            a43  => a_shift(43)(n/2-h-1 downto 0),
            a44  => a_shift(44)(n/2-h-1 downto 0),
            a45  => a_shift(45)(n/2-h-1 downto 0),
            a46  => a_shift(46)(n/2-h-1 downto 0),
            a47  => a_shift(47)(n/2-h-1 downto 0),
            a48  => a_shift(48)(n/2-h-1 downto 0),
            a49  => a_shift(49)(n/2-h-1 downto 0),
            a50  => a_shift(50)(n/2-h-1 downto 0),
            a51  => a_shift(51)(n/2-h-1 downto 0),
            a52  => a_shift(52)(n/2-h-1 downto 0),
            a53  => a_shift(53)(n/2-h-1 downto 0),
            a54  => a_shift(54)(n/2-h-1 downto 0),
            a55  => a_shift(55)(n/2-h-1 downto 0),
            a56  => a_shift(56)(n/2-h-1 downto 0),
            a57  => a_shift(57)(n/2-h-1 downto 0),
            a58  => a_shift(58)(n/2-h-1 downto 0),
            a59  => a_shift(59)(n/2-h-1 downto 0),
            a60  => a_shift(60)(n/2-h-1 downto 0),
            a61  => a_shift(61)(n/2-h-1 downto 0),
            a62  => a_shift(62)(n/2-h-1 downto 0),
            a63  => a_shift(63)(n/2-h-1 downto 0),
            a64  => a_shift(64)(n/2-h-1 downto 0),
            a65  => a_shift(65)(n/2-h-1 downto 0),
            a66  => a_shift(66)(n/2-h-1 downto 0),
            a67  => a_shift(67)(n/2-h-1 downto 0),
            a68  => a_shift(68)(n/2-h-1 downto 0),
            a69  => a_shift(69)(n/2-h-1 downto 0),
            a70  => a_shift(70)(n/2-h-1 downto 0),
            a71  => a_shift(71)(n/2-h-1 downto 0),
            a72  => a_shift(72)(n/2-h-1 downto 0),
            a73  => a_shift(73)(n/2-h-1 downto 0),
            a74  => a_shift(74)(n/2-h-1 downto 0),
            a75  => a_shift(75)(n/2-h-1 downto 0),
            a76  => a_shift(76)(n/2-h-1 downto 0),
            a77  => a_shift(77)(n/2-h-1 downto 0),
            a78  => a_shift(78)(n/2-h-1 downto 0),
            a79  => a_shift(79)(n/2-h-1 downto 0),
            a80  => a_shift(80)(n/2-h-1 downto 0),
            a81  => a_shift(81)(n/2-h-1 downto 0),
            a82  => a_shift(82)(n/2-h-1 downto 0),
            a83  => a_shift(83)(n/2-h-1 downto 0),
            a84  => a_shift(84)(n/2-h-1 downto 0),
            a85  => a_shift(85)(n/2-h-1 downto 0),
            a86  => a_shift(86)(n/2-h-1 downto 0),
            a87  => a_shift(87)(n/2-h-1 downto 0),
            a88  => a_shift(88)(n/2-h-1 downto 0),
            a89  => a_shift(89)(n/2-h-1 downto 0),
            a90  => a_shift(90)(n/2-h-1 downto 0),
            a91  => a_shift(91)(n/2-h-1 downto 0),
            a92  => a_shift(92)(n/2-h-1 downto 0),
            a93  => a_shift(93)(n/2-h-1 downto 0),
            a94  => a_shift(94)(n/2-h-1 downto 0),
            a95  => a_shift(95)(n/2-h-1 downto 0),
            a96  => a_shift(96)(n/2-h-1 downto 0),
            a97  => a_shift(97)(n/2-h-1 downto 0),
            a98  => a_shift(98)(n/2-h-1 downto 0),
            a99  => a_shift(99)(n/2-h-1 downto 0),
            a100 => a_shift(100)(n/2-h-1 downto 0),
            a101 => a_shift(101)(n/2-h-1 downto 0),
            a102 => a_shift(102)(n/2-h-1 downto 0),
            a103 => a_shift(103)(n/2-h-1 downto 0),
            a104 => a_shift(104)(n/2-h-1 downto 0),
            a105 => a_shift(105)(n/2-h-1 downto 0),
            a106 => a_shift(106)(n/2-h-1 downto 0),
            a107 => a_shift(107)(n/2-h-1 downto 0),
            a108 => a_shift(108)(n/2-h-1 downto 0),
            a109 => a_shift(109)(n/2-h-1 downto 0),
            a110 => a_shift(110)(n/2-h-1 downto 0),
            a111 => a_shift(111)(n/2-h-1 downto 0),
            a112 => a_shift(112)(n/2-h-1 downto 0),
            a113 => a_shift(113)(n/2-h-1 downto 0),
            a114 => a_shift(114)(n/2-h-1 downto 0),
            a115 => a_shift(115)(n/2-h-1 downto 0),
            a116 => a_shift(116)(n/2-h-1 downto 0),
            a117 => a_shift(117)(n/2-h-1 downto 0),
            a118 => a_shift(118)(n/2-h-1 downto 0),
            a119 => a_shift(119)(n/2-h-1 downto 0),
            a120 => a_shift(120)(n/2-h-1 downto 0),
            a121 => a_shift(121)(n/2-h-1 downto 0),
            a122 => a_shift(122)(n/2-h-1 downto 0),
            a123 => a_shift(123)(n/2-h-1 downto 0),
            a124 => a_shift(124)(n/2-h-1 downto 0),
            a125 => a_shift(125)(n/2-h-1 downto 0),
            a126 => a_shift(126)(n/2-h-1 downto 0),
            a127 => a_shift(127)(n/2-h-1 downto 0),
            sum => sum_tree_lsb
        );

    --------------------------------------------------------------------------
    -- Carry entre LSB e MSB
    --------------------------------------------------------------------------
    csum <= ('0' & f6_0_msb(h-1 downto 0)) +
            ('0' & f6_1_msb(h-1 downto 0)) +
            ('0' & sum_tree_lsb(n/2-1 downto n/2-h));

    --------------------------------------------------------------------------
    -- CSLA
    --------------------------------------------------------------------------
    sum_c0 <= f6_0_msb(n/2+h-1 downto h) +
              f6_1_msb(n/2+h-1 downto h);

    sum_c1 <= ('0' & f6_0_msb(n/2+h-1 downto h)) +
              ('0' & f6_1_msb(n/2+h-1 downto h)) +
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
