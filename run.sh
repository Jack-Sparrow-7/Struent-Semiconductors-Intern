# Run this script to compile and execute the Verilog code.
iverilog -o out.vvp design.v testbench.v

# Execute the compiled code and log the output to sim.log
vvp -l sim.log out.vvp

# Open the waveform viewer to analyze the results
# gtkwave wave.vcd