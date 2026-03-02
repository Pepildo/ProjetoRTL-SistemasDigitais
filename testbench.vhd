library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity semaforo_tb is
end entity;

architecture tb of semaforo_tb is

    -- Clock de 2 Hz (periodo 0.5 s)
    constant CLK_PERIOD : time := 500 ms;

    signal clk          : std_logic := '0';
    signal reset_n      : std_logic := '0';

    signal DiaNoite     : std_logic := '0';  -- 0 = dia, 1 = noite
    signal Madrugada    : std_logic := '0';  -- 1 = modo madrugada

    signal Botao_Ped_V  : std_logic := '0';
    signal Botao_Ped_H  : std_logic := '0';

    signal leds         : std_logic_vector(9 downto 0);
    signal seg_v        : std_logic_vector(6 downto 0);
    signal seg_h        : std_logic_vector(6 downto 0);

begin


    uut: entity work.semaforo_toplevel
        port map (
            clk         => clk,
            reset_n     => reset_n,
            DiaNoite    => DiaNoite,
            Madrugada   => Madrugada,
            Botao_Ped_V => Botao_Ped_V,
            Botao_Ped_H => Botao_Ped_H,
            leds        => leds,
            seg_v       => seg_v,
            seg_h       => seg_h
        );

  
    -- Clock 
    
    clk_process : process
    begin
        -- clk sempre bem definido: comeca em '0' e alterna entre '0' e '1'
        clk <= '0';
        wait for CLK_PERIOD / 2;
        clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;


    -- Estimulos com varios cenarios
  
    stim_proc : process
    begin
        
        -- Reset global
        
        report "==== Reset sequence ====" severity note;
        reset_n      <= '0';
        DiaNoite     <= '0';
        Madrugada    <= '0';
        Botao_Ped_V  <= '0';
        Botao_Ped_H  <= '0';

        -- espera 2 ciclos de clock antes de liberar o reset
        wait for 2 * CLK_PERIOD;
        reset_n <= '1';

        
        -- Cenario 1: Dia, sem pedestres
        
        report "==== Scenario 1: Dia (DiaNoite=0), sem pedestres ====" severity note;

        DiaNoite     <= '0';  -- dia
        Madrugada    <= '0';  -- modo normal
        Botao_Ped_V  <= '0';
        Botao_Ped_H  <= '0';

        -- tempo suficiente pra ver ciclo vertical + horizontal
        wait for 40 sec;

        
        -- Cenario 2: Dia, pedestre vertical aperta o botao
        
        report "==== Scenario 2: Dia, pedestre V aperta botao ====" severity note;

        -- pulso de 1 s no botao vertical
        Botao_Ped_V <= '1';
        wait for 1 sec;
        Botao_Ped_V <= '0';

        -- observa comportamento depois do pulso
        wait for 30 sec;

        
        -- Cenario 3: Noite, sem pedestres
        
        report "==== Scenario 3: Noite (DiaNoite=1), sem pedestres ====" severity note;

        DiaNoite  <= '1';  -- noite (usa WAIT 16)
        Madrugada <= '0';
        Botao_Ped_V <= '0';
        Botao_Ped_H <= '0';

        wait for 40 sec;

        
        -- Cenario 4: Noite, pedestre horizontal aperta o botao
        
        report "==== Scenario 4: Noite, pedestre H aperta botao ====" severity note;

        Botao_Ped_H <= '1';
        wait for 1 sec;
        Botao_Ped_H <= '0';

        wait for 30 sec;

        
        -- Cenario 5: Modo Madrugada (pisca amarelo)
        
        report "==== Scenario 5: Madrugada (Madrugada=1), pisca amarelo ====" severity note;

        Madrugada <= '1';

        -- enquanto esta em madrugada, aperta ambos os botoes (na pratica nao
        -- deve ter efeito no fluxo do semaforo)
        Botao_Ped_V <= '1';
        Botao_Ped_H <= '1';
        wait for 10 sec;

        Botao_Ped_V <= '0';
        Botao_Ped_H <= '0';
        wait for 10 sec;

        
        -- Cenario 6: Volta para dia depois da madrugada
        
        report "==== Scenario 6: Volta para dia apos madrugada ====" severity note;

        Madrugada <= '0';
        DiaNoite  <= '0';  -- volta para dia

        wait for 40 sec;


        wait;
    end process;

end architecture;
