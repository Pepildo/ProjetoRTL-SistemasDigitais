# Sistema de Semáforo Automatizado em VHDL

Projeto desenvolvido na disciplina de **Laboratório de Sistemas Digitais**, com o objetivo de implementar um sistema de semáforo automatizado utilizando VHDL.

O circuito controla os sinais de trânsito a partir dos ciclos de clock, utilizando uma máquina de estados para determinar as mudanças entre as diferentes etapas de funcionamento. O projeto também contempla a sinalização para pedestres e um modo de operação durante a madrugada.

## Funcionalidades

- Controle automatizado dos sinais de trânsito a partir do clock.
- Máquina de estados para organizar as etapas de funcionamento do semáforo.
- Controle dos sinais para veículos e pedestres.
- Modo madrugada, com sinal amarelo dos veículos piscando e sinais de pedestres desligados.
- Contadores crescentes e decrescentes para controle dos ciclos.
- Comparação de valores para identificar condições de mudança de estado.
- Decodificação de valores para exibição em display de sete segmentos.
- Testbench para simulação do circuito.

## Tecnologias e ferramentas

- **VHDL:** linguagem utilizada para descrição do circuito digital.
- **Lógica digital:** implementação de contadores, comparadores, multiplexadores e máquina de estados.
- **Simulação digital:** utilização de testbench para verificar o comportamento do projeto.

## Organização dos arquivos

| Arquivo | Descrição |
|---|---|
| `design.vhd` | Implementação principal do sistema de semáforo e sua máquina de estados. |
| `contador_crescente.vhd` | Módulo de contador crescente. |
| `contador_decrescente.vhd` | Módulo de contador decrescente. |
| `comparator_eq.vhd` | Comparador de igualdade entre dois valores. |
| `mux2x1.vhd` | Multiplexador de duas entradas. |
| `seven_seg_decoder_en.vhd` | Decodificador para display de sete segmentos. |
| `testbench.vhd` | Ambiente de teste para simulação do circuito. |

## Conceitos aplicados

Durante o desenvolvimento, foram trabalhados conceitos fundamentais de sistemas digitais, como:

- Descrição e modelagem de circuitos digitais com VHDL.
- Máquinas de estados finitos (FSM).
- Sinais de clock e sincronização.
- Contadores e comparadores.
- Multiplexação de sinais.
- Controle de entradas e saídas digitais.
- Simulação e validação de circuitos utilizando testbench.

## Objetivo acadêmico

O projeto teve como objetivo aplicar, na prática, os conceitos estudados em Laboratório de Sistemas Digitais, desenvolvendo um circuito capaz de controlar automaticamente um sistema de sinalização de trânsito.

**Disciplina:** Laboratório de Sistemas Digitais  
**Instituição:** Universidade Federal de Minas Gerais (UFMG)
