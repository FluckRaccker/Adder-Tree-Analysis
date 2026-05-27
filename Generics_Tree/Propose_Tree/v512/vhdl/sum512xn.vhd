
    library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

    entity sum512xn is

    generic(n : integer := 16);
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
        a252, a253, a254, a255,
        a256, a257, a258, a259,
        a260, a261, a262, a263,
        a264, a265, a266, a267,
        a268, a269, a270, a271,
        a272, a273, a274, a275,
        a276, a277, a278, a279,
        a280, a281, a282, a283,
        a284, a285, a286, a287,
        a288, a289, a290, a291,
        a292, a293, a294, a295,
        a296, a297, a298, a299,
        a300, a301, a302, a303,
        a304, a305, a306, a307,
        a308, a309, a310, a311,
        a312, a313, a314, a315,
        a316, a317, a318, a319,
        a320, a321, a322, a323,
        a324, a325, a326, a327,
        a328, a329, a330, a331,
        a332, a333, a334, a335,
        a336, a337, a338, a339,
        a340, a341, a342, a343,
        a344, a345, a346, a347,
        a348, a349, a350, a351,
        a352, a353, a354, a355,
        a356, a357, a358, a359,
        a360, a361, a362, a363,
        a364, a365, a366, a367,
        a368, a369, a370, a371,
        a372, a373, a374, a375,
        a376, a377, a378, a379,
        a380, a381, a382, a383,
        a384, a385, a386, a387,
        a388, a389, a390, a391,
        a392, a393, a394, a395,
        a396, a397, a398, a399,
        a400, a401, a402, a403,
        a404, a405, a406, a407,
        a408, a409, a410, a411,
        a412, a413, a414, a415,
        a416, a417, a418, a419,
        a420, a421, a422, a423,
        a424, a425, a426, a427,
        a428, a429, a430, a431,
        a432, a433, a434, a435,
        a436, a437, a438, a439,
        a440, a441, a442, a443,
        a444, a445, a446, a447,
        a448, a449, a450, a451,
        a452, a453, a454, a455,
        a456, a457, a458, a459,
        a460, a461, a462, a463,
        a464, a465, a466, a467,
        a468, a469, a470, a471,
        a472, a473, a474, a475,
        a476, a477, a478, a479,
        a480, a481, a482, a483,
        a484, a485, a486, a487,
        a488, a489, a490, a491,
        a492, a493, a494, a495,
        a496, a497, a498, a499,
        a500, a501, a502, a503,
        a504, a505, a506, a507,
        a508, a509, a510, a511 : in unsigned(n-1 downto 0);
    sum : out unsigned(n-1 downto 0)
    );
    end sum512xn;

    architecture rtl of sum512xn is
    
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
    -- Nível 1 (256 somas)
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
    flsb_1_128 <= a256 + a257;
    flsb_1_129 <= a258 + a259;
    flsb_1_130 <= a260 + a261;
    flsb_1_131 <= a262 + a263;
    flsb_1_132 <= a264 + a265;
    flsb_1_133 <= a266 + a267;
    flsb_1_134 <= a268 + a269;
    flsb_1_135 <= a270 + a271;
    flsb_1_136 <= a272 + a273;
    flsb_1_137 <= a274 + a275;
    flsb_1_138 <= a276 + a277;
    flsb_1_139 <= a278 + a279;
    flsb_1_140 <= a280 + a281;
    flsb_1_141 <= a282 + a283;
    flsb_1_142 <= a284 + a285;
    flsb_1_143 <= a286 + a287;
    flsb_1_144 <= a288 + a289;
    flsb_1_145 <= a290 + a291;
    flsb_1_146 <= a292 + a293;
    flsb_1_147 <= a294 + a295;
    flsb_1_148 <= a296 + a297;
    flsb_1_149 <= a298 + a299;
    flsb_1_150 <= a300 + a301;
    flsb_1_151 <= a302 + a303;
    flsb_1_152 <= a304 + a305;
    flsb_1_153 <= a306 + a307;
    flsb_1_154 <= a308 + a309;
    flsb_1_155 <= a310 + a311;
    flsb_1_156 <= a312 + a313;
    flsb_1_157 <= a314 + a315;
    flsb_1_158 <= a316 + a317;
    flsb_1_159 <= a318 + a319;
    flsb_1_160 <= a320 + a321;
    flsb_1_161 <= a322 + a323;
    flsb_1_162 <= a324 + a325;
    flsb_1_163 <= a326 + a327;
    flsb_1_164 <= a328 + a329;
    flsb_1_165 <= a330 + a331;
    flsb_1_166 <= a332 + a333;
    flsb_1_167 <= a334 + a335;
    flsb_1_168 <= a336 + a337;
    flsb_1_169 <= a338 + a339;
    flsb_1_170 <= a340 + a341;
    flsb_1_171 <= a342 + a343;
    flsb_1_172 <= a344 + a345;
    flsb_1_173 <= a346 + a347;
    flsb_1_174 <= a348 + a349;
    flsb_1_175 <= a350 + a351;
    flsb_1_176 <= a352 + a353;
    flsb_1_177 <= a354 + a355;
    flsb_1_178 <= a356 + a357;
    flsb_1_179 <= a358 + a359;
    flsb_1_180 <= a360 + a361;
    flsb_1_181 <= a362 + a363;
    flsb_1_182 <= a364 + a365;
    flsb_1_183 <= a366 + a367;
    flsb_1_184 <= a368 + a369;
    flsb_1_185 <= a370 + a371;
    flsb_1_186 <= a372 + a373;
    flsb_1_187 <= a374 + a375;
    flsb_1_188 <= a376 + a377;
    flsb_1_189 <= a378 + a379;
    flsb_1_190 <= a380 + a381;
    flsb_1_191 <= a382 + a383;
    flsb_1_192 <= a384 + a385;
    flsb_1_193 <= a386 + a387;
    flsb_1_194 <= a388 + a389;
    flsb_1_195 <= a390 + a391;
    flsb_1_196 <= a392 + a393;
    flsb_1_197 <= a394 + a395;
    flsb_1_198 <= a396 + a397;
    flsb_1_199 <= a398 + a399;
    flsb_1_200 <= a400 + a401;
    flsb_1_201 <= a402 + a403;
    flsb_1_202 <= a404 + a405;
    flsb_1_203 <= a406 + a407;
    flsb_1_204 <= a408 + a409;
    flsb_1_205 <= a410 + a411;
    flsb_1_206 <= a412 + a413;
    flsb_1_207 <= a414 + a415;
    flsb_1_208 <= a416 + a417;
    flsb_1_209 <= a418 + a419;
    flsb_1_210 <= a420 + a421;
    flsb_1_211 <= a422 + a423;
    flsb_1_212 <= a424 + a425;
    flsb_1_213 <= a426 + a427;
    flsb_1_214 <= a428 + a429;
    flsb_1_215 <= a430 + a431;
    flsb_1_216 <= a432 + a433;
    flsb_1_217 <= a434 + a435;
    flsb_1_218 <= a436 + a437;
    flsb_1_219 <= a438 + a439;
    flsb_1_220 <= a440 + a441;
    flsb_1_221 <= a442 + a443;
    flsb_1_222 <= a444 + a445;
    flsb_1_223 <= a446 + a447;
    flsb_1_224 <= a448 + a449;
    flsb_1_225 <= a450 + a451;
    flsb_1_226 <= a452 + a453;
    flsb_1_227 <= a454 + a455;
    flsb_1_228 <= a456 + a457;
    flsb_1_229 <= a458 + a459;
    flsb_1_230 <= a460 + a461;
    flsb_1_231 <= a462 + a463;
    flsb_1_232 <= a464 + a465;
    flsb_1_233 <= a466 + a467;
    flsb_1_234 <= a468 + a469;
    flsb_1_235 <= a470 + a471;
    flsb_1_236 <= a472 + a473;
    flsb_1_237 <= a474 + a475;
    flsb_1_238 <= a476 + a477;
    flsb_1_239 <= a478 + a479;
    flsb_1_240 <= a480 + a481;
    flsb_1_241 <= a482 + a483;
    flsb_1_242 <= a484 + a485;
    flsb_1_243 <= a486 + a487;
    flsb_1_244 <= a488 + a489;
    flsb_1_245 <= a490 + a491;
    flsb_1_246 <= a492 + a493;
    flsb_1_247 <= a494 + a495;
    flsb_1_248 <= a496 + a497;
    flsb_1_249 <= a498 + a499;
    flsb_1_250 <= a500 + a501;
    flsb_1_251 <= a502 + a503;
    flsb_1_252 <= a504 + a505;
    flsb_1_253 <= a506 + a507;
    flsb_1_254 <= a508 + a509;
    flsb_1_255 <= a510 + a511;

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