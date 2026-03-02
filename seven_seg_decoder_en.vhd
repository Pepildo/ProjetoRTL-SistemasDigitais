--------------------------------------------------------------------------------
-- Decodificador para o display de 7 seguimentos 
--Fabrício Pignatti
--Pedro Azevedo
--Vitor Coimbra
-- Laboratório de Sistemas Digitais - PA3
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity seven_seg_decoder_en is
    port (
        bin    : in  unsigned(3 downto 0);         -- valor de 0 a 9
        enable : in  std_logic;                    -- 1 = mostra, 0 = apaga
        seg    : out std_logic_vector(6 downto 0)  -- a b c d e f g (ativo LOW)
    );
end entity;

architecture rtl of seven_seg_decoder_en is
    signal seg_raw : std_logic_vector(6 downto 0);
begin

    ----------------------------------------------------------------------
    -- Decodificação padrão de 7 segmentos (ATIVO LOW)
    ----------------------------------------------------------------------
    process(bin)
    begin
        case bin is
            when "0000" => seg_raw <= "0000001"; -- 0
            when "0001" => seg_raw <= "1001111"; -- 1
            when "0010" => seg_raw <= "0010010"; -- 2
            when "0011" => seg_raw <= "0000110"; -- 3
            when "0100" => seg_raw <= "1001100"; -- 4
            when "0101" => seg_raw <= "0100100"; -- 5
            when "0110" => seg_raw <= "0100000"; -- 6
            when "0111" => seg_raw <= "0001111"; -- 7
            when "1000" => seg_raw <= "0000000"; -- 8
            when "1001" => seg_raw <= "0000100"; -- 9
            when others => seg_raw <= "1111111"; -- apagado
        end case;
    end process;

    ----------------------------------------------------------------------
    -- Controle pelo enable
    -- enable = 1  mostra o número
    -- enable = 0  apaga tudo (1111111)
    ----------------------------------------------------------------------
    seg <= seg_raw when enable = '1' else
           (others => '1');

end architecture;
