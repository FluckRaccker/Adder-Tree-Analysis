
    library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

    entity sum256xn is

    generic(n : integer := 512);
    port (
            a0, a1, a2, a3,
        a4, a5, a6, a7,
        a8, a9, a10, a11,
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
        a60, a61, a62, a63,
        a64, a65, a66, a67,
        a68, a69, a70, a71,
        a72, a73, a74, a75,
        a76, a77, a78, a79,
        a80, a81, a82, a83,
        a84, a85, a86, a87,
        a88, a89, a90, a91,
        a92, a93, a94, a95,
        a96, a97, a98, a99,
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
    sum : out unsigned(n-1 downto 0)
    );
    end sum256xn;

    architecture rtl of sum256xn is
    
    -- nível 1
    signal flsb_1_0, flsb_1_1, flsb_1_2, flsb_1_3 : unsigned(n-1 downto 0);
    signal flsb_1_4, flsb_1_5, flsb_1_6, flsb_1_7 : unsigned(n-1 downto 0);
    signal flsb_1_8, flsb_1_9, flsb_1_10, flsb_1_11 : unsigned(n-1 downto 0);
    signal flsb_1_12, flsb_1_13, flsb_1_14, flsb_1_15 : unsigned(n-1 downto 0);
    signal flsb_1_16, flsb_1_17, flsb_1_18, flsb_1_19 : unsigned(n-1 downto 0);
    signal flsb_1_20, flsb_1_21, flsb_1_22, flsb_1_23 : unsigned(n-1 downto 0);
    signal flsb_1_24, flsb_1_25, flsb_1_26, flsb_1_27 : unsigned(n-1 downto 0);
    signal flsb_1_28, flsb_1_29, flsb_1_30, flsb_1_31 : unsigned(n-1 downto 0);
    signal flsb_1_32, flsb_1_33, flsb_1_34, flsb_1_35 : unsigned(n-1 downto 0);
    signal flsb_1_36, flsb_1_37, flsb_1_38, flsb_1_39 : unsigned(n-1 downto 0);
    signal flsb_1_40, flsb_1_41, flsb_1_42, flsb_1_43 : unsigned(n-1 downto 0);
    signal flsb_1_44, flsb_1_45, flsb_1_46, flsb_1_47 : unsigned(n-1 downto 0);
    signal flsb_1_48, flsb_1_49, flsb_1_50, flsb_1_51 : unsigned(n-1 downto 0);
    signal flsb_1_52, flsb_1_53, flsb_1_54, flsb_1_55 : unsigned(n-1 downto 0);
    signal flsb_1_56, flsb_1_57, flsb_1_58, flsb_1_59 : unsigned(n-1 downto 0);
    signal flsb_1_60, flsb_1_61, flsb_1_62, flsb_1_63 : unsigned(n-1 downto 0);
    signal flsb_1_64, flsb_1_65, flsb_1_66, flsb_1_67 : unsigned(n-1 downto 0);
    signal flsb_1_68, flsb_1_69, flsb_1_70, flsb_1_71 : unsigned(n-1 downto 0);
    signal flsb_1_72, flsb_1_73, flsb_1_74, flsb_1_75 : unsigned(n-1 downto 0);
    signal flsb_1_76, flsb_1_77, flsb_1_78, flsb_1_79 : unsigned(n-1 downto 0);
    signal flsb_1_80, flsb_1_81, flsb_1_82, flsb_1_83 : unsigned(n-1 downto 0);
    signal flsb_1_84, flsb_1_85, flsb_1_86, flsb_1_87 : unsigned(n-1 downto 0);
    signal flsb_1_88, flsb_1_89, flsb_1_90, flsb_1_91 : unsigned(n-1 downto 0);
    signal flsb_1_92, flsb_1_93, flsb_1_94, flsb_1_95 : unsigned(n-1 downto 0);
    signal flsb_1_96, flsb_1_97, flsb_1_98, flsb_1_99 : unsigned(n-1 downto 0);
    signal flsb_1_100, flsb_1_101, flsb_1_102, flsb_1_103 : unsigned(n-1 downto 0);
    signal flsb_1_104, flsb_1_105, flsb_1_106, flsb_1_107 : unsigned(n-1 downto 0);
    signal flsb_1_108, flsb_1_109, flsb_1_110, flsb_1_111 : unsigned(n-1 downto 0);
    signal flsb_1_112, flsb_1_113, flsb_1_114, flsb_1_115 : unsigned(n-1 downto 0);
    signal flsb_1_116, flsb_1_117, flsb_1_118, flsb_1_119 : unsigned(n-1 downto 0);
    signal flsb_1_120, flsb_1_121, flsb_1_122, flsb_1_123 : unsigned(n-1 downto 0);
    signal flsb_1_124, flsb_1_125, flsb_1_126, flsb_1_127 : unsigned(n-1 downto 0);

    -- nível 2
    signal flsb_2_0, flsb_2_1, flsb_2_2, flsb_2_3 : unsigned(n-1 downto 0);
    signal flsb_2_4, flsb_2_5, flsb_2_6, flsb_2_7 : unsigned(n-1 downto 0);
    signal flsb_2_8, flsb_2_9, flsb_2_10, flsb_2_11 : unsigned(n-1 downto 0);
    signal flsb_2_12, flsb_2_13, flsb_2_14, flsb_2_15 : unsigned(n-1 downto 0);
    signal flsb_2_16, flsb_2_17, flsb_2_18, flsb_2_19 : unsigned(n-1 downto 0);
    signal flsb_2_20, flsb_2_21, flsb_2_22, flsb_2_23 : unsigned(n-1 downto 0);
    signal flsb_2_24, flsb_2_25, flsb_2_26, flsb_2_27 : unsigned(n-1 downto 0);
    signal flsb_2_28, flsb_2_29, flsb_2_30, flsb_2_31 : unsigned(n-1 downto 0);
    signal flsb_2_32, flsb_2_33, flsb_2_34, flsb_2_35 : unsigned(n-1 downto 0);
    signal flsb_2_36, flsb_2_37, flsb_2_38, flsb_2_39 : unsigned(n-1 downto 0);
    signal flsb_2_40, flsb_2_41, flsb_2_42, flsb_2_43 : unsigned(n-1 downto 0);
    signal flsb_2_44, flsb_2_45, flsb_2_46, flsb_2_47 : unsigned(n-1 downto 0);
    signal flsb_2_48, flsb_2_49, flsb_2_50, flsb_2_51 : unsigned(n-1 downto 0);
    signal flsb_2_52, flsb_2_53, flsb_2_54, flsb_2_55 : unsigned(n-1 downto 0);
    signal flsb_2_56, flsb_2_57, flsb_2_58, flsb_2_59 : unsigned(n-1 downto 0);
    signal flsb_2_60, flsb_2_61, flsb_2_62, flsb_2_63 : unsigned(n-1 downto 0);

    -- nível 3
    signal flsb_3_0, flsb_3_1, flsb_3_2, flsb_3_3 : unsigned(n-1 downto 0);
    signal flsb_3_4, flsb_3_5, flsb_3_6, flsb_3_7 : unsigned(n-1 downto 0);
    signal flsb_3_8, flsb_3_9, flsb_3_10, flsb_3_11 : unsigned(n-1 downto 0);
    signal flsb_3_12, flsb_3_13, flsb_3_14, flsb_3_15 : unsigned(n-1 downto 0);
    signal flsb_3_16, flsb_3_17, flsb_3_18, flsb_3_19 : unsigned(n-1 downto 0);
    signal flsb_3_20, flsb_3_21, flsb_3_22, flsb_3_23 : unsigned(n-1 downto 0);
    signal flsb_3_24, flsb_3_25, flsb_3_26, flsb_3_27 : unsigned(n-1 downto 0);
    signal flsb_3_28, flsb_3_29, flsb_3_30, flsb_3_31 : unsigned(n-1 downto 0);

    -- nível 4
    signal flsb_4_0, flsb_4_1, flsb_4_2, flsb_4_3 : unsigned(n-1 downto 0);
    signal flsb_4_4, flsb_4_5, flsb_4_6, flsb_4_7 : unsigned(n-1 downto 0);
    signal flsb_4_8, flsb_4_9, flsb_4_10, flsb_4_11 : unsigned(n-1 downto 0);
    signal flsb_4_12, flsb_4_13, flsb_4_14, flsb_4_15 : unsigned(n-1 downto 0);

    -- nível 5
    signal flsb_5_0, flsb_5_1, flsb_5_2, flsb_5_3 : unsigned(n-1 downto 0);
    signal flsb_5_4, flsb_5_5, flsb_5_6, flsb_5_7 : unsigned(n-1 downto 0);

    -- nível 6
    signal flsb_6_0, flsb_6_1, flsb_6_2, flsb_6_3 : unsigned(n-1 downto 0);

    -- nível 7
    signal flsb_7_0, flsb_7_1 : unsigned(n-1 downto 0);

begin

    --------------------------------------------------------------------------
    -- Nível 1 (128 somas)
    --------------------------------------------------------------------------
    flsb_1_0 <= a0 + a1;
    flsb_1_1 <= a2 + a3;
    flsb_1_2 <= a4 + a5;
    flsb_1_3 <= a6 + a7;
    flsb_1_4 <= a8 + a9;
    flsb_1_5 <= a10 + a11;
    flsb_1_6 <= a12 + a13;
    flsb_1_7 <= a14 + a15;
    flsb_1_8 <= a16 + a17;
    flsb_1_9 <= a18 + a19;
    flsb_1_10 <= a20 + a21;
    flsb_1_11 <= a22 + a23;
    flsb_1_12 <= a24 + a25;
    flsb_1_13 <= a26 + a27;
    flsb_1_14 <= a28 + a29;
    flsb_1_15 <= a30 + a31;
    flsb_1_16 <= a32 + a33;
    flsb_1_17 <= a34 + a35;
    flsb_1_18 <= a36 + a37;
    flsb_1_19 <= a38 + a39;
    flsb_1_20 <= a40 + a41;
    flsb_1_21 <= a42 + a43;
    flsb_1_22 <= a44 + a45;
    flsb_1_23 <= a46 + a47;
    flsb_1_24 <= a48 + a49;
    flsb_1_25 <= a50 + a51;
    flsb_1_26 <= a52 + a53;
    flsb_1_27 <= a54 + a55;
    flsb_1_28 <= a56 + a57;
    flsb_1_29 <= a58 + a59;
    flsb_1_30 <= a60 + a61;
    flsb_1_31 <= a62 + a63;
    flsb_1_32 <= a64 + a65;
    flsb_1_33 <= a66 + a67;
    flsb_1_34 <= a68 + a69;
    flsb_1_35 <= a70 + a71;
    flsb_1_36 <= a72 + a73;
    flsb_1_37 <= a74 + a75;
    flsb_1_38 <= a76 + a77;
    flsb_1_39 <= a78 + a79;
    flsb_1_40 <= a80 + a81;
    flsb_1_41 <= a82 + a83;
    flsb_1_42 <= a84 + a85;
    flsb_1_43 <= a86 + a87;
    flsb_1_44 <= a88 + a89;
    flsb_1_45 <= a90 + a91;
    flsb_1_46 <= a92 + a93;
    flsb_1_47 <= a94 + a95;
    flsb_1_48 <= a96 + a97;
    flsb_1_49 <= a98 + a99;
    flsb_1_50 <= a100 + a101;
    flsb_1_51 <= a102 + a103;
    flsb_1_52 <= a104 + a105;
    flsb_1_53 <= a106 + a107;
    flsb_1_54 <= a108 + a109;
    flsb_1_55 <= a110 + a111;
    flsb_1_56 <= a112 + a113;
    flsb_1_57 <= a114 + a115;
    flsb_1_58 <= a116 + a117;
    flsb_1_59 <= a118 + a119;
    flsb_1_60 <= a120 + a121;
    flsb_1_61 <= a122 + a123;
    flsb_1_62 <= a124 + a125;
    flsb_1_63 <= a126 + a127;
    flsb_1_64 <= a128 + a129;
    flsb_1_65 <= a130 + a131;
    flsb_1_66 <= a132 + a133;
    flsb_1_67 <= a134 + a135;
    flsb_1_68 <= a136 + a137;
    flsb_1_69 <= a138 + a139;
    flsb_1_70 <= a140 + a141;
    flsb_1_71 <= a142 + a143;
    flsb_1_72 <= a144 + a145;
    flsb_1_73 <= a146 + a147;
    flsb_1_74 <= a148 + a149;
    flsb_1_75 <= a150 + a151;
    flsb_1_76 <= a152 + a153;
    flsb_1_77 <= a154 + a155;
    flsb_1_78 <= a156 + a157;
    flsb_1_79 <= a158 + a159;
    flsb_1_80 <= a160 + a161;
    flsb_1_81 <= a162 + a163;
    flsb_1_82 <= a164 + a165;
    flsb_1_83 <= a166 + a167;
    flsb_1_84 <= a168 + a169;
    flsb_1_85 <= a170 + a171;
    flsb_1_86 <= a172 + a173;
    flsb_1_87 <= a174 + a175;
    flsb_1_88 <= a176 + a177;
    flsb_1_89 <= a178 + a179;
    flsb_1_90 <= a180 + a181;
    flsb_1_91 <= a182 + a183;
    flsb_1_92 <= a184 + a185;
    flsb_1_93 <= a186 + a187;
    flsb_1_94 <= a188 + a189;
    flsb_1_95 <= a190 + a191;
    flsb_1_96 <= a192 + a193;
    flsb_1_97 <= a194 + a195;
    flsb_1_98 <= a196 + a197;
    flsb_1_99 <= a198 + a199;
    flsb_1_100 <= a200 + a201;
    flsb_1_101 <= a202 + a203;
    flsb_1_102 <= a204 + a205;
    flsb_1_103 <= a206 + a207;
    flsb_1_104 <= a208 + a209;
    flsb_1_105 <= a210 + a211;
    flsb_1_106 <= a212 + a213;
    flsb_1_107 <= a214 + a215;
    flsb_1_108 <= a216 + a217;
    flsb_1_109 <= a218 + a219;
    flsb_1_110 <= a220 + a221;
    flsb_1_111 <= a222 + a223;
    flsb_1_112 <= a224 + a225;
    flsb_1_113 <= a226 + a227;
    flsb_1_114 <= a228 + a229;
    flsb_1_115 <= a230 + a231;
    flsb_1_116 <= a232 + a233;
    flsb_1_117 <= a234 + a235;
    flsb_1_118 <= a236 + a237;
    flsb_1_119 <= a238 + a239;
    flsb_1_120 <= a240 + a241;
    flsb_1_121 <= a242 + a243;
    flsb_1_122 <= a244 + a245;
    flsb_1_123 <= a246 + a247;
    flsb_1_124 <= a248 + a249;
    flsb_1_125 <= a250 + a251;
    flsb_1_126 <= a252 + a253;
    flsb_1_127 <= a254 + a255;

    --------------------------------------------------------------------------
    -- Nível 2 (64 somas)
    --------------------------------------------------------------------------
    flsb_2_0 <= flsb_1_0 + flsb_1_1;
    flsb_2_1 <= flsb_1_2 + flsb_1_3;
    flsb_2_2 <= flsb_1_4 + flsb_1_5;
    flsb_2_3 <= flsb_1_6 + flsb_1_7;
    flsb_2_4 <= flsb_1_8 + flsb_1_9;
    flsb_2_5 <= flsb_1_10 + flsb_1_11;
    flsb_2_6 <= flsb_1_12 + flsb_1_13;
    flsb_2_7 <= flsb_1_14 + flsb_1_15;
    flsb_2_8 <= flsb_1_16 + flsb_1_17;
    flsb_2_9 <= flsb_1_18 + flsb_1_19;
    flsb_2_10 <= flsb_1_20 + flsb_1_21;
    flsb_2_11 <= flsb_1_22 + flsb_1_23;
    flsb_2_12 <= flsb_1_24 + flsb_1_25;
    flsb_2_13 <= flsb_1_26 + flsb_1_27;
    flsb_2_14 <= flsb_1_28 + flsb_1_29;
    flsb_2_15 <= flsb_1_30 + flsb_1_31;
    flsb_2_16 <= flsb_1_32 + flsb_1_33;
    flsb_2_17 <= flsb_1_34 + flsb_1_35;
    flsb_2_18 <= flsb_1_36 + flsb_1_37;
    flsb_2_19 <= flsb_1_38 + flsb_1_39;
    flsb_2_20 <= flsb_1_40 + flsb_1_41;
    flsb_2_21 <= flsb_1_42 + flsb_1_43;
    flsb_2_22 <= flsb_1_44 + flsb_1_45;
    flsb_2_23 <= flsb_1_46 + flsb_1_47;
    flsb_2_24 <= flsb_1_48 + flsb_1_49;
    flsb_2_25 <= flsb_1_50 + flsb_1_51;
    flsb_2_26 <= flsb_1_52 + flsb_1_53;
    flsb_2_27 <= flsb_1_54 + flsb_1_55;
    flsb_2_28 <= flsb_1_56 + flsb_1_57;
    flsb_2_29 <= flsb_1_58 + flsb_1_59;
    flsb_2_30 <= flsb_1_60 + flsb_1_61;
    flsb_2_31 <= flsb_1_62 + flsb_1_63;
    flsb_2_32 <= flsb_1_64 + flsb_1_65;
    flsb_2_33 <= flsb_1_66 + flsb_1_67;
    flsb_2_34 <= flsb_1_68 + flsb_1_69;
    flsb_2_35 <= flsb_1_70 + flsb_1_71;
    flsb_2_36 <= flsb_1_72 + flsb_1_73;
    flsb_2_37 <= flsb_1_74 + flsb_1_75;
    flsb_2_38 <= flsb_1_76 + flsb_1_77;
    flsb_2_39 <= flsb_1_78 + flsb_1_79;
    flsb_2_40 <= flsb_1_80 + flsb_1_81;
    flsb_2_41 <= flsb_1_82 + flsb_1_83;
    flsb_2_42 <= flsb_1_84 + flsb_1_85;
    flsb_2_43 <= flsb_1_86 + flsb_1_87;
    flsb_2_44 <= flsb_1_88 + flsb_1_89;
    flsb_2_45 <= flsb_1_90 + flsb_1_91;
    flsb_2_46 <= flsb_1_92 + flsb_1_93;
    flsb_2_47 <= flsb_1_94 + flsb_1_95;
    flsb_2_48 <= flsb_1_96 + flsb_1_97;
    flsb_2_49 <= flsb_1_98 + flsb_1_99;
    flsb_2_50 <= flsb_1_100 + flsb_1_101;
    flsb_2_51 <= flsb_1_102 + flsb_1_103;
    flsb_2_52 <= flsb_1_104 + flsb_1_105;
    flsb_2_53 <= flsb_1_106 + flsb_1_107;
    flsb_2_54 <= flsb_1_108 + flsb_1_109;
    flsb_2_55 <= flsb_1_110 + flsb_1_111;
    flsb_2_56 <= flsb_1_112 + flsb_1_113;
    flsb_2_57 <= flsb_1_114 + flsb_1_115;
    flsb_2_58 <= flsb_1_116 + flsb_1_117;
    flsb_2_59 <= flsb_1_118 + flsb_1_119;
    flsb_2_60 <= flsb_1_120 + flsb_1_121;
    flsb_2_61 <= flsb_1_122 + flsb_1_123;
    flsb_2_62 <= flsb_1_124 + flsb_1_125;
    flsb_2_63 <= flsb_1_126 + flsb_1_127;

    --------------------------------------------------------------------------
    -- Nível 3 (32 somas)
    --------------------------------------------------------------------------
    flsb_3_0 <= flsb_2_0 + flsb_2_1;
    flsb_3_1 <= flsb_2_2 + flsb_2_3;
    flsb_3_2 <= flsb_2_4 + flsb_2_5;
    flsb_3_3 <= flsb_2_6 + flsb_2_7;
    flsb_3_4 <= flsb_2_8 + flsb_2_9;
    flsb_3_5 <= flsb_2_10 + flsb_2_11;
    flsb_3_6 <= flsb_2_12 + flsb_2_13;
    flsb_3_7 <= flsb_2_14 + flsb_2_15;
    flsb_3_8 <= flsb_2_16 + flsb_2_17;
    flsb_3_9 <= flsb_2_18 + flsb_2_19;
    flsb_3_10 <= flsb_2_20 + flsb_2_21;
    flsb_3_11 <= flsb_2_22 + flsb_2_23;
    flsb_3_12 <= flsb_2_24 + flsb_2_25;
    flsb_3_13 <= flsb_2_26 + flsb_2_27;
    flsb_3_14 <= flsb_2_28 + flsb_2_29;
    flsb_3_15 <= flsb_2_30 + flsb_2_31;
    flsb_3_16 <= flsb_2_32 + flsb_2_33;
    flsb_3_17 <= flsb_2_34 + flsb_2_35;
    flsb_3_18 <= flsb_2_36 + flsb_2_37;
    flsb_3_19 <= flsb_2_38 + flsb_2_39;
    flsb_3_20 <= flsb_2_40 + flsb_2_41;
    flsb_3_21 <= flsb_2_42 + flsb_2_43;
    flsb_3_22 <= flsb_2_44 + flsb_2_45;
    flsb_3_23 <= flsb_2_46 + flsb_2_47;
    flsb_3_24 <= flsb_2_48 + flsb_2_49;
    flsb_3_25 <= flsb_2_50 + flsb_2_51;
    flsb_3_26 <= flsb_2_52 + flsb_2_53;
    flsb_3_27 <= flsb_2_54 + flsb_2_55;
    flsb_3_28 <= flsb_2_56 + flsb_2_57;
    flsb_3_29 <= flsb_2_58 + flsb_2_59;
    flsb_3_30 <= flsb_2_60 + flsb_2_61;
    flsb_3_31 <= flsb_2_62 + flsb_2_63;

    --------------------------------------------------------------------------
    -- Nível 4 (16 somas)
    --------------------------------------------------------------------------
    flsb_4_0 <= flsb_3_0 + flsb_3_1;
    flsb_4_1 <= flsb_3_2 + flsb_3_3;
    flsb_4_2 <= flsb_3_4 + flsb_3_5;
    flsb_4_3 <= flsb_3_6 + flsb_3_7;
    flsb_4_4 <= flsb_3_8 + flsb_3_9;
    flsb_4_5 <= flsb_3_10 + flsb_3_11;
    flsb_4_6 <= flsb_3_12 + flsb_3_13;
    flsb_4_7 <= flsb_3_14 + flsb_3_15;
    flsb_4_8 <= flsb_3_16 + flsb_3_17;
    flsb_4_9 <= flsb_3_18 + flsb_3_19;
    flsb_4_10 <= flsb_3_20 + flsb_3_21;
    flsb_4_11 <= flsb_3_22 + flsb_3_23;
    flsb_4_12 <= flsb_3_24 + flsb_3_25;
    flsb_4_13 <= flsb_3_26 + flsb_3_27;
    flsb_4_14 <= flsb_3_28 + flsb_3_29;
    flsb_4_15 <= flsb_3_30 + flsb_3_31;

    --------------------------------------------------------------------------
    -- Nível 5 (8 somas)
    --------------------------------------------------------------------------
    flsb_5_0 <= flsb_4_0 + flsb_4_1;
    flsb_5_1 <= flsb_4_2 + flsb_4_3;
    flsb_5_2 <= flsb_4_4 + flsb_4_5;
    flsb_5_3 <= flsb_4_6 + flsb_4_7;
    flsb_5_4 <= flsb_4_8 + flsb_4_9;
    flsb_5_5 <= flsb_4_10 + flsb_4_11;
    flsb_5_6 <= flsb_4_12 + flsb_4_13;
    flsb_5_7 <= flsb_4_14 + flsb_4_15;

    --------------------------------------------------------------------------
    -- Nível 6 (4 somas)
    --------------------------------------------------------------------------
    flsb_6_0 <= flsb_5_0 + flsb_5_1;
    flsb_6_1 <= flsb_5_2 + flsb_5_3;
    flsb_6_2 <= flsb_5_4 + flsb_5_5;
    flsb_6_3 <= flsb_5_6 + flsb_5_7;

    --------------------------------------------------------------------------
    -- Nível 7 (2 somas)
    --------------------------------------------------------------------------
    flsb_7_0 <= flsb_6_0 + flsb_6_1;
    flsb_7_1 <= flsb_6_2 + flsb_6_3;

    
        --------------------------------------------------------------------------
        -- Resultado final
        --------------------------------------------------------------------------
        sum <= flsb_7_0 + flsb_7_1;

        end architecture;