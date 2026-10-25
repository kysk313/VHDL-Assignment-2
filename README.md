# VHDL Assignment-2

Digital Logic Circuit Design · 김우준 (2023092479)

강의자료(VHDL_1)의 VHDL 작성 방식과 Logisim VHDL Entity 구성 방식으로 구현한 5개 문제의 제출물입니다.

## 제출 파일

| 문제 | 내용 | VHDL 소스 | Logisim 프로젝트 |
|---|---|---|---|
| 1 | `out1 <= a and b and c and d;` / `out2 <= a or b or c or d;` | [logic_test.vhd](P1_logic_test/logic_test.vhd) | [logic_test.circ](P1_logic_test/logic_test.circ) |
| 2 | 8-to-1 Multiplexer | [mux8_1.vhd](P2_mux8_1/mux8_1.vhd) | [mux8_1.circ](P2_mux8_1/mux8_1.circ) |
| 3 | 7-segment로 a, b, c, d, f, g 표시 | [led_letter.vhd](P3_led_letter/led_letter.vhd) | [led_letter.circ](P3_led_letter/led_letter.circ) |
| 4 | 25인 투표기 (13표 이상이면 1) | [vote25.vhd](P4_vote25/vote25.vhd) | [vote25.circ](P4_vote25/vote25.circ) |
| 5 | 13-bit 입력의 1 개수를 7-segment에 표시 (0-9, A-F, enable) | [count_led.vhd](P5_count_led/count_led.vhd) | [count_led.circ](P5_count_led/count_led.circ) |

- 보고서: [VHDL_Assignment_2_Report.pdf](VHDL_Assignment_2_Report.pdf)
- 검증용 테스트벤치(GHDL): [testbench/](testbench)

## Logisim에서 실행하는 방법

1. `.circ` 파일을 Logisim-evolution에서 엽니다.
2. **Simulate → VHDL Simulation Enabled**를 선택합니다 (QuestaSim/ModelSim 필요).
3. **Ctrl + R** (Reset Simulation)을 누릅니다.
4. Poke Tool(손 모양)로 입력 핀이나 DIP 스위치를 클릭해 입력을 바꿉니다.
