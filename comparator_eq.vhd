--------------------------------------------------------------------------------
-- Comparador de igualdade 
--Fabrício Pignatti
--Pedro Azevedo
--Vitor Coimbra
-- Laboratório de Sistemas Digitais - PA3
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_eq is
    generic (
        N_BITS : integer := 8
    );
    port (
        a   : in  std_logic_vector(N_BITS-1 downto 0);
        b   : in  std_logic_vector(N_BITS-1 downto 0);
        eq  : out std_logic     -- '1' se a = b
    );
end entity;

architecture rtl of comparator_eq is
begin
    eq <= '1' when a = b else '0';
end architecture;
