library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

    entity sum256xn is
        generic(
            n : integer := 512
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
    signal flsb_1_128, flsb_1_129, flsb_1_130, flsb_1_131 : unsigned(n-1 downto 0);
    signal flsb_1_132, flsb_1_133, flsb_1_134, flsb_1_135 : unsigned(n-1 downto 0);
    signal flsb_1_136, flsb_1_137, flsb_1_138, flsb_1_139 : unsigned(n-1 downto 0);
    signal flsb_1_140, flsb_1_141, flsb_1_142, flsb_1_143 : unsigned(n-1 downto 0);
    signal flsb_1_144, flsb_1_145, flsb_1_146, flsb_1_147 : unsigned(n-1 downto 0);
    signal flsb_1_148, flsb_1_149, flsb_1_150, flsb_1_151 : unsigned(n-1 downto 0);
    signal flsb_1_152, flsb_1_153, flsb_1_154, flsb_1_155 : unsigned(n-1 downto 0);
    signal flsb_1_156, flsb_1_157, flsb_1_158, flsb_1_159 : unsigned(n-1 downto 0);
    signal flsb_1_160, flsb_1_161, flsb_1_162, flsb_1_163 : unsigned(n-1 downto 0);
    signal flsb_1_164, flsb_1_165, flsb_1_166, flsb_1_167 : unsigned(n-1 downto 0);
    signal flsb_1_168, flsb_1_169, flsb_1_170, flsb_1_171 : unsigned(n-1 downto 0);
    signal flsb_1_172, flsb_1_173, flsb_1_174, flsb_1_175 : unsigned(n-1 downto 0);
    signal flsb_1_176, flsb_1_177, flsb_1_178, flsb_1_179 : unsigned(n-1 downto 0);
    signal flsb_1_180, flsb_1_181, flsb_1_182, flsb_1_183 : unsigned(n-1 downto 0);
    signal flsb_1_184, flsb_1_185, flsb_1_186, flsb_1_187 : unsigned(n-1 downto 0);
    signal flsb_1_188, flsb_1_189, flsb_1_190, flsb_1_191 : unsigned(n-1 downto 0);
    signal flsb_1_192, flsb_1_193, flsb_1_194, flsb_1_195 : unsigned(n-1 downto 0);
    signal flsb_1_196, flsb_1_197, flsb_1_198, flsb_1_199 : unsigned(n-1 downto 0);
    signal flsb_1_200, flsb_1_201, flsb_1_202, flsb_1_203 : unsigned(n-1 downto 0);
    signal flsb_1_204, flsb_1_205, flsb_1_206, flsb_1_207 : unsigned(n-1 downto 0);
    signal flsb_1_208, flsb_1_209, flsb_1_210, flsb_1_211 : unsigned(n-1 downto 0);
    signal flsb_1_212, flsb_1_213, flsb_1_214, flsb_1_215 : unsigned(n-1 downto 0);
    signal flsb_1_216, flsb_1_217, flsb_1_218, flsb_1_219 : unsigned(n-1 downto 0);
    signal flsb_1_220, flsb_1_221, flsb_1_222, flsb_1_223 : unsigned(n-1 downto 0);
    signal flsb_1_224, flsb_1_225, flsb_1_226, flsb_1_227 : unsigned(n-1 downto 0);
    signal flsb_1_228, flsb_1_229, flsb_1_230, flsb_1_231 : unsigned(n-1 downto 0);
    signal flsb_1_232, flsb_1_233, flsb_1_234, flsb_1_235 : unsigned(n-1 downto 0);
    signal flsb_1_236, flsb_1_237, flsb_1_238, flsb_1_239 : unsigned(n-1 downto 0);
    signal flsb_1_240, flsb_1_241, flsb_1_242, flsb_1_243 : unsigned(n-1 downto 0);
    signal flsb_1_244, flsb_1_245, flsb_1_246, flsb_1_247 : unsigned(n-1 downto 0);
    signal flsb_1_248, flsb_1_249, flsb_1_250, flsb_1_251 : unsigned(n-1 downto 0);
    signal flsb_1_252, flsb_1_253, flsb_1_254, flsb_1_255 : unsigned(n-1 downto 0);

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
    signal flsb_2_64, flsb_2_65, flsb_2_66, flsb_2_67 : unsigned(n-1 downto 0);
    signal flsb_2_68, flsb_2_69, flsb_2_70, flsb_2_71 : unsigned(n-1 downto 0);
    signal flsb_2_72, flsb_2_73, flsb_2_74, flsb_2_75 : unsigned(n-1 downto 0);
    signal flsb_2_76, flsb_2_77, flsb_2_78, flsb_2_79 : unsigned(n-1 downto 0);
    signal flsb_2_80, flsb_2_81, flsb_2_82, flsb_2_83 : unsigned(n-1 downto 0);
    signal flsb_2_84, flsb_2_85, flsb_2_86, flsb_2_87 : unsigned(n-1 downto 0);
    signal flsb_2_88, flsb_2_89, flsb_2_90, flsb_2_91 : unsigned(n-1 downto 0);
    signal flsb_2_92, flsb_2_93, flsb_2_94, flsb_2_95 : unsigned(n-1 downto 0);
    signal flsb_2_96, flsb_2_97, flsb_2_98, flsb_2_99 : unsigned(n-1 downto 0);
    signal flsb_2_100, flsb_2_101, flsb_2_102, flsb_2_103 : unsigned(n-1 downto 0);
    signal flsb_2_104, flsb_2_105, flsb_2_106, flsb_2_107 : unsigned(n-1 downto 0);
    signal flsb_2_108, flsb_2_109, flsb_2_110, flsb_2_111 : unsigned(n-1 downto 0);
    signal flsb_2_112, flsb_2_113, flsb_2_114, flsb_2_115 : unsigned(n-1 downto 0);
    signal flsb_2_116, flsb_2_117, flsb_2_118, flsb_2_119 : unsigned(n-1 downto 0);
    signal flsb_2_120, flsb_2_121, flsb_2_122, flsb_2_123 : unsigned(n-1 downto 0);
    signal flsb_2_124, flsb_2_125, flsb_2_126, flsb_2_127 : unsigned(n-1 downto 0);

    -- nível 3
    signal flsb_3_0, flsb_3_1, flsb_3_2, flsb_3_3 : unsigned(n-1 downto 0);
    signal flsb_3_4, flsb_3_5, flsb_3_6, flsb_3_7 : unsigned(n-1 downto 0);
    signal flsb_3_8, flsb_3_9, flsb_3_10, flsb_3_11 : unsigned(n-1 downto 0);
    signal flsb_3_12, flsb_3_13, flsb_3_14, flsb_3_15 : unsigned(n-1 downto 0);
    signal flsb_3_16, flsb_3_17, flsb_3_18, flsb_3_19 : unsigned(n-1 downto 0);
    signal flsb_3_20, flsb_3_21, flsb_3_22, flsb_3_23 : unsigned(n-1 downto 0);
    signal flsb_3_24, flsb_3_25, flsb_3_26, flsb_3_27 : unsigned(n-1 downto 0);
    signal flsb_3_28, flsb_3_29, flsb_3_30, flsb_3_31 : unsigned(n-1 downto 0);
    signal flsb_3_32, flsb_3_33, flsb_3_34, flsb_3_35 : unsigned(n-1 downto 0);
    signal flsb_3_36, flsb_3_37, flsb_3_38, flsb_3_39 : unsigned(n-1 downto 0);
    signal flsb_3_40, flsb_3_41, flsb_3_42, flsb_3_43 : unsigned(n-1 downto 0);
    signal flsb_3_44, flsb_3_45, flsb_3_46, flsb_3_47 : unsigned(n-1 downto 0);
    signal flsb_3_48, flsb_3_49, flsb_3_50, flsb_3_51 : unsigned(n-1 downto 0);
    signal flsb_3_52, flsb_3_53, flsb_3_54, flsb_3_55 : unsigned(n-1 downto 0);
    signal flsb_3_56, flsb_3_57, flsb_3_58, flsb_3_59 : unsigned(n-1 downto 0);
    signal flsb_3_60, flsb_3_61, flsb_3_62, flsb_3_63 : unsigned(n-1 downto 0);

    -- nível 4
    signal flsb_4_0, flsb_4_1, flsb_4_2, flsb_4_3 : unsigned(n-1 downto 0);
    signal flsb_4_4, flsb_4_5, flsb_4_6, flsb_4_7 : unsigned(n-1 downto 0);
    signal flsb_4_8, flsb_4_9, flsb_4_10, flsb_4_11 : unsigned(n-1 downto 0);
    signal flsb_4_12, flsb_4_13, flsb_4_14, flsb_4_15 : unsigned(n-1 downto 0);
    signal flsb_4_16, flsb_4_17, flsb_4_18, flsb_4_19 : unsigned(n-1 downto 0);
    signal flsb_4_20, flsb_4_21, flsb_4_22, flsb_4_23 : unsigned(n-1 downto 0);
    signal flsb_4_24, flsb_4_25, flsb_4_26, flsb_4_27 : unsigned(n-1 downto 0);
    signal flsb_4_28, flsb_4_29, flsb_4_30, flsb_4_31 : unsigned(n-1 downto 0);

    -- nível 5
    signal flsb_5_0, flsb_5_1, flsb_5_2, flsb_5_3 : unsigned(n-1 downto 0);
    signal flsb_5_4, flsb_5_5, flsb_5_6, flsb_5_7 : unsigned(n-1 downto 0);
    signal flsb_5_8, flsb_5_9, flsb_5_10, flsb_5_11 : unsigned(n-1 downto 0);
    signal flsb_5_12, flsb_5_13, flsb_5_14, flsb_5_15 : unsigned(n-1 downto 0);

    -- nível 6
    signal flsb_6_0, flsb_6_1, flsb_6_2, flsb_6_3 : unsigned(n-1 downto 0);
    signal flsb_6_4, flsb_6_5, flsb_6_6, flsb_6_7 : unsigned(n-1 downto 0);

    -- nível 7
    signal flsb_7_0, flsb_7_1, flsb_7_2, flsb_7_3 : unsigned(n-1 downto 0);

    -- nível 8
    signal flsb_8_0, flsb_8_1 : unsigned(n-1 downto 0);

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
    flsb_1_128 <= shift_left(a128, 128);
    flsb_1_129 <= shift_left(a129, 129);
    flsb_1_130 <= shift_left(a130, 130);
    flsb_1_131 <= shift_left(a131, 131);
    flsb_1_132 <= shift_left(a132, 132);
    flsb_1_133 <= shift_left(a133, 133);
    flsb_1_134 <= shift_left(a134, 134);
    flsb_1_135 <= shift_left(a135, 135);
    flsb_1_136 <= shift_left(a136, 136);
    flsb_1_137 <= shift_left(a137, 137);
    flsb_1_138 <= shift_left(a138, 138);
    flsb_1_139 <= shift_left(a139, 139);
    flsb_1_140 <= shift_left(a140, 140);
    flsb_1_141 <= shift_left(a141, 141);
    flsb_1_142 <= shift_left(a142, 142);
    flsb_1_143 <= shift_left(a143, 143);
    flsb_1_144 <= shift_left(a144, 144);
    flsb_1_145 <= shift_left(a145, 145);
    flsb_1_146 <= shift_left(a146, 146);
    flsb_1_147 <= shift_left(a147, 147);
    flsb_1_148 <= shift_left(a148, 148);
    flsb_1_149 <= shift_left(a149, 149);
    flsb_1_150 <= shift_left(a150, 150);
    flsb_1_151 <= shift_left(a151, 151);
    flsb_1_152 <= shift_left(a152, 152);
    flsb_1_153 <= shift_left(a153, 153);
    flsb_1_154 <= shift_left(a154, 154);
    flsb_1_155 <= shift_left(a155, 155);
    flsb_1_156 <= shift_left(a156, 156);
    flsb_1_157 <= shift_left(a157, 157);
    flsb_1_158 <= shift_left(a158, 158);
    flsb_1_159 <= shift_left(a159, 159);
    flsb_1_160 <= shift_left(a160, 160);
    flsb_1_161 <= shift_left(a161, 161);
    flsb_1_162 <= shift_left(a162, 162);
    flsb_1_163 <= shift_left(a163, 163);
    flsb_1_164 <= shift_left(a164, 164);
    flsb_1_165 <= shift_left(a165, 165);
    flsb_1_166 <= shift_left(a166, 166);
    flsb_1_167 <= shift_left(a167, 167);
    flsb_1_168 <= shift_left(a168, 168);
    flsb_1_169 <= shift_left(a169, 169);
    flsb_1_170 <= shift_left(a170, 170);
    flsb_1_171 <= shift_left(a171, 171);
    flsb_1_172 <= shift_left(a172, 172);
    flsb_1_173 <= shift_left(a173, 173);
    flsb_1_174 <= shift_left(a174, 174);
    flsb_1_175 <= shift_left(a175, 175);
    flsb_1_176 <= shift_left(a176, 176);
    flsb_1_177 <= shift_left(a177, 177);
    flsb_1_178 <= shift_left(a178, 178);
    flsb_1_179 <= shift_left(a179, 179);
    flsb_1_180 <= shift_left(a180, 180);
    flsb_1_181 <= shift_left(a181, 181);
    flsb_1_182 <= shift_left(a182, 182);
    flsb_1_183 <= shift_left(a183, 183);
    flsb_1_184 <= shift_left(a184, 184);
    flsb_1_185 <= shift_left(a185, 185);
    flsb_1_186 <= shift_left(a186, 186);
    flsb_1_187 <= shift_left(a187, 187);
    flsb_1_188 <= shift_left(a188, 188);
    flsb_1_189 <= shift_left(a189, 189);
    flsb_1_190 <= shift_left(a190, 190);
    flsb_1_191 <= shift_left(a191, 191);
    flsb_1_192 <= shift_left(a192, 192);
    flsb_1_193 <= shift_left(a193, 193);
    flsb_1_194 <= shift_left(a194, 194);
    flsb_1_195 <= shift_left(a195, 195);
    flsb_1_196 <= shift_left(a196, 196);
    flsb_1_197 <= shift_left(a197, 197);
    flsb_1_198 <= shift_left(a198, 198);
    flsb_1_199 <= shift_left(a199, 199);
    flsb_1_200 <= shift_left(a200, 200);
    flsb_1_201 <= shift_left(a201, 201);
    flsb_1_202 <= shift_left(a202, 202);
    flsb_1_203 <= shift_left(a203, 203);
    flsb_1_204 <= shift_left(a204, 204);
    flsb_1_205 <= shift_left(a205, 205);
    flsb_1_206 <= shift_left(a206, 206);
    flsb_1_207 <= shift_left(a207, 207);
    flsb_1_208 <= shift_left(a208, 208);
    flsb_1_209 <= shift_left(a209, 209);
    flsb_1_210 <= shift_left(a210, 210);
    flsb_1_211 <= shift_left(a211, 211);
    flsb_1_212 <= shift_left(a212, 212);
    flsb_1_213 <= shift_left(a213, 213);
    flsb_1_214 <= shift_left(a214, 214);
    flsb_1_215 <= shift_left(a215, 215);
    flsb_1_216 <= shift_left(a216, 216);
    flsb_1_217 <= shift_left(a217, 217);
    flsb_1_218 <= shift_left(a218, 218);
    flsb_1_219 <= shift_left(a219, 219);
    flsb_1_220 <= shift_left(a220, 220);
    flsb_1_221 <= shift_left(a221, 221);
    flsb_1_222 <= shift_left(a222, 222);
    flsb_1_223 <= shift_left(a223, 223);
    flsb_1_224 <= shift_left(a224, 224);
    flsb_1_225 <= shift_left(a225, 225);
    flsb_1_226 <= shift_left(a226, 226);
    flsb_1_227 <= shift_left(a227, 227);
    flsb_1_228 <= shift_left(a228, 228);
    flsb_1_229 <= shift_left(a229, 229);
    flsb_1_230 <= shift_left(a230, 230);
    flsb_1_231 <= shift_left(a231, 231);
    flsb_1_232 <= shift_left(a232, 232);
    flsb_1_233 <= shift_left(a233, 233);
    flsb_1_234 <= shift_left(a234, 234);
    flsb_1_235 <= shift_left(a235, 235);
    flsb_1_236 <= shift_left(a236, 236);
    flsb_1_237 <= shift_left(a237, 237);
    flsb_1_238 <= shift_left(a238, 238);
    flsb_1_239 <= shift_left(a239, 239);
    flsb_1_240 <= shift_left(a240, 240);
    flsb_1_241 <= shift_left(a241, 241);
    flsb_1_242 <= shift_left(a242, 242);
    flsb_1_243 <= shift_left(a243, 243);
    flsb_1_244 <= shift_left(a244, 244);
    flsb_1_245 <= shift_left(a245, 245);
    flsb_1_246 <= shift_left(a246, 246);
    flsb_1_247 <= shift_left(a247, 247);
    flsb_1_248 <= shift_left(a248, 248);
    flsb_1_249 <= shift_left(a249, 249);
    flsb_1_250 <= shift_left(a250, 250);
    flsb_1_251 <= shift_left(a251, 251);
    flsb_1_252 <= shift_left(a252, 252);
    flsb_1_253 <= shift_left(a253, 253);
    flsb_1_254 <= shift_left(a254, 254);
    flsb_1_255 <= shift_left(a255, 255);

    --------------------------------------------------------------------------
    -- Nível 2 (128 somas)
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
    flsb_2_64 <= flsb_1_128 + flsb_1_129;
    flsb_2_65 <= flsb_1_130 + flsb_1_131;
    flsb_2_66 <= flsb_1_132 + flsb_1_133;
    flsb_2_67 <= flsb_1_134 + flsb_1_135;
    flsb_2_68 <= flsb_1_136 + flsb_1_137;
    flsb_2_69 <= flsb_1_138 + flsb_1_139;
    flsb_2_70 <= flsb_1_140 + flsb_1_141;
    flsb_2_71 <= flsb_1_142 + flsb_1_143;
    flsb_2_72 <= flsb_1_144 + flsb_1_145;
    flsb_2_73 <= flsb_1_146 + flsb_1_147;
    flsb_2_74 <= flsb_1_148 + flsb_1_149;
    flsb_2_75 <= flsb_1_150 + flsb_1_151;
    flsb_2_76 <= flsb_1_152 + flsb_1_153;
    flsb_2_77 <= flsb_1_154 + flsb_1_155;
    flsb_2_78 <= flsb_1_156 + flsb_1_157;
    flsb_2_79 <= flsb_1_158 + flsb_1_159;
    flsb_2_80 <= flsb_1_160 + flsb_1_161;
    flsb_2_81 <= flsb_1_162 + flsb_1_163;
    flsb_2_82 <= flsb_1_164 + flsb_1_165;
    flsb_2_83 <= flsb_1_166 + flsb_1_167;
    flsb_2_84 <= flsb_1_168 + flsb_1_169;
    flsb_2_85 <= flsb_1_170 + flsb_1_171;
    flsb_2_86 <= flsb_1_172 + flsb_1_173;
    flsb_2_87 <= flsb_1_174 + flsb_1_175;
    flsb_2_88 <= flsb_1_176 + flsb_1_177;
    flsb_2_89 <= flsb_1_178 + flsb_1_179;
    flsb_2_90 <= flsb_1_180 + flsb_1_181;
    flsb_2_91 <= flsb_1_182 + flsb_1_183;
    flsb_2_92 <= flsb_1_184 + flsb_1_185;
    flsb_2_93 <= flsb_1_186 + flsb_1_187;
    flsb_2_94 <= flsb_1_188 + flsb_1_189;
    flsb_2_95 <= flsb_1_190 + flsb_1_191;
    flsb_2_96 <= flsb_1_192 + flsb_1_193;
    flsb_2_97 <= flsb_1_194 + flsb_1_195;
    flsb_2_98 <= flsb_1_196 + flsb_1_197;
    flsb_2_99 <= flsb_1_198 + flsb_1_199;
    flsb_2_100 <= flsb_1_200 + flsb_1_201;
    flsb_2_101 <= flsb_1_202 + flsb_1_203;
    flsb_2_102 <= flsb_1_204 + flsb_1_205;
    flsb_2_103 <= flsb_1_206 + flsb_1_207;
    flsb_2_104 <= flsb_1_208 + flsb_1_209;
    flsb_2_105 <= flsb_1_210 + flsb_1_211;
    flsb_2_106 <= flsb_1_212 + flsb_1_213;
    flsb_2_107 <= flsb_1_214 + flsb_1_215;
    flsb_2_108 <= flsb_1_216 + flsb_1_217;
    flsb_2_109 <= flsb_1_218 + flsb_1_219;
    flsb_2_110 <= flsb_1_220 + flsb_1_221;
    flsb_2_111 <= flsb_1_222 + flsb_1_223;
    flsb_2_112 <= flsb_1_224 + flsb_1_225;
    flsb_2_113 <= flsb_1_226 + flsb_1_227;
    flsb_2_114 <= flsb_1_228 + flsb_1_229;
    flsb_2_115 <= flsb_1_230 + flsb_1_231;
    flsb_2_116 <= flsb_1_232 + flsb_1_233;
    flsb_2_117 <= flsb_1_234 + flsb_1_235;
    flsb_2_118 <= flsb_1_236 + flsb_1_237;
    flsb_2_119 <= flsb_1_238 + flsb_1_239;
    flsb_2_120 <= flsb_1_240 + flsb_1_241;
    flsb_2_121 <= flsb_1_242 + flsb_1_243;
    flsb_2_122 <= flsb_1_244 + flsb_1_245;
    flsb_2_123 <= flsb_1_246 + flsb_1_247;
    flsb_2_124 <= flsb_1_248 + flsb_1_249;
    flsb_2_125 <= flsb_1_250 + flsb_1_251;
    flsb_2_126 <= flsb_1_252 + flsb_1_253;
    flsb_2_127 <= flsb_1_254 + flsb_1_255;

    --------------------------------------------------------------------------
    -- Nível 3 (64 somas)
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
    flsb_3_32 <= flsb_2_64 + flsb_2_65;
    flsb_3_33 <= flsb_2_66 + flsb_2_67;
    flsb_3_34 <= flsb_2_68 + flsb_2_69;
    flsb_3_35 <= flsb_2_70 + flsb_2_71;
    flsb_3_36 <= flsb_2_72 + flsb_2_73;
    flsb_3_37 <= flsb_2_74 + flsb_2_75;
    flsb_3_38 <= flsb_2_76 + flsb_2_77;
    flsb_3_39 <= flsb_2_78 + flsb_2_79;
    flsb_3_40 <= flsb_2_80 + flsb_2_81;
    flsb_3_41 <= flsb_2_82 + flsb_2_83;
    flsb_3_42 <= flsb_2_84 + flsb_2_85;
    flsb_3_43 <= flsb_2_86 + flsb_2_87;
    flsb_3_44 <= flsb_2_88 + flsb_2_89;
    flsb_3_45 <= flsb_2_90 + flsb_2_91;
    flsb_3_46 <= flsb_2_92 + flsb_2_93;
    flsb_3_47 <= flsb_2_94 + flsb_2_95;
    flsb_3_48 <= flsb_2_96 + flsb_2_97;
    flsb_3_49 <= flsb_2_98 + flsb_2_99;
    flsb_3_50 <= flsb_2_100 + flsb_2_101;
    flsb_3_51 <= flsb_2_102 + flsb_2_103;
    flsb_3_52 <= flsb_2_104 + flsb_2_105;
    flsb_3_53 <= flsb_2_106 + flsb_2_107;
    flsb_3_54 <= flsb_2_108 + flsb_2_109;
    flsb_3_55 <= flsb_2_110 + flsb_2_111;
    flsb_3_56 <= flsb_2_112 + flsb_2_113;
    flsb_3_57 <= flsb_2_114 + flsb_2_115;
    flsb_3_58 <= flsb_2_116 + flsb_2_117;
    flsb_3_59 <= flsb_2_118 + flsb_2_119;
    flsb_3_60 <= flsb_2_120 + flsb_2_121;
    flsb_3_61 <= flsb_2_122 + flsb_2_123;
    flsb_3_62 <= flsb_2_124 + flsb_2_125;
    flsb_3_63 <= flsb_2_126 + flsb_2_127;

    --------------------------------------------------------------------------
    -- Nível 4 (32 somas)
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
    flsb_4_16 <= flsb_3_32 + flsb_3_33;
    flsb_4_17 <= flsb_3_34 + flsb_3_35;
    flsb_4_18 <= flsb_3_36 + flsb_3_37;
    flsb_4_19 <= flsb_3_38 + flsb_3_39;
    flsb_4_20 <= flsb_3_40 + flsb_3_41;
    flsb_4_21 <= flsb_3_42 + flsb_3_43;
    flsb_4_22 <= flsb_3_44 + flsb_3_45;
    flsb_4_23 <= flsb_3_46 + flsb_3_47;
    flsb_4_24 <= flsb_3_48 + flsb_3_49;
    flsb_4_25 <= flsb_3_50 + flsb_3_51;
    flsb_4_26 <= flsb_3_52 + flsb_3_53;
    flsb_4_27 <= flsb_3_54 + flsb_3_55;
    flsb_4_28 <= flsb_3_56 + flsb_3_57;
    flsb_4_29 <= flsb_3_58 + flsb_3_59;
    flsb_4_30 <= flsb_3_60 + flsb_3_61;
    flsb_4_31 <= flsb_3_62 + flsb_3_63;

    --------------------------------------------------------------------------
    -- Nível 5 (16 somas)
    --------------------------------------------------------------------------
    flsb_5_0 <= flsb_4_0 + flsb_4_1;
    flsb_5_1 <= flsb_4_2 + flsb_4_3;
    flsb_5_2 <= flsb_4_4 + flsb_4_5;
    flsb_5_3 <= flsb_4_6 + flsb_4_7;
    flsb_5_4 <= flsb_4_8 + flsb_4_9;
    flsb_5_5 <= flsb_4_10 + flsb_4_11;
    flsb_5_6 <= flsb_4_12 + flsb_4_13;
    flsb_5_7 <= flsb_4_14 + flsb_4_15;
    flsb_5_8 <= flsb_4_16 + flsb_4_17;
    flsb_5_9 <= flsb_4_18 + flsb_4_19;
    flsb_5_10 <= flsb_4_20 + flsb_4_21;
    flsb_5_11 <= flsb_4_22 + flsb_4_23;
    flsb_5_12 <= flsb_4_24 + flsb_4_25;
    flsb_5_13 <= flsb_4_26 + flsb_4_27;
    flsb_5_14 <= flsb_4_28 + flsb_4_29;
    flsb_5_15 <= flsb_4_30 + flsb_4_31;

    --------------------------------------------------------------------------
    -- Nível 6 (8 somas)
    --------------------------------------------------------------------------
    flsb_6_0 <= flsb_5_0 + flsb_5_1;
    flsb_6_1 <= flsb_5_2 + flsb_5_3;
    flsb_6_2 <= flsb_5_4 + flsb_5_5;
    flsb_6_3 <= flsb_5_6 + flsb_5_7;
    flsb_6_4 <= flsb_5_8 + flsb_5_9;
    flsb_6_5 <= flsb_5_10 + flsb_5_11;
    flsb_6_6 <= flsb_5_12 + flsb_5_13;
    flsb_6_7 <= flsb_5_14 + flsb_5_15;

    --------------------------------------------------------------------------
    -- Nível 7 (4 somas)
    --------------------------------------------------------------------------
    flsb_7_0 <= flsb_6_0 + flsb_6_1;
    flsb_7_1 <= flsb_6_2 + flsb_6_3;
    flsb_7_2 <= flsb_6_4 + flsb_6_5;
    flsb_7_3 <= flsb_6_6 + flsb_6_7;

    --------------------------------------------------------------------------
    -- Nível 8 (2 somas)
    --------------------------------------------------------------------------
    flsb_8_0 <= flsb_7_0 + flsb_7_1;
    flsb_8_1 <= flsb_7_2 + flsb_7_3;

    --------------------------------------------------------------------------
    -- Resultado final
    --------------------------------------------------------------------------
    sum <= flsb_8_0 + flsb_8_1;

end architecture;