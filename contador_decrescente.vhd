--------------------------------------------------------------------------------
-- Contador Decrescente 
--Fabrício Pignatti
--Pedro Azevedo
--Vitor Coimbra
-- Laboratório de Sistemas Digitais - PA3
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador_decrescente is
    generic (
        N_BITS : integer := 8
    );
    port (
        clk      : in  std_logic;
        enable   : in  std_logic;
        load     : in  std_logic;  -- força carregar valor máximo
        value    : out unsigned(N_BITS-1 downto 0)
    );
end entity;

architecture rtl of contador_decrescente is
    signal cnt : unsigned(N_BITS-1 downto 0) := (others => '1');  -- começa no máximo
    constant MAX_VAL : unsigned(N_BITS-1 downto 0) := (others => '1');
begin

    process(clk)
    begin
        if rising_edge(clk) then
            
            if load = '1' then
                -- Força carregar o valor máximo
                cnt <= MAX_VAL;

            elsif enable = '1' then
               
                cnt <= cnt - 1;
                
            end if;

        end if;
    end process;

    value <= cnt;

end architecture;
