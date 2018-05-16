setactivelib -work
#Compiling UUT module design files

comp -include "$dsn\src\TestBench\MAC_TB.v"
asim +access +r MAC_tb

wave
wave -noreg SYS_CLK
wave -noreg SCLR
wave -noreg LOAD
wave -noreg A
wave -noreg B
wave -noreg MAC_OUT

run

#End simulation macro
