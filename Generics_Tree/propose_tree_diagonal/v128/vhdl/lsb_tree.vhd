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
        a124, a125, a126, a127 : in unsigned(n-1 downto 0);
        sum : out unsigned(n+6 downto 0)
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

    -- nível 2
    signal flsb_2_0, flsb_2_1, flsb_2_2, flsb_2_3 : unsigned(n+1 downto 0);
    signal flsb_2_4, flsb_2_5, flsb_2_6, flsb_2_7 : unsigned(n+1 downto 0);
    signal flsb_2_8, flsb_2_9, flsb_2_10, flsb_2_11 : unsigned(n+1 downto 0);
    signal flsb_2_12, flsb_2_13, flsb_2_14, flsb_2_15 : unsigned(n+1 downto 0);
    signal flsb_2_16, flsb_2_17, flsb_2_18, flsb_2_19 : unsigned(n+1 downto 0);
    signal flsb_2_20, flsb_2_21, flsb_2_22, flsb_2_23 : unsigned(n+1 downto 0);
    signal flsb_2_24, flsb_2_25, flsb_2_26, flsb_2_27 : unsigned(n+1 downto 0);
    signal flsb_2_28, flsb_2_29, flsb_2_30, flsb_2_31 : unsigned(n+1 downto 0);

    -- nível 3
    signal flsb_3_0, flsb_3_1, flsb_3_2, flsb_3_3 : unsigned(n+2 downto 0);
    signal flsb_3_4, flsb_3_5, flsb_3_6, flsb_3_7 : unsigned(n+2 downto 0);
    signal flsb_3_8, flsb_3_9, flsb_3_10, flsb_3_11 : unsigned(n+2 downto 0);
    signal flsb_3_12, flsb_3_13, flsb_3_14, flsb_3_15 : unsigned(n+2 downto 0);

    -- nível 4
    signal flsb_4_0, flsb_4_1, flsb_4_2, flsb_4_3 : unsigned(n+3 downto 0);
    signal flsb_4_4, flsb_4_5, flsb_4_6, flsb_4_7 : unsigned(n+3 downto 0);

    -- nível 5
    signal flsb_5_0, flsb_5_1, flsb_5_2, flsb_5_3 : unsigned(n+4 downto 0);

    -- nível 6
    signal flsb_6_0, flsb_6_1 : unsigned(n+5 downto 0);

    -- nível 7
    signal flsb_7_0 : unsigned(n+6 downto 0);

begin

    --------------------------------------------------------------------------
    -- Nível 1 (64 somas)
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

    --------------------------------------------------------------------------
    -- Nível 2 (32 somas)
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

    --------------------------------------------------------------------------
    -- Nível 3 (16 somas)
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

    --------------------------------------------------------------------------
    -- Nível 4 (8 somas)
    --------------------------------------------------------------------------
    flsb_4_0 <= ('0' & flsb_3_0) + ('0' & flsb_3_1);
    flsb_4_1 <= ('0' & flsb_3_2) + ('0' & flsb_3_3);
    flsb_4_2 <= ('0' & flsb_3_4) + ('0' & flsb_3_5);
    flsb_4_3 <= ('0' & flsb_3_6) + ('0' & flsb_3_7);
    flsb_4_4 <= ('0' & flsb_3_8) + ('0' & flsb_3_9);
    flsb_4_5 <= ('0' & flsb_3_10) + ('0' & flsb_3_11);
    flsb_4_6 <= ('0' & flsb_3_12) + ('0' & flsb_3_13);
    flsb_4_7 <= ('0' & flsb_3_14) + ('0' & flsb_3_15);

    --------------------------------------------------------------------------
    -- Nível 5 (4 somas)
    --------------------------------------------------------------------------
    flsb_5_0 <= ('0' & flsb_4_0) + ('0' & flsb_4_1);
    flsb_5_1 <= ('0' & flsb_4_2) + ('0' & flsb_4_3);
    flsb_5_2 <= ('0' & flsb_4_4) + ('0' & flsb_4_5);
    flsb_5_3 <= ('0' & flsb_4_6) + ('0' & flsb_4_7);

    --------------------------------------------------------------------------
    -- Nível 6 (2 somas)
    --------------------------------------------------------------------------
    flsb_6_0 <= ('0' & flsb_5_0) + ('0' & flsb_5_1);
    flsb_6_1 <= ('0' & flsb_5_2) + ('0' & flsb_5_3);

    --------------------------------------------------------------------------
    -- Nível 7 (1 somas)
    --------------------------------------------------------------------------
    flsb_7_0 <= ('0' & flsb_6_0) + ('0' & flsb_6_1);

    
    --------------------------------------------------------------------------
    -- Resultado final
    --------------------------------------------------------------------------
    sum <= flsb_7_0;

end architecture;