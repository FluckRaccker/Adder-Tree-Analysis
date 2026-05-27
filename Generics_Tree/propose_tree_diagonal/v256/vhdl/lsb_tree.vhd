library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tree_lsb is
    generic(n : integer := 16);
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
        a124, a125, a126, a127,
        a128, a129, a130, a131,
        a132, a133, a134, a135,
        a136, a137, a138, a139,
        a140, a141, a142, a143,
        a144, a145, a146, a147,
        a148, a149, a150, a151,
        a152, a153, a154, a155,
        a156, a157, a158, a159,
        a160, a161, a162, a163,
        a164, a165, a166, a167,
        a168, a169, a170, a171,
        a172, a173, a174, a175,
        a176, a177, a178, a179,
        a180, a181, a182, a183,
        a184, a185, a186, a187,
        a188, a189, a190, a191,
        a192, a193, a194, a195,
        a196, a197, a198, a199,
        a200, a201, a202, a203,
        a204, a205, a206, a207,
        a208, a209, a210, a211,
        a212, a213, a214, a215,
        a216, a217, a218, a219,
        a220, a221, a222, a223,
        a224, a225, a226, a227,
        a228, a229, a230, a231,
        a232, a233, a234, a235,
        a236, a237, a238, a239,
        a240, a241, a242, a243,
        a244, a245, a246, a247,
        a248, a249, a250, a251,
        a252, a253, a254, a255 : in unsigned(n-1 downto 0);
        sum : out unsigned(n+7 downto 0)
    );
end tree_lsb;

architecture rtl of tree_lsb is
    
    -- nível 1
    signal flsb_1_0, flsb_1_1, flsb_1_2, flsb_1_3 : unsigned(n downto 0);
    signal flsb_1_4, flsb_1_5, flsb_1_6, flsb_1_7 : unsigned(n downto 0);
    signal flsb_1_8, flsb_1_9, flsb_1_10, flsb_1_11 : unsigned(n downto 0);
    signal flsb_1_12, flsb_1_13, flsb_1_14, flsb_1_15 : unsigned(n downto 0);
    signal flsb_1_16, flsb_1_17, flsb_1_18, flsb_1_19 : unsigned(n downto 0);
    signal flsb_1_20, flsb_1_21, flsb_1_22, flsb_1_23 : unsigned(n downto 0);
    signal flsb_1_24, flsb_1_25, flsb_1_26, flsb_1_27 : unsigned(n downto 0);
    signal flsb_1_28, flsb_1_29, flsb_1_30, flsb_1_31 : unsigned(n downto 0);
    signal flsb_1_32, flsb_1_33, flsb_1_34, flsb_1_35 : unsigned(n downto 0);
    signal flsb_1_36, flsb_1_37, flsb_1_38, flsb_1_39 : unsigned(n downto 0);
    signal flsb_1_40, flsb_1_41, flsb_1_42, flsb_1_43 : unsigned(n downto 0);
    signal flsb_1_44, flsb_1_45, flsb_1_46, flsb_1_47 : unsigned(n downto 0);
    signal flsb_1_48, flsb_1_49, flsb_1_50, flsb_1_51 : unsigned(n downto 0);
    signal flsb_1_52, flsb_1_53, flsb_1_54, flsb_1_55 : unsigned(n downto 0);
    signal flsb_1_56, flsb_1_57, flsb_1_58, flsb_1_59 : unsigned(n downto 0);
    signal flsb_1_60, flsb_1_61, flsb_1_62, flsb_1_63 : unsigned(n downto 0);
    signal flsb_1_64, flsb_1_65, flsb_1_66, flsb_1_67 : unsigned(n downto 0);
    signal flsb_1_68, flsb_1_69, flsb_1_70, flsb_1_71 : unsigned(n downto 0);
    signal flsb_1_72, flsb_1_73, flsb_1_74, flsb_1_75 : unsigned(n downto 0);
    signal flsb_1_76, flsb_1_77, flsb_1_78, flsb_1_79 : unsigned(n downto 0);
    signal flsb_1_80, flsb_1_81, flsb_1_82, flsb_1_83 : unsigned(n downto 0);
    signal flsb_1_84, flsb_1_85, flsb_1_86, flsb_1_87 : unsigned(n downto 0);
    signal flsb_1_88, flsb_1_89, flsb_1_90, flsb_1_91 : unsigned(n downto 0);
    signal flsb_1_92, flsb_1_93, flsb_1_94, flsb_1_95 : unsigned(n downto 0);
    signal flsb_1_96, flsb_1_97, flsb_1_98, flsb_1_99 : unsigned(n downto 0);
    signal flsb_1_100, flsb_1_101, flsb_1_102, flsb_1_103 : unsigned(n downto 0);
    signal flsb_1_104, flsb_1_105, flsb_1_106, flsb_1_107 : unsigned(n downto 0);
    signal flsb_1_108, flsb_1_109, flsb_1_110, flsb_1_111 : unsigned(n downto 0);
    signal flsb_1_112, flsb_1_113, flsb_1_114, flsb_1_115 : unsigned(n downto 0);
    signal flsb_1_116, flsb_1_117, flsb_1_118, flsb_1_119 : unsigned(n downto 0);
    signal flsb_1_120, flsb_1_121, flsb_1_122, flsb_1_123 : unsigned(n downto 0);
    signal flsb_1_124, flsb_1_125, flsb_1_126, flsb_1_127 : unsigned(n downto 0);

    -- nível 2
    signal flsb_2_0, flsb_2_1, flsb_2_2, flsb_2_3 : unsigned(n+1 downto 0);
    signal flsb_2_4, flsb_2_5, flsb_2_6, flsb_2_7 : unsigned(n+1 downto 0);
    signal flsb_2_8, flsb_2_9, flsb_2_10, flsb_2_11 : unsigned(n+1 downto 0);
    signal flsb_2_12, flsb_2_13, flsb_2_14, flsb_2_15 : unsigned(n+1 downto 0);
    signal flsb_2_16, flsb_2_17, flsb_2_18, flsb_2_19 : unsigned(n+1 downto 0);
    signal flsb_2_20, flsb_2_21, flsb_2_22, flsb_2_23 : unsigned(n+1 downto 0);
    signal flsb_2_24, flsb_2_25, flsb_2_26, flsb_2_27 : unsigned(n+1 downto 0);
    signal flsb_2_28, flsb_2_29, flsb_2_30, flsb_2_31 : unsigned(n+1 downto 0);
    signal flsb_2_32, flsb_2_33, flsb_2_34, flsb_2_35 : unsigned(n+1 downto 0);
    signal flsb_2_36, flsb_2_37, flsb_2_38, flsb_2_39 : unsigned(n+1 downto 0);
    signal flsb_2_40, flsb_2_41, flsb_2_42, flsb_2_43 : unsigned(n+1 downto 0);
    signal flsb_2_44, flsb_2_45, flsb_2_46, flsb_2_47 : unsigned(n+1 downto 0);
    signal flsb_2_48, flsb_2_49, flsb_2_50, flsb_2_51 : unsigned(n+1 downto 0);
    signal flsb_2_52, flsb_2_53, flsb_2_54, flsb_2_55 : unsigned(n+1 downto 0);
    signal flsb_2_56, flsb_2_57, flsb_2_58, flsb_2_59 : unsigned(n+1 downto 0);
    signal flsb_2_60, flsb_2_61, flsb_2_62, flsb_2_63 : unsigned(n+1 downto 0);

    -- nível 3
    signal flsb_3_0, flsb_3_1, flsb_3_2, flsb_3_3 : unsigned(n+2 downto 0);
    signal flsb_3_4, flsb_3_5, flsb_3_6, flsb_3_7 : unsigned(n+2 downto 0);
    signal flsb_3_8, flsb_3_9, flsb_3_10, flsb_3_11 : unsigned(n+2 downto 0);
    signal flsb_3_12, flsb_3_13, flsb_3_14, flsb_3_15 : unsigned(n+2 downto 0);
    signal flsb_3_16, flsb_3_17, flsb_3_18, flsb_3_19 : unsigned(n+2 downto 0);
    signal flsb_3_20, flsb_3_21, flsb_3_22, flsb_3_23 : unsigned(n+2 downto 0);
    signal flsb_3_24, flsb_3_25, flsb_3_26, flsb_3_27 : unsigned(n+2 downto 0);
    signal flsb_3_28, flsb_3_29, flsb_3_30, flsb_3_31 : unsigned(n+2 downto 0);

    -- nível 4
    signal flsb_4_0, flsb_4_1, flsb_4_2, flsb_4_3 : unsigned(n+3 downto 0);
    signal flsb_4_4, flsb_4_5, flsb_4_6, flsb_4_7 : unsigned(n+3 downto 0);
    signal flsb_4_8, flsb_4_9, flsb_4_10, flsb_4_11 : unsigned(n+3 downto 0);
    signal flsb_4_12, flsb_4_13, flsb_4_14, flsb_4_15 : unsigned(n+3 downto 0);

    -- nível 5
    signal flsb_5_0, flsb_5_1, flsb_5_2, flsb_5_3 : unsigned(n+4 downto 0);
    signal flsb_5_4, flsb_5_5, flsb_5_6, flsb_5_7 : unsigned(n+4 downto 0);

    -- nível 6
    signal flsb_6_0, flsb_6_1, flsb_6_2, flsb_6_3 : unsigned(n+5 downto 0);

    -- nível 7
    signal flsb_7_0, flsb_7_1 : unsigned(n+6 downto 0);

    -- nível 8
    signal flsb_8_0 : unsigned(n+7 downto 0);

begin

    --------------------------------------------------------------------------
    -- Nível 1 (128 somas)
    --------------------------------------------------------------------------
    flsb_1_0 <= ('0' & a0) + ('0' & a1);
    flsb_1_1 <= ('0' & a2) + ('0' & a3);
    flsb_1_2 <= ('0' & a4) + ('0' & a5);
    flsb_1_3 <= ('0' & a6) + ('0' & a7);
    flsb_1_4 <= ('0' & a8) + ('0' & a9);
    flsb_1_5 <= ('0' & a10) + ('0' & a11);
    flsb_1_6 <= ('0' & a12) + ('0' & a13);
    flsb_1_7 <= ('0' & a14) + ('0' & a15);
    flsb_1_8 <= ('0' & a16) + ('0' & a17);
    flsb_1_9 <= ('0' & a18) + ('0' & a19);
    flsb_1_10 <= ('0' & a20) + ('0' & a21);
    flsb_1_11 <= ('0' & a22) + ('0' & a23);
    flsb_1_12 <= ('0' & a24) + ('0' & a25);
    flsb_1_13 <= ('0' & a26) + ('0' & a27);
    flsb_1_14 <= ('0' & a28) + ('0' & a29);
    flsb_1_15 <= ('0' & a30) + ('0' & a31);
    flsb_1_16 <= ('0' & a32) + ('0' & a33);
    flsb_1_17 <= ('0' & a34) + ('0' & a35);
    flsb_1_18 <= ('0' & a36) + ('0' & a37);
    flsb_1_19 <= ('0' & a38) + ('0' & a39);
    flsb_1_20 <= ('0' & a40) + ('0' & a41);
    flsb_1_21 <= ('0' & a42) + ('0' & a43);
    flsb_1_22 <= ('0' & a44) + ('0' & a45);
    flsb_1_23 <= ('0' & a46) + ('0' & a47);
    flsb_1_24 <= ('0' & a48) + ('0' & a49);
    flsb_1_25 <= ('0' & a50) + ('0' & a51);
    flsb_1_26 <= ('0' & a52) + ('0' & a53);
    flsb_1_27 <= ('0' & a54) + ('0' & a55);
    flsb_1_28 <= ('0' & a56) + ('0' & a57);
    flsb_1_29 <= ('0' & a58) + ('0' & a59);
    flsb_1_30 <= ('0' & a60) + ('0' & a61);
    flsb_1_31 <= ('0' & a62) + ('0' & a63);
    flsb_1_32 <= ('0' & a64) + ('0' & a65);
    flsb_1_33 <= ('0' & a66) + ('0' & a67);
    flsb_1_34 <= ('0' & a68) + ('0' & a69);
    flsb_1_35 <= ('0' & a70) + ('0' & a71);
    flsb_1_36 <= ('0' & a72) + ('0' & a73);
    flsb_1_37 <= ('0' & a74) + ('0' & a75);
    flsb_1_38 <= ('0' & a76) + ('0' & a77);
    flsb_1_39 <= ('0' & a78) + ('0' & a79);
    flsb_1_40 <= ('0' & a80) + ('0' & a81);
    flsb_1_41 <= ('0' & a82) + ('0' & a83);
    flsb_1_42 <= ('0' & a84) + ('0' & a85);
    flsb_1_43 <= ('0' & a86) + ('0' & a87);
    flsb_1_44 <= ('0' & a88) + ('0' & a89);
    flsb_1_45 <= ('0' & a90) + ('0' & a91);
    flsb_1_46 <= ('0' & a92) + ('0' & a93);
    flsb_1_47 <= ('0' & a94) + ('0' & a95);
    flsb_1_48 <= ('0' & a96) + ('0' & a97);
    flsb_1_49 <= ('0' & a98) + ('0' & a99);
    flsb_1_50 <= ('0' & a100) + ('0' & a101);
    flsb_1_51 <= ('0' & a102) + ('0' & a103);
    flsb_1_52 <= ('0' & a104) + ('0' & a105);
    flsb_1_53 <= ('0' & a106) + ('0' & a107);
    flsb_1_54 <= ('0' & a108) + ('0' & a109);
    flsb_1_55 <= ('0' & a110) + ('0' & a111);
    flsb_1_56 <= ('0' & a112) + ('0' & a113);
    flsb_1_57 <= ('0' & a114) + ('0' & a115);
    flsb_1_58 <= ('0' & a116) + ('0' & a117);
    flsb_1_59 <= ('0' & a118) + ('0' & a119);
    flsb_1_60 <= ('0' & a120) + ('0' & a121);
    flsb_1_61 <= ('0' & a122) + ('0' & a123);
    flsb_1_62 <= ('0' & a124) + ('0' & a125);
    flsb_1_63 <= ('0' & a126) + ('0' & a127);
    flsb_1_64 <= ('0' & a128) + ('0' & a129);
    flsb_1_65 <= ('0' & a130) + ('0' & a131);
    flsb_1_66 <= ('0' & a132) + ('0' & a133);
    flsb_1_67 <= ('0' & a134) + ('0' & a135);
    flsb_1_68 <= ('0' & a136) + ('0' & a137);
    flsb_1_69 <= ('0' & a138) + ('0' & a139);
    flsb_1_70 <= ('0' & a140) + ('0' & a141);
    flsb_1_71 <= ('0' & a142) + ('0' & a143);
    flsb_1_72 <= ('0' & a144) + ('0' & a145);
    flsb_1_73 <= ('0' & a146) + ('0' & a147);
    flsb_1_74 <= ('0' & a148) + ('0' & a149);
    flsb_1_75 <= ('0' & a150) + ('0' & a151);
    flsb_1_76 <= ('0' & a152) + ('0' & a153);
    flsb_1_77 <= ('0' & a154) + ('0' & a155);
    flsb_1_78 <= ('0' & a156) + ('0' & a157);
    flsb_1_79 <= ('0' & a158) + ('0' & a159);
    flsb_1_80 <= ('0' & a160) + ('0' & a161);
    flsb_1_81 <= ('0' & a162) + ('0' & a163);
    flsb_1_82 <= ('0' & a164) + ('0' & a165);
    flsb_1_83 <= ('0' & a166) + ('0' & a167);
    flsb_1_84 <= ('0' & a168) + ('0' & a169);
    flsb_1_85 <= ('0' & a170) + ('0' & a171);
    flsb_1_86 <= ('0' & a172) + ('0' & a173);
    flsb_1_87 <= ('0' & a174) + ('0' & a175);
    flsb_1_88 <= ('0' & a176) + ('0' & a177);
    flsb_1_89 <= ('0' & a178) + ('0' & a179);
    flsb_1_90 <= ('0' & a180) + ('0' & a181);
    flsb_1_91 <= ('0' & a182) + ('0' & a183);
    flsb_1_92 <= ('0' & a184) + ('0' & a185);
    flsb_1_93 <= ('0' & a186) + ('0' & a187);
    flsb_1_94 <= ('0' & a188) + ('0' & a189);
    flsb_1_95 <= ('0' & a190) + ('0' & a191);
    flsb_1_96 <= ('0' & a192) + ('0' & a193);
    flsb_1_97 <= ('0' & a194) + ('0' & a195);
    flsb_1_98 <= ('0' & a196) + ('0' & a197);
    flsb_1_99 <= ('0' & a198) + ('0' & a199);
    flsb_1_100 <= ('0' & a200) + ('0' & a201);
    flsb_1_101 <= ('0' & a202) + ('0' & a203);
    flsb_1_102 <= ('0' & a204) + ('0' & a205);
    flsb_1_103 <= ('0' & a206) + ('0' & a207);
    flsb_1_104 <= ('0' & a208) + ('0' & a209);
    flsb_1_105 <= ('0' & a210) + ('0' & a211);
    flsb_1_106 <= ('0' & a212) + ('0' & a213);
    flsb_1_107 <= ('0' & a214) + ('0' & a215);
    flsb_1_108 <= ('0' & a216) + ('0' & a217);
    flsb_1_109 <= ('0' & a218) + ('0' & a219);
    flsb_1_110 <= ('0' & a220) + ('0' & a221);
    flsb_1_111 <= ('0' & a222) + ('0' & a223);
    flsb_1_112 <= ('0' & a224) + ('0' & a225);
    flsb_1_113 <= ('0' & a226) + ('0' & a227);
    flsb_1_114 <= ('0' & a228) + ('0' & a229);
    flsb_1_115 <= ('0' & a230) + ('0' & a231);
    flsb_1_116 <= ('0' & a232) + ('0' & a233);
    flsb_1_117 <= ('0' & a234) + ('0' & a235);
    flsb_1_118 <= ('0' & a236) + ('0' & a237);
    flsb_1_119 <= ('0' & a238) + ('0' & a239);
    flsb_1_120 <= ('0' & a240) + ('0' & a241);
    flsb_1_121 <= ('0' & a242) + ('0' & a243);
    flsb_1_122 <= ('0' & a244) + ('0' & a245);
    flsb_1_123 <= ('0' & a246) + ('0' & a247);
    flsb_1_124 <= ('0' & a248) + ('0' & a249);
    flsb_1_125 <= ('0' & a250) + ('0' & a251);
    flsb_1_126 <= ('0' & a252) + ('0' & a253);
    flsb_1_127 <= ('0' & a254) + ('0' & a255);

    --------------------------------------------------------------------------
    -- Nível 2 (64 somas)
    --------------------------------------------------------------------------
    flsb_2_0 <= ('0' & flsb_1_0) + ('0' & flsb_1_1);
    flsb_2_1 <= ('0' & flsb_1_2) + ('0' & flsb_1_3);
    flsb_2_2 <= ('0' & flsb_1_4) + ('0' & flsb_1_5);
    flsb_2_3 <= ('0' & flsb_1_6) + ('0' & flsb_1_7);
    flsb_2_4 <= ('0' & flsb_1_8) + ('0' & flsb_1_9);
    flsb_2_5 <= ('0' & flsb_1_10) + ('0' & flsb_1_11);
    flsb_2_6 <= ('0' & flsb_1_12) + ('0' & flsb_1_13);
    flsb_2_7 <= ('0' & flsb_1_14) + ('0' & flsb_1_15);
    flsb_2_8 <= ('0' & flsb_1_16) + ('0' & flsb_1_17);
    flsb_2_9 <= ('0' & flsb_1_18) + ('0' & flsb_1_19);
    flsb_2_10 <= ('0' & flsb_1_20) + ('0' & flsb_1_21);
    flsb_2_11 <= ('0' & flsb_1_22) + ('0' & flsb_1_23);
    flsb_2_12 <= ('0' & flsb_1_24) + ('0' & flsb_1_25);
    flsb_2_13 <= ('0' & flsb_1_26) + ('0' & flsb_1_27);
    flsb_2_14 <= ('0' & flsb_1_28) + ('0' & flsb_1_29);
    flsb_2_15 <= ('0' & flsb_1_30) + ('0' & flsb_1_31);
    flsb_2_16 <= ('0' & flsb_1_32) + ('0' & flsb_1_33);
    flsb_2_17 <= ('0' & flsb_1_34) + ('0' & flsb_1_35);
    flsb_2_18 <= ('0' & flsb_1_36) + ('0' & flsb_1_37);
    flsb_2_19 <= ('0' & flsb_1_38) + ('0' & flsb_1_39);
    flsb_2_20 <= ('0' & flsb_1_40) + ('0' & flsb_1_41);
    flsb_2_21 <= ('0' & flsb_1_42) + ('0' & flsb_1_43);
    flsb_2_22 <= ('0' & flsb_1_44) + ('0' & flsb_1_45);
    flsb_2_23 <= ('0' & flsb_1_46) + ('0' & flsb_1_47);
    flsb_2_24 <= ('0' & flsb_1_48) + ('0' & flsb_1_49);
    flsb_2_25 <= ('0' & flsb_1_50) + ('0' & flsb_1_51);
    flsb_2_26 <= ('0' & flsb_1_52) + ('0' & flsb_1_53);
    flsb_2_27 <= ('0' & flsb_1_54) + ('0' & flsb_1_55);
    flsb_2_28 <= ('0' & flsb_1_56) + ('0' & flsb_1_57);
    flsb_2_29 <= ('0' & flsb_1_58) + ('0' & flsb_1_59);
    flsb_2_30 <= ('0' & flsb_1_60) + ('0' & flsb_1_61);
    flsb_2_31 <= ('0' & flsb_1_62) + ('0' & flsb_1_63);
    flsb_2_32 <= ('0' & flsb_1_64) + ('0' & flsb_1_65);
    flsb_2_33 <= ('0' & flsb_1_66) + ('0' & flsb_1_67);
    flsb_2_34 <= ('0' & flsb_1_68) + ('0' & flsb_1_69);
    flsb_2_35 <= ('0' & flsb_1_70) + ('0' & flsb_1_71);
    flsb_2_36 <= ('0' & flsb_1_72) + ('0' & flsb_1_73);
    flsb_2_37 <= ('0' & flsb_1_74) + ('0' & flsb_1_75);
    flsb_2_38 <= ('0' & flsb_1_76) + ('0' & flsb_1_77);
    flsb_2_39 <= ('0' & flsb_1_78) + ('0' & flsb_1_79);
    flsb_2_40 <= ('0' & flsb_1_80) + ('0' & flsb_1_81);
    flsb_2_41 <= ('0' & flsb_1_82) + ('0' & flsb_1_83);
    flsb_2_42 <= ('0' & flsb_1_84) + ('0' & flsb_1_85);
    flsb_2_43 <= ('0' & flsb_1_86) + ('0' & flsb_1_87);
    flsb_2_44 <= ('0' & flsb_1_88) + ('0' & flsb_1_89);
    flsb_2_45 <= ('0' & flsb_1_90) + ('0' & flsb_1_91);
    flsb_2_46 <= ('0' & flsb_1_92) + ('0' & flsb_1_93);
    flsb_2_47 <= ('0' & flsb_1_94) + ('0' & flsb_1_95);
    flsb_2_48 <= ('0' & flsb_1_96) + ('0' & flsb_1_97);
    flsb_2_49 <= ('0' & flsb_1_98) + ('0' & flsb_1_99);
    flsb_2_50 <= ('0' & flsb_1_100) + ('0' & flsb_1_101);
    flsb_2_51 <= ('0' & flsb_1_102) + ('0' & flsb_1_103);
    flsb_2_52 <= ('0' & flsb_1_104) + ('0' & flsb_1_105);
    flsb_2_53 <= ('0' & flsb_1_106) + ('0' & flsb_1_107);
    flsb_2_54 <= ('0' & flsb_1_108) + ('0' & flsb_1_109);
    flsb_2_55 <= ('0' & flsb_1_110) + ('0' & flsb_1_111);
    flsb_2_56 <= ('0' & flsb_1_112) + ('0' & flsb_1_113);
    flsb_2_57 <= ('0' & flsb_1_114) + ('0' & flsb_1_115);
    flsb_2_58 <= ('0' & flsb_1_116) + ('0' & flsb_1_117);
    flsb_2_59 <= ('0' & flsb_1_118) + ('0' & flsb_1_119);
    flsb_2_60 <= ('0' & flsb_1_120) + ('0' & flsb_1_121);
    flsb_2_61 <= ('0' & flsb_1_122) + ('0' & flsb_1_123);
    flsb_2_62 <= ('0' & flsb_1_124) + ('0' & flsb_1_125);
    flsb_2_63 <= ('0' & flsb_1_126) + ('0' & flsb_1_127);

    --------------------------------------------------------------------------
    -- Nível 3 (32 somas)
    --------------------------------------------------------------------------
    flsb_3_0 <= ('0' & flsb_2_0) + ('0' & flsb_2_1);
    flsb_3_1 <= ('0' & flsb_2_2) + ('0' & flsb_2_3);
    flsb_3_2 <= ('0' & flsb_2_4) + ('0' & flsb_2_5);
    flsb_3_3 <= ('0' & flsb_2_6) + ('0' & flsb_2_7);
    flsb_3_4 <= ('0' & flsb_2_8) + ('0' & flsb_2_9);
    flsb_3_5 <= ('0' & flsb_2_10) + ('0' & flsb_2_11);
    flsb_3_6 <= ('0' & flsb_2_12) + ('0' & flsb_2_13);
    flsb_3_7 <= ('0' & flsb_2_14) + ('0' & flsb_2_15);
    flsb_3_8 <= ('0' & flsb_2_16) + ('0' & flsb_2_17);
    flsb_3_9 <= ('0' & flsb_2_18) + ('0' & flsb_2_19);
    flsb_3_10 <= ('0' & flsb_2_20) + ('0' & flsb_2_21);
    flsb_3_11 <= ('0' & flsb_2_22) + ('0' & flsb_2_23);
    flsb_3_12 <= ('0' & flsb_2_24) + ('0' & flsb_2_25);
    flsb_3_13 <= ('0' & flsb_2_26) + ('0' & flsb_2_27);
    flsb_3_14 <= ('0' & flsb_2_28) + ('0' & flsb_2_29);
    flsb_3_15 <= ('0' & flsb_2_30) + ('0' & flsb_2_31);
    flsb_3_16 <= ('0' & flsb_2_32) + ('0' & flsb_2_33);
    flsb_3_17 <= ('0' & flsb_2_34) + ('0' & flsb_2_35);
    flsb_3_18 <= ('0' & flsb_2_36) + ('0' & flsb_2_37);
    flsb_3_19 <= ('0' & flsb_2_38) + ('0' & flsb_2_39);
    flsb_3_20 <= ('0' & flsb_2_40) + ('0' & flsb_2_41);
    flsb_3_21 <= ('0' & flsb_2_42) + ('0' & flsb_2_43);
    flsb_3_22 <= ('0' & flsb_2_44) + ('0' & flsb_2_45);
    flsb_3_23 <= ('0' & flsb_2_46) + ('0' & flsb_2_47);
    flsb_3_24 <= ('0' & flsb_2_48) + ('0' & flsb_2_49);
    flsb_3_25 <= ('0' & flsb_2_50) + ('0' & flsb_2_51);
    flsb_3_26 <= ('0' & flsb_2_52) + ('0' & flsb_2_53);
    flsb_3_27 <= ('0' & flsb_2_54) + ('0' & flsb_2_55);
    flsb_3_28 <= ('0' & flsb_2_56) + ('0' & flsb_2_57);
    flsb_3_29 <= ('0' & flsb_2_58) + ('0' & flsb_2_59);
    flsb_3_30 <= ('0' & flsb_2_60) + ('0' & flsb_2_61);
    flsb_3_31 <= ('0' & flsb_2_62) + ('0' & flsb_2_63);

    --------------------------------------------------------------------------
    -- Nível 4 (16 somas)
    --------------------------------------------------------------------------
    flsb_4_0 <= ('0' & flsb_3_0) + ('0' & flsb_3_1);
    flsb_4_1 <= ('0' & flsb_3_2) + ('0' & flsb_3_3);
    flsb_4_2 <= ('0' & flsb_3_4) + ('0' & flsb_3_5);
    flsb_4_3 <= ('0' & flsb_3_6) + ('0' & flsb_3_7);
    flsb_4_4 <= ('0' & flsb_3_8) + ('0' & flsb_3_9);
    flsb_4_5 <= ('0' & flsb_3_10) + ('0' & flsb_3_11);
    flsb_4_6 <= ('0' & flsb_3_12) + ('0' & flsb_3_13);
    flsb_4_7 <= ('0' & flsb_3_14) + ('0' & flsb_3_15);
    flsb_4_8 <= ('0' & flsb_3_16) + ('0' & flsb_3_17);
    flsb_4_9 <= ('0' & flsb_3_18) + ('0' & flsb_3_19);
    flsb_4_10 <= ('0' & flsb_3_20) + ('0' & flsb_3_21);
    flsb_4_11 <= ('0' & flsb_3_22) + ('0' & flsb_3_23);
    flsb_4_12 <= ('0' & flsb_3_24) + ('0' & flsb_3_25);
    flsb_4_13 <= ('0' & flsb_3_26) + ('0' & flsb_3_27);
    flsb_4_14 <= ('0' & flsb_3_28) + ('0' & flsb_3_29);
    flsb_4_15 <= ('0' & flsb_3_30) + ('0' & flsb_3_31);

    --------------------------------------------------------------------------
    -- Nível 5 (8 somas)
    --------------------------------------------------------------------------
    flsb_5_0 <= ('0' & flsb_4_0) + ('0' & flsb_4_1);
    flsb_5_1 <= ('0' & flsb_4_2) + ('0' & flsb_4_3);
    flsb_5_2 <= ('0' & flsb_4_4) + ('0' & flsb_4_5);
    flsb_5_3 <= ('0' & flsb_4_6) + ('0' & flsb_4_7);
    flsb_5_4 <= ('0' & flsb_4_8) + ('0' & flsb_4_9);
    flsb_5_5 <= ('0' & flsb_4_10) + ('0' & flsb_4_11);
    flsb_5_6 <= ('0' & flsb_4_12) + ('0' & flsb_4_13);
    flsb_5_7 <= ('0' & flsb_4_14) + ('0' & flsb_4_15);

    --------------------------------------------------------------------------
    -- Nível 6 (4 somas)
    --------------------------------------------------------------------------
    flsb_6_0 <= ('0' & flsb_5_0) + ('0' & flsb_5_1);
    flsb_6_1 <= ('0' & flsb_5_2) + ('0' & flsb_5_3);
    flsb_6_2 <= ('0' & flsb_5_4) + ('0' & flsb_5_5);
    flsb_6_3 <= ('0' & flsb_5_6) + ('0' & flsb_5_7);

    --------------------------------------------------------------------------
    -- Nível 7 (2 somas)
    --------------------------------------------------------------------------
    flsb_7_0 <= ('0' & flsb_6_0) + ('0' & flsb_6_1);
    flsb_7_1 <= ('0' & flsb_6_2) + ('0' & flsb_6_3);

    --------------------------------------------------------------------------
    -- Nível 8 (1 somas)
    --------------------------------------------------------------------------
    flsb_8_0 <= ('0' & flsb_7_0) + ('0' & flsb_7_1);

    
    --------------------------------------------------------------------------
    -- Resultado final
    --------------------------------------------------------------------------
    sum <= flsb_8_0;

end architecture;