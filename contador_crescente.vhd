--------------------------------------------------------------------------------
-- Contador Crescente 
--Fabrício Pignatti
--Pedro Azevedo
--Vitor Coimbra
-- Laboratório de Sistemas Digitais - PA3
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador_crescente is
    generic (
        N_BITS : integer := 8  -- tamanho do contador
    );
    port (
        clk      : in  std_logic;
        reset_n  : in  std_logic;  -- reset assíncrono ativo baixo
        enable   : in  std_logic;  -- habilita incremento
        load_max : in  std_logic;  -- força contador ao valor máximo
        value    : out unsigned(N_BITS-1 downto 0)
    );
end entity;

architecture rtl of contador_crescente is
    signal cnt : unsigned(N_BITS-1 downto 0) := (others => '0');
begin

    process(clk, reset_n)
    begin
        if reset_n = '0' then
            cnt <= (others => '0');

        elsif rising_edge(clk) then

            if load_max = '1' then
                cnt <= (others => '1');              -- carrega valor máximo

            elsif enable = '1' then
                cnt <= cnt + 1;                      -- contador crescente

            end if;

        end if;
    end process;

    value <= cnt;

end architecture;
