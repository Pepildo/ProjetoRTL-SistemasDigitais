                leds_v(4) := '0';
                leds_v(5) := '0';
                -- pedestres
                leds_v(6) := '1';
                leds_v(7) := '0';
                leds_v(8) := '0';
                leds_v(9) := '1';
​
                enableC      <= '1';
                dec_h_enable <= '1';
​
                if compC_eq = '1' then  -- C == 0
                    state_next <= S0_ALL_RED_0;
                end if;
​
            
            -- 12 - MADRUGADA (pisca amarelo, sinal de pededestres desligado)
          
            
            when S12_MADRUGADA =>
                ESTADO <= "01100";  -- 12
​
                -- carros: amarelo piscando
                leds_v(0) := '0';
                leds_v(1) := blink;
                leds_v(2) := '0';
                leds_v(3) := '0';
                leds_v(4) := blink;
                leds_v(5) := '0';
​
                -- pedestres: desligados
                leds_v(6) := '0';
                leds_v(7) := '0';
                leds_v(8) := '0';
                leds_v(9) := '0';
​
            
                if Madrugada = '1' then
                    state_next <= S12_MADRUGADA;
                else
                    state_next <= S0_ALL_RED_0;
                end if;
​
        end case;
​
        leds <= leds_v;
    end process;
​
end architecture;
​