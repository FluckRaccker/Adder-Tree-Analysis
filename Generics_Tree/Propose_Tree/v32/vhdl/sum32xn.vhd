
    library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

    entity sum32xn is

    generic(n : integer := 16);
    port (
            a0, a1, a2, a3,
        a4, a5, a6, a7,
        a8, a9, a10, a11,
        a12, a13, a14, a15,
        a16, a17, a18, a19,
        a20, a21, a22, a23,
        a24, a25, a26, a27,
        a28, a29, a30, a31 : in unsigned(n-1 downto 0);
    sum : out unsigned(n-1 downto 0)
    );
    end sum32xn;

    architecture rtl of sum32xn is
    
    -- nível 1
    signal flsb_1_0, flsb_1_1, flsb_1_2, flsb_1_3 : unsigned(n-1 downto 0);
    signal flsb_1_4, flsb_1_5, flsb_1_6, flsb_1_7 : unsigned(n-1 downto 0);
    signal flsb_1_8, flsb_1_9, flsb_1_10, flsb_1_11 : unsigned(n-1 downto 0);
    signal flsb_1_12, flsb_1_13, flsb_1_14, flsb_1_15 : unsigned(n-1 downto 0);

    -- nível 2
    signal flsb_2_0, flsb_2_1, flsb_2_2, flsb_2_3 : unsigned(n-1 downto 0);
    signal flsb_2_4, flsb_2_5, flsb_2_6, flsb_2_7 : unsigned(n-1 downto 0);

    -- nível 3
    signal flsb_3_0, flsb_3_1, flsb_3_2, flsb_3_3 : unsigned(n-1 downto 0);

    -- nível 4
    signal flsb_4_0, flsb_4_1 : unsigned(n-1 downto 0);

begin

    --------------------------------------------------------------------------
    -- Nível 1 (16 somas)
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

    --------------------------------------------------------------------------
    -- Nível 2 (8 somas)
    --------------------------------------------------------------------------
    flsb_2_0 <= flsb_1_0 + flsb_1_1;
    flsb_2_1 <= flsb_1_2 + flsb_1_3;
    flsb_2_2 <= flsb_1_4 + flsb_1_5;
    flsb_2_3 <= flsb_1_6 + flsb_1_7;
    flsb_2_4 <= flsb_1_8 + flsb_1_9;
    flsb_2_5 <= flsb_1_10 + flsb_1_11;
    flsb_2_6 <= flsb_1_12 + flsb_1_13;
    flsb_2_7 <= flsb_1_14 + flsb_1_15;

    --------------------------------------------------------------------------
    -- Nível 3 (4 somas)
    --------------------------------------------------------------------------
    flsb_3_0 <= flsb_2_0 + flsb_2_1;
    flsb_3_1 <= flsb_2_2 + flsb_2_3;
    flsb_3_2 <= flsb_2_4 + flsb_2_5;
    flsb_3_3 <= flsb_2_6 + flsb_2_7;

    --------------------------------------------------------------------------
    -- Nível 4 (2 somas)
    --------------------------------------------------------------------------
    flsb_4_0 <= flsb_3_0 + flsb_3_1;
    flsb_4_1 <= flsb_3_2 + flsb_3_3;

    
        --------------------------------------------------------------------------
        -- Resultado final
        --------------------------------------------------------------------------
        sum <= flsb_4_0 + flsb_4_1;

        end architecture;