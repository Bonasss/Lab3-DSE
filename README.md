# Lab3-DSE
Repository del terzo lab di DSE, contiene tutte le task funzionanti fino alla task 3, manca il multiplier.
Nelle varie task alcuni componenti base come multiplexer, full adders, registri etc. vengono riutilizzati, ma, poiché sono un coglione casinista, a seconda della task possono essere leggermente modificati, questo fa sì che modelsim li veda con nome uguale ma si lamenti per size/nome dei ports. Per questo motivo utilizzare sempre il .vhd della componente nella cartella della specifica task che si sta simulando.

## Task 1, RCA a 4 bit
La task 1 dovrebbe essere completa e funzionante incluso l'overflow.
## Task 2
La task 2 funziona, anche la sottrazione, notare che la sottrazione avviene "primo termine - secondo termine" ed il secondo termine è denotato dai SW7-SW4
## Task 3
Il RCA a 16 bit sembra funzionare, l'ho implementato coi signed per semplificare un po' la scrittura della testbench, ma non so se è stata una buona idea, per la timing analysis bisogna andarsi a cercare qual era il worst case da aggiungere poi nelle casistiche.

Ho notato che chatGPT non è male a fare i report. Mentre cercavo di capire che errore avessi fatto ho provato a dargli il codice e mi ha fatto un super riassuntazzo del CSA. 

CSA:
This code represents a structural implementation of a 16-bit carry-select adder. It is a combination of smaller adders that work in parallel, and a final multiplexer selects one of the adder outputs according to the value of a carry-lookahead output. The adders in this implementation are 4-bit RCA (Ripple-Carry Adder). There are four 4-bit adders that combine to give a 16-bit adder. The inputs of these adders are the 4-bit segments of the two 16-bit inputs. The carry bits of these adders are computed in parallel using a carry-lookahead unit. This unit takes as inputs the carry bits of the four adders and produces two carry-lookahead outputs, one for the 0-carry bit and one for the 1-carry bit. These lookahead outputs are used to select the output of one of the four adders using multiplexors. The selected output is then the final output of the adder.

The architecture of this implementation is defined as follows:

The input ports are a, b, rsn (reset), and clock.
The output ports are c (the sum) and ovrf (overflow).
The adder inputs and outputs are defined using signals reg1, reg2, reg3, logic_a, logic_b, and logic_c.
The adders themselves are defined using a four-by-four array m that stores the outputs of the adders.
The carry bits of the adders are computed using an array of four 4-bit RCA adders, defined using a type adder_input_vector. The outputs of these adders are combined using multiplexors to select the correct output.
The carry lookahead unit is defined using a type four_by_four and takes as input the carry bits of the four adders and produces two carry-lookahead outputs ovf(0) and ovf(1).
Finally, the selected output is the concatenation of the output bits of the four adders, defined using the signal logic_c.