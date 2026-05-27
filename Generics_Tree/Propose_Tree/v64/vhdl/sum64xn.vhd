
    library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

    entity sum64xn is

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
        a60, a61, a62, a63 : in unsigned(n-1 downto 0);
    sum : out unsigned(n-1 downto 0)
    );
    end sum64xn;

    architecture rtl of sum64xn is
    
    -- nível 1
    signal flsb_1_0, flsb_1_1, flsb_1_2, flsb_1_3 : unsigned(n-1 downto 0);
    signal flsb_1_4, flsb_1_5, flsb_1_6, flsb_1_7 : unsigned(n-1 downto 0);
    signal flsb_1_8, flsb_1_9, flsb_1_10, flsb_1_11 : unsigned(n-1 downto 0);
    signal flsb_1_12, flsb_1_13, flsb_1_14, flsb_1_15 : unsigned(n-1 downto 0);
    signal flsb_1_16, flsb_1_17, flsb_1_18, flsb_1_19 : unsigned(n-1 downto 0);
    signal flsb_1_20, flsb_1_21, flsb_1_22, flsb_1_23 : unsigned(n-1 downto 0);
    signal flsb_1_24, flsb_1_25, flsb_1_26, flsb_1_27 : unsigned(n-1 downto 0);
    signal flsb_1_28, flsb_1_29, flsb_1_30, flsb_1_31 : unsigned(n-1 downto 0);

    -- nível 2
    signal flsb_2_0, flsb_2_1, flsb_2_2, flsb_2_3 : unsigned(n-1 downto 0);
    signal flsb_2_4, flsb_2_5, flsb_2_6, flsb_2_7 : unsigned(n-1 downto 0);
    signal flsb_2_8, flsb_2_9, flsb_2_10, flsb_2_11 : unsigned(n-1 downto 0);
    signal flsb_2_12, flsb_2_13, flsb_2_14, flsb_2_15 : unsigned(n-1 downto 0);

    -- nível 3
    signal flsb_3_0, flsb_3_1, flsb_3_2, flsb_3_3 : unsigned(n-1 downto 0);
    signal flsb_3_4, flsb_3_5, flsb_3_6, flsb_3_7 : unsigned(n-1 downto 0);

    -- nível 4
    signal flsb_4_0, flsb_4_1, flsb_4_2, flsb_4_3 : unsigned(n-1 downto 0);

    -- nível 5
    signal flsb_5_0, flsb_5_1 : unsigned(n-1 downto 0);

begin

    --------------------------------------------------------------------------
    -- Nível 1 (32 somas)
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

    --------------------------------------------------------------------------
    -- Nível 2 (16 somas)
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

    --------------------------------------------------------------------------
    -- Nível 3 (8 somas)
    --------------------------------------------------------------------------
    flsb_3_0 <= flsb_2_0 + flsb_2_1;
    flsb_3_1 <= flsb_2_2 + flsb_2_3;
    flsb_3_2 <= flsb_2_4 + flsb_2_5;
    flsb_3_3 <= flsb_2_6 + flsb_2_7;
    flsb_3_4 <= flsb_2_8 + flsb_2_9;
    flsb_3_5 <= flsb_2_10 + flsb_2_11;
    flsb_3_6 <= flsb_2_12 + flsb_2_13;
    flsb_3_7 <= flsb_2_14 + flsb_2_15;

    --------------------------------------------------------------------------
    -- Nível 4 (4 somas)
    --------------------------------------------------------------------------
    flsb_4_0 <= flsb_3_0 + flsb_3_1;
    flsb_4_1 <= flsb_3_2 + flsb_3_3;
    flsb_4_2 <= flsb_3_4 + flsb_3_5;
    flsb_4_3 <= flsb_3_6 + flsb_3_7;

    --------------------------------------------------------------------------
    -- Nível 5 (2 somas)
    --------------------------------------------------------------------------
    flsb_5_0 <= flsb_4_0 + flsb_4_1;
    flsb_5_1 <= flsb_4_2 + flsb_4_3;

    
        --------------------------------------------------------------------------
        -- Resultado final
        --------------------------------------------------------------------------
        sum <= flsb_5_0 + flsb_5_1;

        end architecture;