library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

    entity sum16xn is
        generic(
            n : integer := 32
        );
        port (
                    a0, a1, a2, a3,
        a4, a5, a6, a7,
        a8, a9, a10, a11,
        a12, a13, a14, a15 : in unsigned(n-1 downto 0);
            sum : out unsigned(n-1 downto 0)
        );
    end sum16xn;

    architecture rtl of sum16xn is
    
    -- nível 1: deslocamento diagonal
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