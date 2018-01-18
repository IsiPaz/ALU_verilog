# ALU_verilog

You can use the Icarus Verilog to test the code.<br/>


iverilog *.v -o main<br/>
vvp main <br/>

If you have install the gtkwave, you can use it to see how it work.<br/>
gtkwave wave.vcd<br/>

The instruction to operate, see below.<br/>
000 Add<br/>
001 2's complement<br/>
010 Mutiply<br/>
011 Remind in div<br/>
100 quotient in div<br/>
101 And operate<br/>
110 Or operate <br/>
111 zero <br/>
