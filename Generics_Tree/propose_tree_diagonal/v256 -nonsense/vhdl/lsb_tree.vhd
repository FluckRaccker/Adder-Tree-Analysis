library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tree_lsb is
    generic(n : integer := 16);
    port (
        a0   , a1   , a2   , a3   ,
        a4   , a5   , a6   , a7   ,
        a8   , a9   , a10  , a11  ,
        a12  , a13  , a14  , a15  ,
        a16  , a17  , a18  , a19  ,
        a20  , a21  , a22  , a23  ,
        a24  , a25  , a26  , a27  ,
        a28  , a29  , a30  , a31  ,
        a32  , a33  , a34  , a35  ,
        a36  , a37  , a38  , a39  ,
        a40  , a41  , a42  , a43  ,
        a44  , a45  , a46  , a47  ,
        a48  , a49  , a50  , a51  ,
        a52  , a53  , a54  , a55  ,
        a56  , a57  , a58  , a59  ,
        a60  , a61  , a62  , a63  ,
        a64  , a65  , a66  , a67  ,
        a68  , a69  , a70  , a71  ,
        a72  , a73  , a74  , a75  ,
        a76  , a77  , a78  , a79  ,
        a80  , a81  , a82  , a83  ,
        a84  , a85  , a86  , a87  ,
        a88  , a89  , a90  , a91  ,
        a92  , a93  , a94  , a95  ,
        a96  , a97  , a98  , a99  ,
        a100 , a101 , a102 , a103 ,
        a104 , a105 , a106 , a107 ,
        a108 , a109 , a110 , a111 ,
        a112 , a113 , a114 , a115 ,
        a116 , a117 , a118 , a119 ,
        a120 , a121 , a122 , a123 ,
        a124 , a125 , a126 , a127 ,
        a128 , a129 , a130 , a131 ,
        a132 , a133 , a134 , a135 ,
        a136 , a137 , a138 , a139 ,
        a140 , a141 , a142 , a143 ,
        a144 , a145 , a146 , a147 ,
        a148 , a149 , a150 , a151 ,
        a152 , a153 , a154 , a155 ,
        a156 , a157 , a158 , a159 ,
        a160 , a161 , a162 , a163 ,
        a164 , a165 , a166 , a167 ,
        a168 , a169 , a170 , a171 ,
        a172 , a173 , a174 , a175 ,
        a176 , a177 , a178 , a179 ,
        a180 , a181 , a182 , a183 ,
        a184 , a185 , a186 , a187 ,
        a188 , a189 , a190 , a191 ,
        a192 , a193 , a194 , a195 ,
        a196 , a197 , a198 , a199 ,
        a200 , a201 , a202 , a203 ,
        a204 , a205 , a206 , a207 ,
        a208 , a209 , a210 , a211 ,
        a212 , a213 , a214 , a215 ,
        a216 , a217 , a218 , a219 ,
        a220 , a221 , a222 , a223 ,
        a224 , a225 , a226 , a227 ,
        a228 , a229 , a230 , a231 ,
        a232 , a233 , a234 , a235 ,
        a236 , a237 , a238 , a239 ,
        a240 , a241 , a242 , a243 ,
        a244 , a245 , a246 , a247 ,
        a248 , a249 , a250 , a251 ,
        a252 , a253 , a254 , a255 : in unsigned(n-1 downto 0);
        sum : out unsigned(n+255 downto 0)
    );
end tree_lsb;

architecture rtl of tree_lsb is

    constant M : integer := 256;
    constant W : integer := n + M;

    subtype acc_t is unsigned(W-1 downto 0);

    type input_array_t is array (0 to M-1) of unsigned(n-1 downto 0);
    type level1_t     is array (0 to 255) of acc_t;
    type level2_t     is array (0 to 127) of acc_t;
    type level3_t     is array (0 to 63)  of acc_t;
    type level4_t     is array (0 to 31)  of acc_t;
    type level5_t     is array (0 to 15)  of acc_t;
    type level6_t     is array (0 to 7)   of acc_t;
    type level7_t     is array (0 to 3)   of acc_t;
    type level8_t     is array (0 to 1)   of acc_t;

    signal a_vec  : input_array_t;

    signal flsb_1 : level1_t;
    signal flsb_2 : level2_t;
    signal flsb_3 : level3_t;
    signal flsb_4 : level4_t;
    signal flsb_5 : level5_t;
    signal flsb_6 : level6_t;
    signal flsb_7 : level7_t;
    signal flsb_8 : level8_t;

    function diagonal_shift(x : unsigned; sh : natural) return acc_t is
        variable y : acc_t := (others => '0');
    begin
        y(sh + x'length - 1 downto sh) := x;
        return y;
    end function;

begin

    a_vec <= (
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
        124 => a124, 125 => a125, 126 => a126, 127 => a127,
        128 => a128, 129 => a129, 130 => a130, 131 => a131,
        132 => a132, 133 => a133, 134 => a134, 135 => a135,
        136 => a136, 137 => a137, 138 => a138, 139 => a139,
        140 => a140, 141 => a141, 142 => a142, 143 => a143,
        144 => a144, 145 => a145, 146 => a146, 147 => a147,
        148 => a148, 149 => a149, 150 => a150, 151 => a151,
        152 => a152, 153 => a153, 154 => a154, 155 => a155,
        156 => a156, 157 => a157, 158 => a158, 159 => a159,
        160 => a160, 161 => a161, 162 => a162, 163 => a163,
        164 => a164, 165 => a165, 166 => a166, 167 => a167,
        168 => a168, 169 => a169, 170 => a170, 171 => a171,
        172 => a172, 173 => a173, 174 => a174, 175 => a175,
        176 => a176, 177 => a177, 178 => a178, 179 => a179,
        180 => a180, 181 => a181, 182 => a182, 183 => a183,
        184 => a184, 185 => a185, 186 => a186, 187 => a187,
        188 => a188, 189 => a189, 190 => a190, 191 => a191,
        192 => a192, 193 => a193, 194 => a194, 195 => a195,
        196 => a196, 197 => a197, 198 => a198, 199 => a199,
        200 => a200, 201 => a201, 202 => a202, 203 => a203,
        204 => a204, 205 => a205, 206 => a206, 207 => a207,
        208 => a208, 209 => a209, 210 => a210, 211 => a211,
        212 => a212, 213 => a213, 214 => a214, 215 => a215,
        216 => a216, 217 => a217, 218 => a218, 219 => a219,
        220 => a220, 221 => a221, 222 => a222, 223 => a223,
        224 => a224, 225 => a225, 226 => a226, 227 => a227,
        228 => a228, 229 => a229, 230 => a230, 231 => a231,
        232 => a232, 233 => a233, 234 => a234, 235 => a235,
        236 => a236, 237 => a237, 238 => a238, 239 => a239,
        240 => a240, 241 => a241, 242 => a242, 243 => a243,
        244 => a244, 245 => a245, 246 => a246, 247 => a247,
        248 => a248, 249 => a249, 250 => a250, 251 => a251,
        252 => a252, 253 => a253, 254 => a254, 255 => a255
    );

    --------------------------------------------------------------------------
    -- Nível 1: termos diagonais
    -- flsb_1(0) = a0, flsb_1(1) = a1 << 1, ...
    --------------------------------------------------------------------------
    gen_diag : for i in 0 to 255 generate
        flsb_1(i) <= diagonal_shift(a_vec(i), i);
    end generate;

    --------------------------------------------------------------------------
    -- Árvore de soma
    --------------------------------------------------------------------------
    gen_l2 : for i in 0 to 127 generate
        flsb_2(i) <= flsb_1(2*i) + flsb_1(2*i + 1);
    end generate;

    gen_l3 : for i in 0 to 63 generate
        flsb_3(i) <= flsb_2(2*i) + flsb_2(2*i + 1);
    end generate;

    gen_l4 : for i in 0 to 31 generate
        flsb_4(i) <= flsb_3(2*i) + flsb_3(2*i + 1);
    end generate;

    gen_l5 : for i in 0 to 15 generate
        flsb_5(i) <= flsb_4(2*i) + flsb_4(2*i + 1);
    end generate;

    gen_l6 : for i in 0 to 7 generate
        flsb_6(i) <= flsb_5(2*i) + flsb_5(2*i + 1);
    end generate;

    gen_l7 : for i in 0 to 3 generate
        flsb_7(i) <= flsb_6(2*i) + flsb_6(2*i + 1);
    end generate;

    gen_l8 : for i in 0 to 1 generate
        flsb_8(i) <= flsb_7(2*i) + flsb_7(2*i + 1);
    end generate;

    --------------------------------------------------------------------------
    -- Resultado final
    --------------------------------------------------------------------------
    sum <= flsb_8(0) + flsb_8(1);



end architecture;
