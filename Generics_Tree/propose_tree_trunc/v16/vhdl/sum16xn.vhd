
    library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

    entity sum16xn is
        generic(
            n : integer := 32;
            h : integer := 4
        );
        port (
            a0  : in  unsigned(n-1 downto 0);
            a1  : in  unsigned(n-1 downto 0);
            sum : out unsigned(2*n-1 downto 0)
        );
    end sum16xn;

    architecture rtl of sum16xn is

        constant M : integer := 16;
        constant W : integer := 2*n;

        type input_array_t is array (0 to M-1) of unsigned(W-1 downto 0);

        signal pp      : input_array_t;
        signal a_shift : input_array_t;

        component tree_msb is
            generic(n : integer := 32);
            port (
                a0 , a1 , a2 , a3 ,
            a4 , a5 , a6 , a7 ,
            a8 , a9 , a10, a11,
            a12, a13, a14, a15 : in unsigned(n-1 downto 0);
                f3_1, f3_0 : out unsigned(n-1 downto 0);
                sum : out unsigned(n-1 downto 0)
            );
        end component;

        component tree_lsb is
            generic(n : integer := 32);
            port (
                a0 , a1 , a2 , a3 ,
            a4 , a5 , a6 , a7 ,
            a8 , a9 , a10, a11,
            a12, a13, a14, a15 : in unsigned(n-1 downto 0);
                sum : out unsigned(n+3 downto 0)
            );
        end component;

        signal f3_0_msb, f3_1_msb : unsigned(W/2+h-1 downto 0);
        signal sum_tree_msb : unsigned(W/2+h-1 downto 0);

        signal sum_tree_lsb : unsigned(W/2-1 downto 0);

        signal csum : unsigned(h downto 0);

        signal sum_msb : unsigned(W/2-1 downto 0);

        signal sum_c0 : unsigned(W/2-1 downto 0);
        signal sum_c1 : unsigned(W/2 downto 0);

    begin

        --------------------------------------------------------------------------
        -- Produtos parciais por AND bit a bit, estendidos para 2n bits
        --
        -- pp(i)(j) = a0(j) AND a1(i), para j = 0 até n-1
        -- pp(i)(j) = 0,                para j = n até 2n-1
        --
        -- Para M = n:
        --   gera o produto completo n x n -> 2n.
        --
        -- Se n > M:
        --   usa apenas a1(0) até a1(M-1).
        --------------------------------------------------------------------------
        gen_pp_i : for i in 0 to M-1 generate

            gen_pp_low : for j in 0 to n-1 generate
                pp(i)(j) <= a0(j) and a1(i);
            end generate;

            gen_pp_high : for j in n to W-1 generate
                pp(i)(j) <= '0';
            end generate;

        end generate;

        --------------------------------------------------------------------------
        -- Deslocamento diagonal com largura 2n
        --------------------------------------------------------------------------
        gen_shift : for i in 0 to M-1 generate
            a_shift(i) <= shift_left(pp(i), i);
        end generate;

        --------------------------------------------------------------------------
        -- Árvore MSB original
        --------------------------------------------------------------------------
        u_tree_msb : tree_msb
            generic map(
                n => W/2 + h
            )
            port map(
                a0  => a_shift(0)(W-1 downto W/2-h),
            a1  => a_shift(1)(W-1 downto W/2-h),
            a2  => a_shift(2)(W-1 downto W/2-h),
            a3  => a_shift(3)(W-1 downto W/2-h),
            a4  => a_shift(4)(W-1 downto W/2-h),
            a5  => a_shift(5)(W-1 downto W/2-h),
            a6  => a_shift(6)(W-1 downto W/2-h),
            a7  => a_shift(7)(W-1 downto W/2-h),
            a8  => a_shift(8)(W-1 downto W/2-h),
            a9  => a_shift(9)(W-1 downto W/2-h),
            a10 => a_shift(10)(W-1 downto W/2-h),
            a11 => a_shift(11)(W-1 downto W/2-h),
            a12 => a_shift(12)(W-1 downto W/2-h),
            a13 => a_shift(13)(W-1 downto W/2-h),
            a14 => a_shift(14)(W-1 downto W/2-h),
            a15 => a_shift(15)(W-1 downto W/2-h),
                f3_0 => f3_0_msb,
                f3_1 => f3_1_msb,
                sum => sum_tree_msb
            );

        --------------------------------------------------------------------------
        -- Árvore LSB original
        --------------------------------------------------------------------------
        u_tree_lsb : tree_lsb
            generic map(
                n => W/2 - h
            )
            port map(
                a0  => a_shift(0)(W/2-h-1 downto 0),
            a1  => a_shift(1)(W/2-h-1 downto 0),
            a2  => a_shift(2)(W/2-h-1 downto 0),
            a3  => a_shift(3)(W/2-h-1 downto 0),
            a4  => a_shift(4)(W/2-h-1 downto 0),
            a5  => a_shift(5)(W/2-h-1 downto 0),
            a6  => a_shift(6)(W/2-h-1 downto 0),
            a7  => a_shift(7)(W/2-h-1 downto 0),
            a8  => a_shift(8)(W/2-h-1 downto 0),
            a9  => a_shift(9)(W/2-h-1 downto 0),
            a10 => a_shift(10)(W/2-h-1 downto 0),
            a11 => a_shift(11)(W/2-h-1 downto 0),
            a12 => a_shift(12)(W/2-h-1 downto 0),
            a13 => a_shift(13)(W/2-h-1 downto 0),
            a14 => a_shift(14)(W/2-h-1 downto 0),
            a15 => a_shift(15)(W/2-h-1 downto 0),
                sum => sum_tree_lsb
            );

        --------------------------------------------------------------------------
        -- Carry entre LSB e MSB
        --------------------------------------------------------------------------
        csum <= ('0' & f3_0_msb(h-1 downto 0)) +
                ('0' & f3_1_msb(h-1 downto 0)) +
                ('0' & sum_tree_lsb(W/2-1 downto W/2-h));

        --------------------------------------------------------------------------
        -- CSLA
        --------------------------------------------------------------------------
        sum_c0 <= f3_0_msb(W/2+h-1 downto h) +
                f3_1_msb(W/2+h-1 downto h);

        sum_c1 <= ('0' & f3_0_msb(W/2+h-1 downto h)) +
                ('0' & f3_1_msb(W/2+h-1 downto h)) +
                to_unsigned(1, W/2+1);

        --------------------------------------------------------------------------
        -- MUX
        --------------------------------------------------------------------------
        sum_msb <= sum_c0 when csum(h) = '0' else sum_c1(W/2-1 downto 0);

        --------------------------------------------------------------------------
        -- Soma final retangular/completa
        --------------------------------------------------------------------------
        sum <= sum_msb &
            csum(h-1 downto 0) &
            sum_tree_lsb(W/2-h-1 downto 0);

    end rtl;
    