library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

    entity sum64xn is
        generic(
            n : integer := 128
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
        a60, a61, a62, a63 : in unsigned(n-1 downto 0);
            sum : out unsigned(n-1 downto 0)
        );
    end sum64xn;

    architecture rtl of sum64xn is
    
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

    -- nível 2
    signal flsb_2_0, flsb_2_1, flsb_2_2, flsb_2_3 : unsigned(n-1 downto 0);
    signal flsb_2_4, flsb_2_5, flsb_2_6, flsb_2_7 : unsigned(n-1 downto 0);
    signal flsb_2_8, flsb_2_9, flsb_2_10, flsb_2_11 : unsigned(n-1 downto 0);
    signal flsb_2_12, flsb_2_13, flsb_2_14, flsb_2_15 : unsigned(n-1 downto 0);
    signal flsb_2_16, flsb_2_17, flsb_2_18, flsb_2_19 : unsigned(n-1 downto 0);
    signal flsb_2_20, flsb_2_21, flsb_2_22, flsb_2_23 : unsigned(n-1 downto 0);
    signal flsb_2_24, flsb_2_25, flsb_2_26, flsb_2_27 : unsigned(n-1 downto 0);
    signal flsb_2_28, flsb_2_29, flsb_2_30, flsb_2_31 : unsigned(n-1 downto 0);

    -- nível 3
    signal flsb_3_0, flsb_3_1, flsb_3_2, flsb_3_3 : unsigned(n-1 downto 0);
    signal flsb_3_4, flsb_3_5, flsb_3_6, flsb_3_7 : unsigned(n-1 downto 0);
    signal flsb_3_8, flsb_3_9, flsb_3_10, flsb_3_11 : unsigned(n-1 downto 0);
    signal flsb_3_12, flsb_3_13, flsb_3_14, flsb_3_15 : unsigned(n-1 downto 0);

    -- nível 4
    signal flsb_4_0, flsb_4_1, flsb_4_2, flsb_4_3 : unsigned(n-1 downto 0);
    signal flsb_4_4, flsb_4_5, flsb_4_6, flsb_4_7 : unsigned(n-1 downto 0);

    -- nível 5
    signal flsb_5_0, flsb_5_1, flsb_5_2, flsb_5_3 : unsigned(n-1 downto 0);

    -- nível 6
    signal flsb_6_0, flsb_6_1 : unsigned(n-1 downto 0);

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

    --------------------------------------------------------------------------
    -- Nível 2 (32 somas)
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

    --------------------------------------------------------------------------
    -- Nível 3 (16 somas)
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

    --------------------------------------------------------------------------
    -- Nível 4 (8 somas)
    --------------------------------------------------------------------------
    flsb_4_0 <= flsb_3_0 + flsb_3_1;
    flsb_4_1 <= flsb_3_2 + flsb_3_3;
    flsb_4_2 <= flsb_3_4 + flsb_3_5;
    flsb_4_3 <= flsb_3_6 + flsb_3_7;
    flsb_4_4 <= flsb_3_8 + flsb_3_9;
    flsb_4_5 <= flsb_3_10 + flsb_3_11;
    flsb_4_6 <= flsb_3_12 + flsb_3_13;
    flsb_4_7 <= flsb_3_14 + flsb_3_15;

    --------------------------------------------------------------------------
    -- Nível 5 (4 somas)
    --------------------------------------------------------------------------
    flsb_5_0 <= flsb_4_0 + flsb_4_1;
    flsb_5_1 <= flsb_4_2 + flsb_4_3;
    flsb_5_2 <= flsb_4_4 + flsb_4_5;
    flsb_5_3 <= flsb_4_6 + flsb_4_7;

    --------------------------------------------------------------------------
    -- Nível 6 (2 somas)
    --------------------------------------------------------------------------
    flsb_6_0 <= flsb_5_0 + flsb_5_1;
    flsb_6_1 <= flsb_5_2 + flsb_5_3;

    --------------------------------------------------------------------------
    -- Resultado final
    --------------------------------------------------------------------------
    sum <= flsb_6_0 + flsb_6_1;

end architecture;