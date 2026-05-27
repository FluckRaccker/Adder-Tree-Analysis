library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

    entity sum512xn is
        generic(
            n : integer := 1024
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
    signal flsb_1_256, flsb_1_257, flsb_1_258, flsb_1_259 : unsigned(n-1 downto 0);
    signal flsb_1_260, flsb_1_261, flsb_1_262, flsb_1_263 : unsigned(n-1 downto 0);
    signal flsb_1_264, flsb_1_265, flsb_1_266, flsb_1_267 : unsigned(n-1 downto 0);
    signal flsb_1_268, flsb_1_269, flsb_1_270, flsb_1_271 : unsigned(n-1 downto 0);
    signal flsb_1_272, flsb_1_273, flsb_1_274, flsb_1_275 : unsigned(n-1 downto 0);
    signal flsb_1_276, flsb_1_277, flsb_1_278, flsb_1_279 : unsigned(n-1 downto 0);
    signal flsb_1_280, flsb_1_281, flsb_1_282, flsb_1_283 : unsigned(n-1 downto 0);
    signal flsb_1_284, flsb_1_285, flsb_1_286, flsb_1_287 : unsigned(n-1 downto 0);
    signal flsb_1_288, flsb_1_289, flsb_1_290, flsb_1_291 : unsigned(n-1 downto 0);
    signal flsb_1_292, flsb_1_293, flsb_1_294, flsb_1_295 : unsigned(n-1 downto 0);
    signal flsb_1_296, flsb_1_297, flsb_1_298, flsb_1_299 : unsigned(n-1 downto 0);
    signal flsb_1_300, flsb_1_301, flsb_1_302, flsb_1_303 : unsigned(n-1 downto 0);
    signal flsb_1_304, flsb_1_305, flsb_1_306, flsb_1_307 : unsigned(n-1 downto 0);
    signal flsb_1_308, flsb_1_309, flsb_1_310, flsb_1_311 : unsigned(n-1 downto 0);
    signal flsb_1_312, flsb_1_313, flsb_1_314, flsb_1_315 : unsigned(n-1 downto 0);
    signal flsb_1_316, flsb_1_317, flsb_1_318, flsb_1_319 : unsigned(n-1 downto 0);
    signal flsb_1_320, flsb_1_321, flsb_1_322, flsb_1_323 : unsigned(n-1 downto 0);
    signal flsb_1_324, flsb_1_325, flsb_1_326, flsb_1_327 : unsigned(n-1 downto 0);
    signal flsb_1_328, flsb_1_329, flsb_1_330, flsb_1_331 : unsigned(n-1 downto 0);
    signal flsb_1_332, flsb_1_333, flsb_1_334, flsb_1_335 : unsigned(n-1 downto 0);
    signal flsb_1_336, flsb_1_337, flsb_1_338, flsb_1_339 : unsigned(n-1 downto 0);
    signal flsb_1_340, flsb_1_341, flsb_1_342, flsb_1_343 : unsigned(n-1 downto 0);
    signal flsb_1_344, flsb_1_345, flsb_1_346, flsb_1_347 : unsigned(n-1 downto 0);
    signal flsb_1_348, flsb_1_349, flsb_1_350, flsb_1_351 : unsigned(n-1 downto 0);
    signal flsb_1_352, flsb_1_353, flsb_1_354, flsb_1_355 : unsigned(n-1 downto 0);
    signal flsb_1_356, flsb_1_357, flsb_1_358, flsb_1_359 : unsigned(n-1 downto 0);
    signal flsb_1_360, flsb_1_361, flsb_1_362, flsb_1_363 : unsigned(n-1 downto 0);
    signal flsb_1_364, flsb_1_365, flsb_1_366, flsb_1_367 : unsigned(n-1 downto 0);
    signal flsb_1_368, flsb_1_369, flsb_1_370, flsb_1_371 : unsigned(n-1 downto 0);
    signal flsb_1_372, flsb_1_373, flsb_1_374, flsb_1_375 : unsigned(n-1 downto 0);
    signal flsb_1_376, flsb_1_377, flsb_1_378, flsb_1_379 : unsigned(n-1 downto 0);
    signal flsb_1_380, flsb_1_381, flsb_1_382, flsb_1_383 : unsigned(n-1 downto 0);
    signal flsb_1_384, flsb_1_385, flsb_1_386, flsb_1_387 : unsigned(n-1 downto 0);
    signal flsb_1_388, flsb_1_389, flsb_1_390, flsb_1_391 : unsigned(n-1 downto 0);
    signal flsb_1_392, flsb_1_393, flsb_1_394, flsb_1_395 : unsigned(n-1 downto 0);
    signal flsb_1_396, flsb_1_397, flsb_1_398, flsb_1_399 : unsigned(n-1 downto 0);
    signal flsb_1_400, flsb_1_401, flsb_1_402, flsb_1_403 : unsigned(n-1 downto 0);
    signal flsb_1_404, flsb_1_405, flsb_1_406, flsb_1_407 : unsigned(n-1 downto 0);
    signal flsb_1_408, flsb_1_409, flsb_1_410, flsb_1_411 : unsigned(n-1 downto 0);
    signal flsb_1_412, flsb_1_413, flsb_1_414, flsb_1_415 : unsigned(n-1 downto 0);
    signal flsb_1_416, flsb_1_417, flsb_1_418, flsb_1_419 : unsigned(n-1 downto 0);
    signal flsb_1_420, flsb_1_421, flsb_1_422, flsb_1_423 : unsigned(n-1 downto 0);
    signal flsb_1_424, flsb_1_425, flsb_1_426, flsb_1_427 : unsigned(n-1 downto 0);
    signal flsb_1_428, flsb_1_429, flsb_1_430, flsb_1_431 : unsigned(n-1 downto 0);
    signal flsb_1_432, flsb_1_433, flsb_1_434, flsb_1_435 : unsigned(n-1 downto 0);
    signal flsb_1_436, flsb_1_437, flsb_1_438, flsb_1_439 : unsigned(n-1 downto 0);
    signal flsb_1_440, flsb_1_441, flsb_1_442, flsb_1_443 : unsigned(n-1 downto 0);
    signal flsb_1_444, flsb_1_445, flsb_1_446, flsb_1_447 : unsigned(n-1 downto 0);
    signal flsb_1_448, flsb_1_449, flsb_1_450, flsb_1_451 : unsigned(n-1 downto 0);
    signal flsb_1_452, flsb_1_453, flsb_1_454, flsb_1_455 : unsigned(n-1 downto 0);
    signal flsb_1_456, flsb_1_457, flsb_1_458, flsb_1_459 : unsigned(n-1 downto 0);
    signal flsb_1_460, flsb_1_461, flsb_1_462, flsb_1_463 : unsigned(n-1 downto 0);
    signal flsb_1_464, flsb_1_465, flsb_1_466, flsb_1_467 : unsigned(n-1 downto 0);
    signal flsb_1_468, flsb_1_469, flsb_1_470, flsb_1_471 : unsigned(n-1 downto 0);
    signal flsb_1_472, flsb_1_473, flsb_1_474, flsb_1_475 : unsigned(n-1 downto 0);
    signal flsb_1_476, flsb_1_477, flsb_1_478, flsb_1_479 : unsigned(n-1 downto 0);
    signal flsb_1_480, flsb_1_481, flsb_1_482, flsb_1_483 : unsigned(n-1 downto 0);
    signal flsb_1_484, flsb_1_485, flsb_1_486, flsb_1_487 : unsigned(n-1 downto 0);
    signal flsb_1_488, flsb_1_489, flsb_1_490, flsb_1_491 : unsigned(n-1 downto 0);
    signal flsb_1_492, flsb_1_493, flsb_1_494, flsb_1_495 : unsigned(n-1 downto 0);
    signal flsb_1_496, flsb_1_497, flsb_1_498, flsb_1_499 : unsigned(n-1 downto 0);
    signal flsb_1_500, flsb_1_501, flsb_1_502, flsb_1_503 : unsigned(n-1 downto 0);
    signal flsb_1_504, flsb_1_505, flsb_1_506, flsb_1_507 : unsigned(n-1 downto 0);
    signal flsb_1_508, flsb_1_509, flsb_1_510, flsb_1_511 : unsigned(n-1 downto 0);

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
    signal flsb_2_128, flsb_2_129, flsb_2_130, flsb_2_131 : unsigned(n-1 downto 0);
    signal flsb_2_132, flsb_2_133, flsb_2_134, flsb_2_135 : unsigned(n-1 downto 0);
    signal flsb_2_136, flsb_2_137, flsb_2_138, flsb_2_139 : unsigned(n-1 downto 0);
    signal flsb_2_140, flsb_2_141, flsb_2_142, flsb_2_143 : unsigned(n-1 downto 0);
    signal flsb_2_144, flsb_2_145, flsb_2_146, flsb_2_147 : unsigned(n-1 downto 0);
    signal flsb_2_148, flsb_2_149, flsb_2_150, flsb_2_151 : unsigned(n-1 downto 0);
    signal flsb_2_152, flsb_2_153, flsb_2_154, flsb_2_155 : unsigned(n-1 downto 0);
    signal flsb_2_156, flsb_2_157, flsb_2_158, flsb_2_159 : unsigned(n-1 downto 0);
    signal flsb_2_160, flsb_2_161, flsb_2_162, flsb_2_163 : unsigned(n-1 downto 0);
    signal flsb_2_164, flsb_2_165, flsb_2_166, flsb_2_167 : unsigned(n-1 downto 0);
    signal flsb_2_168, flsb_2_169, flsb_2_170, flsb_2_171 : unsigned(n-1 downto 0);
    signal flsb_2_172, flsb_2_173, flsb_2_174, flsb_2_175 : unsigned(n-1 downto 0);
    signal flsb_2_176, flsb_2_177, flsb_2_178, flsb_2_179 : unsigned(n-1 downto 0);
    signal flsb_2_180, flsb_2_181, flsb_2_182, flsb_2_183 : unsigned(n-1 downto 0);
    signal flsb_2_184, flsb_2_185, flsb_2_186, flsb_2_187 : unsigned(n-1 downto 0);
    signal flsb_2_188, flsb_2_189, flsb_2_190, flsb_2_191 : unsigned(n-1 downto 0);
    signal flsb_2_192, flsb_2_193, flsb_2_194, flsb_2_195 : unsigned(n-1 downto 0);
    signal flsb_2_196, flsb_2_197, flsb_2_198, flsb_2_199 : unsigned(n-1 downto 0);
    signal flsb_2_200, flsb_2_201, flsb_2_202, flsb_2_203 : unsigned(n-1 downto 0);
    signal flsb_2_204, flsb_2_205, flsb_2_206, flsb_2_207 : unsigned(n-1 downto 0);
    signal flsb_2_208, flsb_2_209, flsb_2_210, flsb_2_211 : unsigned(n-1 downto 0);
    signal flsb_2_212, flsb_2_213, flsb_2_214, flsb_2_215 : unsigned(n-1 downto 0);
    signal flsb_2_216, flsb_2_217, flsb_2_218, flsb_2_219 : unsigned(n-1 downto 0);
    signal flsb_2_220, flsb_2_221, flsb_2_222, flsb_2_223 : unsigned(n-1 downto 0);
    signal flsb_2_224, flsb_2_225, flsb_2_226, flsb_2_227 : unsigned(n-1 downto 0);
    signal flsb_2_228, flsb_2_229, flsb_2_230, flsb_2_231 : unsigned(n-1 downto 0);
    signal flsb_2_232, flsb_2_233, flsb_2_234, flsb_2_235 : unsigned(n-1 downto 0);
    signal flsb_2_236, flsb_2_237, flsb_2_238, flsb_2_239 : unsigned(n-1 downto 0);
    signal flsb_2_240, flsb_2_241, flsb_2_242, flsb_2_243 : unsigned(n-1 downto 0);
    signal flsb_2_244, flsb_2_245, flsb_2_246, flsb_2_247 : unsigned(n-1 downto 0);
    signal flsb_2_248, flsb_2_249, flsb_2_250, flsb_2_251 : unsigned(n-1 downto 0);
    signal flsb_2_252, flsb_2_253, flsb_2_254, flsb_2_255 : unsigned(n-1 downto 0);

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
    signal flsb_3_64, flsb_3_65, flsb_3_66, flsb_3_67 : unsigned(n-1 downto 0);
    signal flsb_3_68, flsb_3_69, flsb_3_70, flsb_3_71 : unsigned(n-1 downto 0);
    signal flsb_3_72, flsb_3_73, flsb_3_74, flsb_3_75 : unsigned(n-1 downto 0);
    signal flsb_3_76, flsb_3_77, flsb_3_78, flsb_3_79 : unsigned(n-1 downto 0);
    signal flsb_3_80, flsb_3_81, flsb_3_82, flsb_3_83 : unsigned(n-1 downto 0);
    signal flsb_3_84, flsb_3_85, flsb_3_86, flsb_3_87 : unsigned(n-1 downto 0);
    signal flsb_3_88, flsb_3_89, flsb_3_90, flsb_3_91 : unsigned(n-1 downto 0);
    signal flsb_3_92, flsb_3_93, flsb_3_94, flsb_3_95 : unsigned(n-1 downto 0);
    signal flsb_3_96, flsb_3_97, flsb_3_98, flsb_3_99 : unsigned(n-1 downto 0);
    signal flsb_3_100, flsb_3_101, flsb_3_102, flsb_3_103 : unsigned(n-1 downto 0);
    signal flsb_3_104, flsb_3_105, flsb_3_106, flsb_3_107 : unsigned(n-1 downto 0);
    signal flsb_3_108, flsb_3_109, flsb_3_110, flsb_3_111 : unsigned(n-1 downto 0);
    signal flsb_3_112, flsb_3_113, flsb_3_114, flsb_3_115 : unsigned(n-1 downto 0);
    signal flsb_3_116, flsb_3_117, flsb_3_118, flsb_3_119 : unsigned(n-1 downto 0);
    signal flsb_3_120, flsb_3_121, flsb_3_122, flsb_3_123 : unsigned(n-1 downto 0);
    signal flsb_3_124, flsb_3_125, flsb_3_126, flsb_3_127 : unsigned(n-1 downto 0);

    -- nível 4
    signal flsb_4_0, flsb_4_1, flsb_4_2, flsb_4_3 : unsigned(n-1 downto 0);
    signal flsb_4_4, flsb_4_5, flsb_4_6, flsb_4_7 : unsigned(n-1 downto 0);
    signal flsb_4_8, flsb_4_9, flsb_4_10, flsb_4_11 : unsigned(n-1 downto 0);
    signal flsb_4_12, flsb_4_13, flsb_4_14, flsb_4_15 : unsigned(n-1 downto 0);
    signal flsb_4_16, flsb_4_17, flsb_4_18, flsb_4_19 : unsigned(n-1 downto 0);
    signal flsb_4_20, flsb_4_21, flsb_4_22, flsb_4_23 : unsigned(n-1 downto 0);
    signal flsb_4_24, flsb_4_25, flsb_4_26, flsb_4_27 : unsigned(n-1 downto 0);
    signal flsb_4_28, flsb_4_29, flsb_4_30, flsb_4_31 : unsigned(n-1 downto 0);
    signal flsb_4_32, flsb_4_33, flsb_4_34, flsb_4_35 : unsigned(n-1 downto 0);
    signal flsb_4_36, flsb_4_37, flsb_4_38, flsb_4_39 : unsigned(n-1 downto 0);
    signal flsb_4_40, flsb_4_41, flsb_4_42, flsb_4_43 : unsigned(n-1 downto 0);
    signal flsb_4_44, flsb_4_45, flsb_4_46, flsb_4_47 : unsigned(n-1 downto 0);
    signal flsb_4_48, flsb_4_49, flsb_4_50, flsb_4_51 : unsigned(n-1 downto 0);
    signal flsb_4_52, flsb_4_53, flsb_4_54, flsb_4_55 : unsigned(n-1 downto 0);
    signal flsb_4_56, flsb_4_57, flsb_4_58, flsb_4_59 : unsigned(n-1 downto 0);
    signal flsb_4_60, flsb_4_61, flsb_4_62, flsb_4_63 : unsigned(n-1 downto 0);

    -- nível 5
    signal flsb_5_0, flsb_5_1, flsb_5_2, flsb_5_3 : unsigned(n-1 downto 0);
    signal flsb_5_4, flsb_5_5, flsb_5_6, flsb_5_7 : unsigned(n-1 downto 0);
    signal flsb_5_8, flsb_5_9, flsb_5_10, flsb_5_11 : unsigned(n-1 downto 0);
    signal flsb_5_12, flsb_5_13, flsb_5_14, flsb_5_15 : unsigned(n-1 downto 0);
    signal flsb_5_16, flsb_5_17, flsb_5_18, flsb_5_19 : unsigned(n-1 downto 0);
    signal flsb_5_20, flsb_5_21, flsb_5_22, flsb_5_23 : unsigned(n-1 downto 0);
    signal flsb_5_24, flsb_5_25, flsb_5_26, flsb_5_27 : unsigned(n-1 downto 0);
    signal flsb_5_28, flsb_5_29, flsb_5_30, flsb_5_31 : unsigned(n-1 downto 0);

    -- nível 6
    signal flsb_6_0, flsb_6_1, flsb_6_2, flsb_6_3 : unsigned(n-1 downto 0);
    signal flsb_6_4, flsb_6_5, flsb_6_6, flsb_6_7 : unsigned(n-1 downto 0);
    signal flsb_6_8, flsb_6_9, flsb_6_10, flsb_6_11 : unsigned(n-1 downto 0);
    signal flsb_6_12, flsb_6_13, flsb_6_14, flsb_6_15 : unsigned(n-1 downto 0);

    -- nível 7
    signal flsb_7_0, flsb_7_1, flsb_7_2, flsb_7_3 : unsigned(n-1 downto 0);
    signal flsb_7_4, flsb_7_5, flsb_7_6, flsb_7_7 : unsigned(n-1 downto 0);

    -- nível 8
    signal flsb_8_0, flsb_8_1, flsb_8_2, flsb_8_3 : unsigned(n-1 downto 0);

    -- nível 9
    signal flsb_9_0, flsb_9_1 : unsigned(n-1 downto 0);

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
    flsb_1_256 <= shift_left(a256, 256);
    flsb_1_257 <= shift_left(a257, 257);
    flsb_1_258 <= shift_left(a258, 258);
    flsb_1_259 <= shift_left(a259, 259);
    flsb_1_260 <= shift_left(a260, 260);
    flsb_1_261 <= shift_left(a261, 261);
    flsb_1_262 <= shift_left(a262, 262);
    flsb_1_263 <= shift_left(a263, 263);
    flsb_1_264 <= shift_left(a264, 264);
    flsb_1_265 <= shift_left(a265, 265);
    flsb_1_266 <= shift_left(a266, 266);
    flsb_1_267 <= shift_left(a267, 267);
    flsb_1_268 <= shift_left(a268, 268);
    flsb_1_269 <= shift_left(a269, 269);
    flsb_1_270 <= shift_left(a270, 270);
    flsb_1_271 <= shift_left(a271, 271);
    flsb_1_272 <= shift_left(a272, 272);
    flsb_1_273 <= shift_left(a273, 273);
    flsb_1_274 <= shift_left(a274, 274);
    flsb_1_275 <= shift_left(a275, 275);
    flsb_1_276 <= shift_left(a276, 276);
    flsb_1_277 <= shift_left(a277, 277);
    flsb_1_278 <= shift_left(a278, 278);
    flsb_1_279 <= shift_left(a279, 279);
    flsb_1_280 <= shift_left(a280, 280);
    flsb_1_281 <= shift_left(a281, 281);
    flsb_1_282 <= shift_left(a282, 282);
    flsb_1_283 <= shift_left(a283, 283);
    flsb_1_284 <= shift_left(a284, 284);
    flsb_1_285 <= shift_left(a285, 285);
    flsb_1_286 <= shift_left(a286, 286);
    flsb_1_287 <= shift_left(a287, 287);
    flsb_1_288 <= shift_left(a288, 288);
    flsb_1_289 <= shift_left(a289, 289);
    flsb_1_290 <= shift_left(a290, 290);
    flsb_1_291 <= shift_left(a291, 291);
    flsb_1_292 <= shift_left(a292, 292);
    flsb_1_293 <= shift_left(a293, 293);
    flsb_1_294 <= shift_left(a294, 294);
    flsb_1_295 <= shift_left(a295, 295);
    flsb_1_296 <= shift_left(a296, 296);
    flsb_1_297 <= shift_left(a297, 297);
    flsb_1_298 <= shift_left(a298, 298);
    flsb_1_299 <= shift_left(a299, 299);
    flsb_1_300 <= shift_left(a300, 300);
    flsb_1_301 <= shift_left(a301, 301);
    flsb_1_302 <= shift_left(a302, 302);
    flsb_1_303 <= shift_left(a303, 303);
    flsb_1_304 <= shift_left(a304, 304);
    flsb_1_305 <= shift_left(a305, 305);
    flsb_1_306 <= shift_left(a306, 306);
    flsb_1_307 <= shift_left(a307, 307);
    flsb_1_308 <= shift_left(a308, 308);
    flsb_1_309 <= shift_left(a309, 309);
    flsb_1_310 <= shift_left(a310, 310);
    flsb_1_311 <= shift_left(a311, 311);
    flsb_1_312 <= shift_left(a312, 312);
    flsb_1_313 <= shift_left(a313, 313);
    flsb_1_314 <= shift_left(a314, 314);
    flsb_1_315 <= shift_left(a315, 315);
    flsb_1_316 <= shift_left(a316, 316);
    flsb_1_317 <= shift_left(a317, 317);
    flsb_1_318 <= shift_left(a318, 318);
    flsb_1_319 <= shift_left(a319, 319);
    flsb_1_320 <= shift_left(a320, 320);
    flsb_1_321 <= shift_left(a321, 321);
    flsb_1_322 <= shift_left(a322, 322);
    flsb_1_323 <= shift_left(a323, 323);
    flsb_1_324 <= shift_left(a324, 324);
    flsb_1_325 <= shift_left(a325, 325);
    flsb_1_326 <= shift_left(a326, 326);
    flsb_1_327 <= shift_left(a327, 327);
    flsb_1_328 <= shift_left(a328, 328);
    flsb_1_329 <= shift_left(a329, 329);
    flsb_1_330 <= shift_left(a330, 330);
    flsb_1_331 <= shift_left(a331, 331);
    flsb_1_332 <= shift_left(a332, 332);
    flsb_1_333 <= shift_left(a333, 333);
    flsb_1_334 <= shift_left(a334, 334);
    flsb_1_335 <= shift_left(a335, 335);
    flsb_1_336 <= shift_left(a336, 336);
    flsb_1_337 <= shift_left(a337, 337);
    flsb_1_338 <= shift_left(a338, 338);
    flsb_1_339 <= shift_left(a339, 339);
    flsb_1_340 <= shift_left(a340, 340);
    flsb_1_341 <= shift_left(a341, 341);
    flsb_1_342 <= shift_left(a342, 342);
    flsb_1_343 <= shift_left(a343, 343);
    flsb_1_344 <= shift_left(a344, 344);
    flsb_1_345 <= shift_left(a345, 345);
    flsb_1_346 <= shift_left(a346, 346);
    flsb_1_347 <= shift_left(a347, 347);
    flsb_1_348 <= shift_left(a348, 348);
    flsb_1_349 <= shift_left(a349, 349);
    flsb_1_350 <= shift_left(a350, 350);
    flsb_1_351 <= shift_left(a351, 351);
    flsb_1_352 <= shift_left(a352, 352);
    flsb_1_353 <= shift_left(a353, 353);
    flsb_1_354 <= shift_left(a354, 354);
    flsb_1_355 <= shift_left(a355, 355);
    flsb_1_356 <= shift_left(a356, 356);
    flsb_1_357 <= shift_left(a357, 357);
    flsb_1_358 <= shift_left(a358, 358);
    flsb_1_359 <= shift_left(a359, 359);
    flsb_1_360 <= shift_left(a360, 360);
    flsb_1_361 <= shift_left(a361, 361);
    flsb_1_362 <= shift_left(a362, 362);
    flsb_1_363 <= shift_left(a363, 363);
    flsb_1_364 <= shift_left(a364, 364);
    flsb_1_365 <= shift_left(a365, 365);
    flsb_1_366 <= shift_left(a366, 366);
    flsb_1_367 <= shift_left(a367, 367);
    flsb_1_368 <= shift_left(a368, 368);
    flsb_1_369 <= shift_left(a369, 369);
    flsb_1_370 <= shift_left(a370, 370);
    flsb_1_371 <= shift_left(a371, 371);
    flsb_1_372 <= shift_left(a372, 372);
    flsb_1_373 <= shift_left(a373, 373);
    flsb_1_374 <= shift_left(a374, 374);
    flsb_1_375 <= shift_left(a375, 375);
    flsb_1_376 <= shift_left(a376, 376);
    flsb_1_377 <= shift_left(a377, 377);
    flsb_1_378 <= shift_left(a378, 378);
    flsb_1_379 <= shift_left(a379, 379);
    flsb_1_380 <= shift_left(a380, 380);
    flsb_1_381 <= shift_left(a381, 381);
    flsb_1_382 <= shift_left(a382, 382);
    flsb_1_383 <= shift_left(a383, 383);
    flsb_1_384 <= shift_left(a384, 384);
    flsb_1_385 <= shift_left(a385, 385);
    flsb_1_386 <= shift_left(a386, 386);
    flsb_1_387 <= shift_left(a387, 387);
    flsb_1_388 <= shift_left(a388, 388);
    flsb_1_389 <= shift_left(a389, 389);
    flsb_1_390 <= shift_left(a390, 390);
    flsb_1_391 <= shift_left(a391, 391);
    flsb_1_392 <= shift_left(a392, 392);
    flsb_1_393 <= shift_left(a393, 393);
    flsb_1_394 <= shift_left(a394, 394);
    flsb_1_395 <= shift_left(a395, 395);
    flsb_1_396 <= shift_left(a396, 396);
    flsb_1_397 <= shift_left(a397, 397);
    flsb_1_398 <= shift_left(a398, 398);
    flsb_1_399 <= shift_left(a399, 399);
    flsb_1_400 <= shift_left(a400, 400);
    flsb_1_401 <= shift_left(a401, 401);
    flsb_1_402 <= shift_left(a402, 402);
    flsb_1_403 <= shift_left(a403, 403);
    flsb_1_404 <= shift_left(a404, 404);
    flsb_1_405 <= shift_left(a405, 405);
    flsb_1_406 <= shift_left(a406, 406);
    flsb_1_407 <= shift_left(a407, 407);
    flsb_1_408 <= shift_left(a408, 408);
    flsb_1_409 <= shift_left(a409, 409);
    flsb_1_410 <= shift_left(a410, 410);
    flsb_1_411 <= shift_left(a411, 411);
    flsb_1_412 <= shift_left(a412, 412);
    flsb_1_413 <= shift_left(a413, 413);
    flsb_1_414 <= shift_left(a414, 414);
    flsb_1_415 <= shift_left(a415, 415);
    flsb_1_416 <= shift_left(a416, 416);
    flsb_1_417 <= shift_left(a417, 417);
    flsb_1_418 <= shift_left(a418, 418);
    flsb_1_419 <= shift_left(a419, 419);
    flsb_1_420 <= shift_left(a420, 420);
    flsb_1_421 <= shift_left(a421, 421);
    flsb_1_422 <= shift_left(a422, 422);
    flsb_1_423 <= shift_left(a423, 423);
    flsb_1_424 <= shift_left(a424, 424);
    flsb_1_425 <= shift_left(a425, 425);
    flsb_1_426 <= shift_left(a426, 426);
    flsb_1_427 <= shift_left(a427, 427);
    flsb_1_428 <= shift_left(a428, 428);
    flsb_1_429 <= shift_left(a429, 429);
    flsb_1_430 <= shift_left(a430, 430);
    flsb_1_431 <= shift_left(a431, 431);
    flsb_1_432 <= shift_left(a432, 432);
    flsb_1_433 <= shift_left(a433, 433);
    flsb_1_434 <= shift_left(a434, 434);
    flsb_1_435 <= shift_left(a435, 435);
    flsb_1_436 <= shift_left(a436, 436);
    flsb_1_437 <= shift_left(a437, 437);
    flsb_1_438 <= shift_left(a438, 438);
    flsb_1_439 <= shift_left(a439, 439);
    flsb_1_440 <= shift_left(a440, 440);
    flsb_1_441 <= shift_left(a441, 441);
    flsb_1_442 <= shift_left(a442, 442);
    flsb_1_443 <= shift_left(a443, 443);
    flsb_1_444 <= shift_left(a444, 444);
    flsb_1_445 <= shift_left(a445, 445);
    flsb_1_446 <= shift_left(a446, 446);
    flsb_1_447 <= shift_left(a447, 447);
    flsb_1_448 <= shift_left(a448, 448);
    flsb_1_449 <= shift_left(a449, 449);
    flsb_1_450 <= shift_left(a450, 450);
    flsb_1_451 <= shift_left(a451, 451);
    flsb_1_452 <= shift_left(a452, 452);
    flsb_1_453 <= shift_left(a453, 453);
    flsb_1_454 <= shift_left(a454, 454);
    flsb_1_455 <= shift_left(a455, 455);
    flsb_1_456 <= shift_left(a456, 456);
    flsb_1_457 <= shift_left(a457, 457);
    flsb_1_458 <= shift_left(a458, 458);
    flsb_1_459 <= shift_left(a459, 459);
    flsb_1_460 <= shift_left(a460, 460);
    flsb_1_461 <= shift_left(a461, 461);
    flsb_1_462 <= shift_left(a462, 462);
    flsb_1_463 <= shift_left(a463, 463);
    flsb_1_464 <= shift_left(a464, 464);
    flsb_1_465 <= shift_left(a465, 465);
    flsb_1_466 <= shift_left(a466, 466);
    flsb_1_467 <= shift_left(a467, 467);
    flsb_1_468 <= shift_left(a468, 468);
    flsb_1_469 <= shift_left(a469, 469);
    flsb_1_470 <= shift_left(a470, 470);
    flsb_1_471 <= shift_left(a471, 471);
    flsb_1_472 <= shift_left(a472, 472);
    flsb_1_473 <= shift_left(a473, 473);
    flsb_1_474 <= shift_left(a474, 474);
    flsb_1_475 <= shift_left(a475, 475);
    flsb_1_476 <= shift_left(a476, 476);
    flsb_1_477 <= shift_left(a477, 477);
    flsb_1_478 <= shift_left(a478, 478);
    flsb_1_479 <= shift_left(a479, 479);
    flsb_1_480 <= shift_left(a480, 480);
    flsb_1_481 <= shift_left(a481, 481);
    flsb_1_482 <= shift_left(a482, 482);
    flsb_1_483 <= shift_left(a483, 483);
    flsb_1_484 <= shift_left(a484, 484);
    flsb_1_485 <= shift_left(a485, 485);
    flsb_1_486 <= shift_left(a486, 486);
    flsb_1_487 <= shift_left(a487, 487);
    flsb_1_488 <= shift_left(a488, 488);
    flsb_1_489 <= shift_left(a489, 489);
    flsb_1_490 <= shift_left(a490, 490);
    flsb_1_491 <= shift_left(a491, 491);
    flsb_1_492 <= shift_left(a492, 492);
    flsb_1_493 <= shift_left(a493, 493);
    flsb_1_494 <= shift_left(a494, 494);
    flsb_1_495 <= shift_left(a495, 495);
    flsb_1_496 <= shift_left(a496, 496);
    flsb_1_497 <= shift_left(a497, 497);
    flsb_1_498 <= shift_left(a498, 498);
    flsb_1_499 <= shift_left(a499, 499);
    flsb_1_500 <= shift_left(a500, 500);
    flsb_1_501 <= shift_left(a501, 501);
    flsb_1_502 <= shift_left(a502, 502);
    flsb_1_503 <= shift_left(a503, 503);
    flsb_1_504 <= shift_left(a504, 504);
    flsb_1_505 <= shift_left(a505, 505);
    flsb_1_506 <= shift_left(a506, 506);
    flsb_1_507 <= shift_left(a507, 507);
    flsb_1_508 <= shift_left(a508, 508);
    flsb_1_509 <= shift_left(a509, 509);
    flsb_1_510 <= shift_left(a510, 510);
    flsb_1_511 <= shift_left(a511, 511);

    --------------------------------------------------------------------------
    -- Nível 2 (256 somas)
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
    flsb_2_128 <= flsb_1_256 + flsb_1_257;
    flsb_2_129 <= flsb_1_258 + flsb_1_259;
    flsb_2_130 <= flsb_1_260 + flsb_1_261;
    flsb_2_131 <= flsb_1_262 + flsb_1_263;
    flsb_2_132 <= flsb_1_264 + flsb_1_265;
    flsb_2_133 <= flsb_1_266 + flsb_1_267;
    flsb_2_134 <= flsb_1_268 + flsb_1_269;
    flsb_2_135 <= flsb_1_270 + flsb_1_271;
    flsb_2_136 <= flsb_1_272 + flsb_1_273;
    flsb_2_137 <= flsb_1_274 + flsb_1_275;
    flsb_2_138 <= flsb_1_276 + flsb_1_277;
    flsb_2_139 <= flsb_1_278 + flsb_1_279;
    flsb_2_140 <= flsb_1_280 + flsb_1_281;
    flsb_2_141 <= flsb_1_282 + flsb_1_283;
    flsb_2_142 <= flsb_1_284 + flsb_1_285;
    flsb_2_143 <= flsb_1_286 + flsb_1_287;
    flsb_2_144 <= flsb_1_288 + flsb_1_289;
    flsb_2_145 <= flsb_1_290 + flsb_1_291;
    flsb_2_146 <= flsb_1_292 + flsb_1_293;
    flsb_2_147 <= flsb_1_294 + flsb_1_295;
    flsb_2_148 <= flsb_1_296 + flsb_1_297;
    flsb_2_149 <= flsb_1_298 + flsb_1_299;
    flsb_2_150 <= flsb_1_300 + flsb_1_301;
    flsb_2_151 <= flsb_1_302 + flsb_1_303;
    flsb_2_152 <= flsb_1_304 + flsb_1_305;
    flsb_2_153 <= flsb_1_306 + flsb_1_307;
    flsb_2_154 <= flsb_1_308 + flsb_1_309;
    flsb_2_155 <= flsb_1_310 + flsb_1_311;
    flsb_2_156 <= flsb_1_312 + flsb_1_313;
    flsb_2_157 <= flsb_1_314 + flsb_1_315;
    flsb_2_158 <= flsb_1_316 + flsb_1_317;
    flsb_2_159 <= flsb_1_318 + flsb_1_319;
    flsb_2_160 <= flsb_1_320 + flsb_1_321;
    flsb_2_161 <= flsb_1_322 + flsb_1_323;
    flsb_2_162 <= flsb_1_324 + flsb_1_325;
    flsb_2_163 <= flsb_1_326 + flsb_1_327;
    flsb_2_164 <= flsb_1_328 + flsb_1_329;
    flsb_2_165 <= flsb_1_330 + flsb_1_331;
    flsb_2_166 <= flsb_1_332 + flsb_1_333;
    flsb_2_167 <= flsb_1_334 + flsb_1_335;
    flsb_2_168 <= flsb_1_336 + flsb_1_337;
    flsb_2_169 <= flsb_1_338 + flsb_1_339;
    flsb_2_170 <= flsb_1_340 + flsb_1_341;
    flsb_2_171 <= flsb_1_342 + flsb_1_343;
    flsb_2_172 <= flsb_1_344 + flsb_1_345;
    flsb_2_173 <= flsb_1_346 + flsb_1_347;
    flsb_2_174 <= flsb_1_348 + flsb_1_349;
    flsb_2_175 <= flsb_1_350 + flsb_1_351;
    flsb_2_176 <= flsb_1_352 + flsb_1_353;
    flsb_2_177 <= flsb_1_354 + flsb_1_355;
    flsb_2_178 <= flsb_1_356 + flsb_1_357;
    flsb_2_179 <= flsb_1_358 + flsb_1_359;
    flsb_2_180 <= flsb_1_360 + flsb_1_361;
    flsb_2_181 <= flsb_1_362 + flsb_1_363;
    flsb_2_182 <= flsb_1_364 + flsb_1_365;
    flsb_2_183 <= flsb_1_366 + flsb_1_367;
    flsb_2_184 <= flsb_1_368 + flsb_1_369;
    flsb_2_185 <= flsb_1_370 + flsb_1_371;
    flsb_2_186 <= flsb_1_372 + flsb_1_373;
    flsb_2_187 <= flsb_1_374 + flsb_1_375;
    flsb_2_188 <= flsb_1_376 + flsb_1_377;
    flsb_2_189 <= flsb_1_378 + flsb_1_379;
    flsb_2_190 <= flsb_1_380 + flsb_1_381;
    flsb_2_191 <= flsb_1_382 + flsb_1_383;
    flsb_2_192 <= flsb_1_384 + flsb_1_385;
    flsb_2_193 <= flsb_1_386 + flsb_1_387;
    flsb_2_194 <= flsb_1_388 + flsb_1_389;
    flsb_2_195 <= flsb_1_390 + flsb_1_391;
    flsb_2_196 <= flsb_1_392 + flsb_1_393;
    flsb_2_197 <= flsb_1_394 + flsb_1_395;
    flsb_2_198 <= flsb_1_396 + flsb_1_397;
    flsb_2_199 <= flsb_1_398 + flsb_1_399;
    flsb_2_200 <= flsb_1_400 + flsb_1_401;
    flsb_2_201 <= flsb_1_402 + flsb_1_403;
    flsb_2_202 <= flsb_1_404 + flsb_1_405;
    flsb_2_203 <= flsb_1_406 + flsb_1_407;
    flsb_2_204 <= flsb_1_408 + flsb_1_409;
    flsb_2_205 <= flsb_1_410 + flsb_1_411;
    flsb_2_206 <= flsb_1_412 + flsb_1_413;
    flsb_2_207 <= flsb_1_414 + flsb_1_415;
    flsb_2_208 <= flsb_1_416 + flsb_1_417;
    flsb_2_209 <= flsb_1_418 + flsb_1_419;
    flsb_2_210 <= flsb_1_420 + flsb_1_421;
    flsb_2_211 <= flsb_1_422 + flsb_1_423;
    flsb_2_212 <= flsb_1_424 + flsb_1_425;
    flsb_2_213 <= flsb_1_426 + flsb_1_427;
    flsb_2_214 <= flsb_1_428 + flsb_1_429;
    flsb_2_215 <= flsb_1_430 + flsb_1_431;
    flsb_2_216 <= flsb_1_432 + flsb_1_433;
    flsb_2_217 <= flsb_1_434 + flsb_1_435;
    flsb_2_218 <= flsb_1_436 + flsb_1_437;
    flsb_2_219 <= flsb_1_438 + flsb_1_439;
    flsb_2_220 <= flsb_1_440 + flsb_1_441;
    flsb_2_221 <= flsb_1_442 + flsb_1_443;
    flsb_2_222 <= flsb_1_444 + flsb_1_445;
    flsb_2_223 <= flsb_1_446 + flsb_1_447;
    flsb_2_224 <= flsb_1_448 + flsb_1_449;
    flsb_2_225 <= flsb_1_450 + flsb_1_451;
    flsb_2_226 <= flsb_1_452 + flsb_1_453;
    flsb_2_227 <= flsb_1_454 + flsb_1_455;
    flsb_2_228 <= flsb_1_456 + flsb_1_457;
    flsb_2_229 <= flsb_1_458 + flsb_1_459;
    flsb_2_230 <= flsb_1_460 + flsb_1_461;
    flsb_2_231 <= flsb_1_462 + flsb_1_463;
    flsb_2_232 <= flsb_1_464 + flsb_1_465;
    flsb_2_233 <= flsb_1_466 + flsb_1_467;
    flsb_2_234 <= flsb_1_468 + flsb_1_469;
    flsb_2_235 <= flsb_1_470 + flsb_1_471;
    flsb_2_236 <= flsb_1_472 + flsb_1_473;
    flsb_2_237 <= flsb_1_474 + flsb_1_475;
    flsb_2_238 <= flsb_1_476 + flsb_1_477;
    flsb_2_239 <= flsb_1_478 + flsb_1_479;
    flsb_2_240 <= flsb_1_480 + flsb_1_481;
    flsb_2_241 <= flsb_1_482 + flsb_1_483;
    flsb_2_242 <= flsb_1_484 + flsb_1_485;
    flsb_2_243 <= flsb_1_486 + flsb_1_487;
    flsb_2_244 <= flsb_1_488 + flsb_1_489;
    flsb_2_245 <= flsb_1_490 + flsb_1_491;
    flsb_2_246 <= flsb_1_492 + flsb_1_493;
    flsb_2_247 <= flsb_1_494 + flsb_1_495;
    flsb_2_248 <= flsb_1_496 + flsb_1_497;
    flsb_2_249 <= flsb_1_498 + flsb_1_499;
    flsb_2_250 <= flsb_1_500 + flsb_1_501;
    flsb_2_251 <= flsb_1_502 + flsb_1_503;
    flsb_2_252 <= flsb_1_504 + flsb_1_505;
    flsb_2_253 <= flsb_1_506 + flsb_1_507;
    flsb_2_254 <= flsb_1_508 + flsb_1_509;
    flsb_2_255 <= flsb_1_510 + flsb_1_511;

    --------------------------------------------------------------------------
    -- Nível 3 (128 somas)
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
    flsb_3_64 <= flsb_2_128 + flsb_2_129;
    flsb_3_65 <= flsb_2_130 + flsb_2_131;
    flsb_3_66 <= flsb_2_132 + flsb_2_133;
    flsb_3_67 <= flsb_2_134 + flsb_2_135;
    flsb_3_68 <= flsb_2_136 + flsb_2_137;
    flsb_3_69 <= flsb_2_138 + flsb_2_139;
    flsb_3_70 <= flsb_2_140 + flsb_2_141;
    flsb_3_71 <= flsb_2_142 + flsb_2_143;
    flsb_3_72 <= flsb_2_144 + flsb_2_145;
    flsb_3_73 <= flsb_2_146 + flsb_2_147;
    flsb_3_74 <= flsb_2_148 + flsb_2_149;
    flsb_3_75 <= flsb_2_150 + flsb_2_151;
    flsb_3_76 <= flsb_2_152 + flsb_2_153;
    flsb_3_77 <= flsb_2_154 + flsb_2_155;
    flsb_3_78 <= flsb_2_156 + flsb_2_157;
    flsb_3_79 <= flsb_2_158 + flsb_2_159;
    flsb_3_80 <= flsb_2_160 + flsb_2_161;
    flsb_3_81 <= flsb_2_162 + flsb_2_163;
    flsb_3_82 <= flsb_2_164 + flsb_2_165;
    flsb_3_83 <= flsb_2_166 + flsb_2_167;
    flsb_3_84 <= flsb_2_168 + flsb_2_169;
    flsb_3_85 <= flsb_2_170 + flsb_2_171;
    flsb_3_86 <= flsb_2_172 + flsb_2_173;
    flsb_3_87 <= flsb_2_174 + flsb_2_175;
    flsb_3_88 <= flsb_2_176 + flsb_2_177;
    flsb_3_89 <= flsb_2_178 + flsb_2_179;
    flsb_3_90 <= flsb_2_180 + flsb_2_181;
    flsb_3_91 <= flsb_2_182 + flsb_2_183;
    flsb_3_92 <= flsb_2_184 + flsb_2_185;
    flsb_3_93 <= flsb_2_186 + flsb_2_187;
    flsb_3_94 <= flsb_2_188 + flsb_2_189;
    flsb_3_95 <= flsb_2_190 + flsb_2_191;
    flsb_3_96 <= flsb_2_192 + flsb_2_193;
    flsb_3_97 <= flsb_2_194 + flsb_2_195;
    flsb_3_98 <= flsb_2_196 + flsb_2_197;
    flsb_3_99 <= flsb_2_198 + flsb_2_199;
    flsb_3_100 <= flsb_2_200 + flsb_2_201;
    flsb_3_101 <= flsb_2_202 + flsb_2_203;
    flsb_3_102 <= flsb_2_204 + flsb_2_205;
    flsb_3_103 <= flsb_2_206 + flsb_2_207;
    flsb_3_104 <= flsb_2_208 + flsb_2_209;
    flsb_3_105 <= flsb_2_210 + flsb_2_211;
    flsb_3_106 <= flsb_2_212 + flsb_2_213;
    flsb_3_107 <= flsb_2_214 + flsb_2_215;
    flsb_3_108 <= flsb_2_216 + flsb_2_217;
    flsb_3_109 <= flsb_2_218 + flsb_2_219;
    flsb_3_110 <= flsb_2_220 + flsb_2_221;
    flsb_3_111 <= flsb_2_222 + flsb_2_223;
    flsb_3_112 <= flsb_2_224 + flsb_2_225;
    flsb_3_113 <= flsb_2_226 + flsb_2_227;
    flsb_3_114 <= flsb_2_228 + flsb_2_229;
    flsb_3_115 <= flsb_2_230 + flsb_2_231;
    flsb_3_116 <= flsb_2_232 + flsb_2_233;
    flsb_3_117 <= flsb_2_234 + flsb_2_235;
    flsb_3_118 <= flsb_2_236 + flsb_2_237;
    flsb_3_119 <= flsb_2_238 + flsb_2_239;
    flsb_3_120 <= flsb_2_240 + flsb_2_241;
    flsb_3_121 <= flsb_2_242 + flsb_2_243;
    flsb_3_122 <= flsb_2_244 + flsb_2_245;
    flsb_3_123 <= flsb_2_246 + flsb_2_247;
    flsb_3_124 <= flsb_2_248 + flsb_2_249;
    flsb_3_125 <= flsb_2_250 + flsb_2_251;
    flsb_3_126 <= flsb_2_252 + flsb_2_253;
    flsb_3_127 <= flsb_2_254 + flsb_2_255;

    --------------------------------------------------------------------------
    -- Nível 4 (64 somas)
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
    flsb_4_32 <= flsb_3_64 + flsb_3_65;
    flsb_4_33 <= flsb_3_66 + flsb_3_67;
    flsb_4_34 <= flsb_3_68 + flsb_3_69;
    flsb_4_35 <= flsb_3_70 + flsb_3_71;
    flsb_4_36 <= flsb_3_72 + flsb_3_73;
    flsb_4_37 <= flsb_3_74 + flsb_3_75;
    flsb_4_38 <= flsb_3_76 + flsb_3_77;
    flsb_4_39 <= flsb_3_78 + flsb_3_79;
    flsb_4_40 <= flsb_3_80 + flsb_3_81;
    flsb_4_41 <= flsb_3_82 + flsb_3_83;
    flsb_4_42 <= flsb_3_84 + flsb_3_85;
    flsb_4_43 <= flsb_3_86 + flsb_3_87;
    flsb_4_44 <= flsb_3_88 + flsb_3_89;
    flsb_4_45 <= flsb_3_90 + flsb_3_91;
    flsb_4_46 <= flsb_3_92 + flsb_3_93;
    flsb_4_47 <= flsb_3_94 + flsb_3_95;
    flsb_4_48 <= flsb_3_96 + flsb_3_97;
    flsb_4_49 <= flsb_3_98 + flsb_3_99;
    flsb_4_50 <= flsb_3_100 + flsb_3_101;
    flsb_4_51 <= flsb_3_102 + flsb_3_103;
    flsb_4_52 <= flsb_3_104 + flsb_3_105;
    flsb_4_53 <= flsb_3_106 + flsb_3_107;
    flsb_4_54 <= flsb_3_108 + flsb_3_109;
    flsb_4_55 <= flsb_3_110 + flsb_3_111;
    flsb_4_56 <= flsb_3_112 + flsb_3_113;
    flsb_4_57 <= flsb_3_114 + flsb_3_115;
    flsb_4_58 <= flsb_3_116 + flsb_3_117;
    flsb_4_59 <= flsb_3_118 + flsb_3_119;
    flsb_4_60 <= flsb_3_120 + flsb_3_121;
    flsb_4_61 <= flsb_3_122 + flsb_3_123;
    flsb_4_62 <= flsb_3_124 + flsb_3_125;
    flsb_4_63 <= flsb_3_126 + flsb_3_127;

    --------------------------------------------------------------------------
    -- Nível 5 (32 somas)
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
    flsb_5_16 <= flsb_4_32 + flsb_4_33;
    flsb_5_17 <= flsb_4_34 + flsb_4_35;
    flsb_5_18 <= flsb_4_36 + flsb_4_37;
    flsb_5_19 <= flsb_4_38 + flsb_4_39;
    flsb_5_20 <= flsb_4_40 + flsb_4_41;
    flsb_5_21 <= flsb_4_42 + flsb_4_43;
    flsb_5_22 <= flsb_4_44 + flsb_4_45;
    flsb_5_23 <= flsb_4_46 + flsb_4_47;
    flsb_5_24 <= flsb_4_48 + flsb_4_49;
    flsb_5_25 <= flsb_4_50 + flsb_4_51;
    flsb_5_26 <= flsb_4_52 + flsb_4_53;
    flsb_5_27 <= flsb_4_54 + flsb_4_55;
    flsb_5_28 <= flsb_4_56 + flsb_4_57;
    flsb_5_29 <= flsb_4_58 + flsb_4_59;
    flsb_5_30 <= flsb_4_60 + flsb_4_61;
    flsb_5_31 <= flsb_4_62 + flsb_4_63;

    --------------------------------------------------------------------------
    -- Nível 6 (16 somas)
    --------------------------------------------------------------------------
    flsb_6_0 <= flsb_5_0 + flsb_5_1;
    flsb_6_1 <= flsb_5_2 + flsb_5_3;
    flsb_6_2 <= flsb_5_4 + flsb_5_5;
    flsb_6_3 <= flsb_5_6 + flsb_5_7;
    flsb_6_4 <= flsb_5_8 + flsb_5_9;
    flsb_6_5 <= flsb_5_10 + flsb_5_11;
    flsb_6_6 <= flsb_5_12 + flsb_5_13;
    flsb_6_7 <= flsb_5_14 + flsb_5_15;
    flsb_6_8 <= flsb_5_16 + flsb_5_17;
    flsb_6_9 <= flsb_5_18 + flsb_5_19;
    flsb_6_10 <= flsb_5_20 + flsb_5_21;
    flsb_6_11 <= flsb_5_22 + flsb_5_23;
    flsb_6_12 <= flsb_5_24 + flsb_5_25;
    flsb_6_13 <= flsb_5_26 + flsb_5_27;
    flsb_6_14 <= flsb_5_28 + flsb_5_29;
    flsb_6_15 <= flsb_5_30 + flsb_5_31;

    --------------------------------------------------------------------------
    -- Nível 7 (8 somas)
    --------------------------------------------------------------------------
    flsb_7_0 <= flsb_6_0 + flsb_6_1;
    flsb_7_1 <= flsb_6_2 + flsb_6_3;
    flsb_7_2 <= flsb_6_4 + flsb_6_5;
    flsb_7_3 <= flsb_6_6 + flsb_6_7;
    flsb_7_4 <= flsb_6_8 + flsb_6_9;
    flsb_7_5 <= flsb_6_10 + flsb_6_11;
    flsb_7_6 <= flsb_6_12 + flsb_6_13;
    flsb_7_7 <= flsb_6_14 + flsb_6_15;

    --------------------------------------------------------------------------
    -- Nível 8 (4 somas)
    --------------------------------------------------------------------------
    flsb_8_0 <= flsb_7_0 + flsb_7_1;
    flsb_8_1 <= flsb_7_2 + flsb_7_3;
    flsb_8_2 <= flsb_7_4 + flsb_7_5;
    flsb_8_3 <= flsb_7_6 + flsb_7_7;

    --------------------------------------------------------------------------
    -- Nível 9 (2 somas)
    --------------------------------------------------------------------------
    flsb_9_0 <= flsb_8_0 + flsb_8_1;
    flsb_9_1 <= flsb_8_2 + flsb_8_3;

    --------------------------------------------------------------------------
    -- Resultado final
    --------------------------------------------------------------------------
    sum <= flsb_9_0 + flsb_9_1;

end architecture;