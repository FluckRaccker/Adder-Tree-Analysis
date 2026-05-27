
    library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

    entity sum16xn is

    generic(n : integer := 16);
    port (
            a0, a1, a2, a3,
        a4, a5, a6, a7,
        a8, a9, a10, a11,
        a12, a13, a14, a15 : in unsigned(n-1 downto 0);
    sum : out unsigned(n-1 downto 0)
    );
    end sum16xn;

    architecture rtl of sum16xn is
    
    -- nível 1
    signal flsb_1_0, flsb_1_1, flsb_1_2, flsb_1_3 : unsigned(n-1 downto 0);
    signal flsb_1_4, flsb_1_5, flsb_1_6, flsb_1_7 : unsigned(n-1 downto 0);

    -- nível 2
    signal flsb_2_0, flsb_2_1, flsb_2_2, flsb_2_3 : unsigned(n-1 downto 0);

    -- nível 3
    signal flsb_3_0, flsb_3_1 : unsigned(n-1 downto 0);

begin

    --------------------------------------------------------------------------
    -- Nível 1 (8 somas)
    --------------------------------------------------------------------------
    flsb_1_0 <= a0 + a1;
    flsb_1_1 <= a2 + a3;
    flsb_1_2 <= a4 + a5;
    flsb_1_3 <= a6 + a7;
    flsb_1_4 <= a8 + a9;
    flsb_1_5 <= a10 + a11;
    flsb_1_6 <= a12 + a13;
    flsb_1_7 <= a14 + a15;

    --------------------------------------------------------------------------
    -- Nível 2 (4 somas)
    --------------------------------------------------------------------------
    flsb_2_0 <= flsb_1_0 + flsb_1_1;
    flsb_2_1 <= flsb_1_2 + flsb_1_3;
    flsb_2_2 <= flsb_1_4 + flsb_1_5;
    flsb_2_3 <= flsb_1_6 + flsb_1_7;

    --------------------------------------------------------------------------
    -- Nível 3 (2 somas)
    --------------------------------------------------------------------------
    flsb_3_0 <= flsb_2_0 + flsb_2_1;
    flsb_3_1 <= flsb_2_2 + flsb_2_3;

    
        --------------------------------------------------------------------------
        -- Resultado final
        --------------------------------------------------------------------------
        sum <= flsb_3_0 + flsb_3_1;

        end architecture;