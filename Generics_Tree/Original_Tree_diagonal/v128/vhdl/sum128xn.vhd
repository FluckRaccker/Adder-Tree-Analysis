library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

    entity sum128xn is
        generic(
            n : integer := 256
        );
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
        a124, a125, a126, a127 : in unsigned(n-1 downto 0);
            sum : out unsigned(n-1 downto 0)
        );
    end sum128xn;

    architecture rtl of sum128xn is
    
    -- nível 1: deslocamento diagonal
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
    -- Nível 1: deslocamento diagonal
    --------------------------------------------------------------------------
    flsb_1_0 <= shift_left(a0, 0);
    flsb_1_1 <= shift_left(a1, 1);
    flsb_1_2 <= shift_left(a2, 2);
    flsb_1_3 <= shift_left(a3, 3);
    flsb_1_4 <= shift_left(a4, 4);
    flsb_1_5 <= shift_left(a5, 5);
    flsb_1_6 <= shift_left(a6, 6);
    flsb_1_7 <= shift_left(a7, 7);
    flsb_1_8 <= shift_left(a8, 8);
    flsb_1_9 <= shift_left(a9, 9);
    flsb_1_10 <= shift_left(a10, 10);
    flsb_1_11 <= shift_left(a11, 11);
    flsb_1_12 <= shift_left(a12, 12);
    flsb_1_13 <= shift_left(a13, 13);
    flsb_1_14 <= shift_left(a14, 14);
    flsb_1_15 <= shift_left(a15, 15);
    flsb_1_16 <= shift_left(a16, 16);
    flsb_1_17 <= shift_left(a17, 17);
    flsb_1_18 <= shift_left(a18, 18);
    flsb_1_19 <= shift_left(a19, 19);
    flsb_1_20 <= shift_left(a20, 20);
    flsb_1_21 <= shift_left(a21, 21);
    flsb_1_22 <= shift_left(a22, 22);
    flsb_1_23 <= shift_left(a23, 23);
    flsb_1_24 <= shift_left(a24, 24);
    flsb_1_25 <= shift_left(a25, 25);
    flsb_1_26 <= shift_left(a26, 26);
    flsb_1_27 <= shift_left(a27, 27);
    flsb_1_28 <= shift_left(a28, 28);
    flsb_1_29 <= shift_left(a29, 29);
    flsb_1_30 <= shift_left(a30, 30);
    flsb_1_31 <= shift_left(a31, 31);
    flsb_1_32 <= shift_left(a32, 32);
    flsb_1_33 <= shift_left(a33, 33);
    flsb_1_34 <= shift_left(a34, 34);
    flsb_1_35 <= shift_left(a35, 35);
    flsb_1_36 <= shift_left(a36, 36);
    flsb_1_37 <= shift_left(a37, 37);
    flsb_1_38 <= shift_left(a38, 38);
    flsb_1_39 <= shift_left(a39, 39);
    flsb_1_40 <= shift_left(a40, 40);
    flsb_1_41 <= shift_left(a41, 41);
    flsb_1_42 <= shift_left(a42, 42);
    flsb_1_43 <= shift_left(a43, 43);
    flsb_1_44 <= shift_left(a44, 44);
    flsb_1_45 <= shift_left(a45, 45);
    flsb_1_46 <= shift_left(a46, 46);
    flsb_1_47 <= shift_left(a47, 47);
    flsb_1_48 <= shift_left(a48, 48);
    flsb_1_49 <= shift_left(a49, 49);
    flsb_1_50 <= shift_left(a50, 50);
    flsb_1_51 <= shift_left(a51, 51);
    flsb_1_52 <= shift_left(a52, 52);
    flsb_1_53 <= shift_left(a53, 53);
    flsb_1_54 <= shift_left(a54, 54);
    flsb_1_55 <= shift_left(a55, 55);
    flsb_1_56 <= shift_left(a56, 56);
    flsb_1_57 <= shift_left(a57, 57);
    flsb_1_58 <= shift_left(a58, 58);
    flsb_1_59 <= shift_left(a59, 59);
    flsb_1_60 <= shift_left(a60, 60);
    flsb_1_61 <= shift_left(a61, 61);
    flsb_1_62 <= shift_left(a62, 62);
    flsb_1_63 <= shift_left(a63, 63);
    flsb_1_64 <= shift_left(a64, 64);
    flsb_1_65 <= shift_left(a65, 65);
    flsb_1_66 <= shift_left(a66, 66);
    flsb_1_67 <= shift_left(a67, 67);
    flsb_1_68 <= shift_left(a68, 68);
    flsb_1_69 <= shift_left(a69, 69);
    flsb_1_70 <= shift_left(a70, 70);
    flsb_1_71 <= shift_left(a71, 71);
    flsb_1_72 <= shift_left(a72, 72);
    flsb_1_73 <= shift_left(a73, 73);
    flsb_1_74 <= shift_left(a74, 74);
    flsb_1_75 <= shift_left(a75, 75);
    flsb_1_76 <= shift_left(a76, 76);
    flsb_1_77 <= shift_left(a77, 77);
    flsb_1_78 <= shift_left(a78, 78);
    flsb_1_79 <= shift_left(a79, 79);
    flsb_1_80 <= shift_left(a80, 80);
    flsb_1_81 <= shift_left(a81, 81);
    flsb_1_82 <= shift_left(a82, 82);
    flsb_1_83 <= shift_left(a83, 83);
    flsb_1_84 <= shift_left(a84, 84);
    flsb_1_85 <= shift_left(a85, 85);
    flsb_1_86 <= shift_left(a86, 86);
    flsb_1_87 <= shift_left(a87, 87);
    flsb_1_88 <= shift_left(a88, 88);
    flsb_1_89 <= shift_left(a89, 89);
    flsb_1_90 <= shift_left(a90, 90);
    flsb_1_91 <= shift_left(a91, 91);
    flsb_1_92 <= shift_left(a92, 92);
    flsb_1_93 <= shift_left(a93, 93);
    flsb_1_94 <= shift_left(a94, 94);
    flsb_1_95 <= shift_left(a95, 95);
    flsb_1_96 <= shift_left(a96, 96);
    flsb_1_97 <= shift_left(a97, 97);
    flsb_1_98 <= shift_left(a98, 98);
    flsb_1_99 <= shift_left(a99, 99);
    flsb_1_100 <= shift_left(a100, 100);
    flsb_1_101 <= shift_left(a101, 101);
    flsb_1_102 <= shift_left(a102, 102);
    flsb_1_103 <= shift_left(a103, 103);
    flsb_1_104 <= shift_left(a104, 104);
    flsb_1_105 <= shift_left(a105, 105);
    flsb_1_106 <= shift_left(a106, 106);
    flsb_1_107 <= shift_left(a107, 107);
    flsb_1_108 <= shift_left(a108, 108);
    flsb_1_109 <= shift_left(a109, 109);
    flsb_1_110 <= shift_left(a110, 110);
    flsb_1_111 <= shift_left(a111, 111);
    flsb_1_112 <= shift_left(a112, 112);
    flsb_1_113 <= shift_left(a113, 113);
    flsb_1_114 <= shift_left(a114, 114);
    flsb_1_115 <= shift_left(a115, 115);
    flsb_1_116 <= shift_left(a116, 116);
    flsb_1_117 <= shift_left(a117, 117);
    flsb_1_118 <= shift_left(a118, 118);
    flsb_1_119 <= shift_left(a119, 119);
    flsb_1_120 <= shift_left(a120, 120);
    flsb_1_121 <= shift_left(a121, 121);
    flsb_1_122 <= shift_left(a122, 122);
    flsb_1_123 <= shift_left(a123, 123);
    flsb_1_124 <= shift_left(a124, 124);
    flsb_1_125 <= shift_left(a125, 125);
    flsb_1_126 <= shift_left(a126, 126);
    flsb_1_127 <= shift_left(a127, 127);

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