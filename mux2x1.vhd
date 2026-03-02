--------------------------------------------------------------------------------
-- Mux 2x1 
--Fabrício Pignatti
--Pedro Azevedo
--Vitor Coimbra
-- Laboratório de Sistemas Digitais - PA3
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2x1 is
    port (
        a   : in  std_logic;
        b   : in  std_logic;
        sel : in  std_logic;
        y   : out std_logic
    );
end entity;

architecture rtl of mux_2x1 is
begin
    process(a, b, sel)
    begin
        case sel is
            when '0' => y <= a;
            when '1' => y <= b;
            when others => y <= '0';
        end case;
    end process;
end architecture;
