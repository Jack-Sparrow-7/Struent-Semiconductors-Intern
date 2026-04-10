// Run this script to compile and execute the Verilog code.
iverilog -o out.vvp *.v

// Execute the compiled code and log the output to sim.log
vvp -l sim.log *.vvp