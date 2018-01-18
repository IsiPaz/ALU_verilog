# ALU_verilog

You can use the Icarus Verilog to test the code.

`iverilog *.v -o main
`vvp main

If you have install the gtkwave, you can use it to see how it work.
`gtkwave wave.vcd

The instruction to operate, see below.
000 Add
001 2's complement
010 Mutiply
011 Remind in div
100 quotient in div
101 And operate
110 Or operate
111 zero
