# hey guys

# Writing and testing verilog code
To run the code, I use the following commands:
```
iverilog code.v test_nand.v && ./a.out && gtkwave waveform_nand.vcd
```

(replace nand with whichever module you want to run)

I'm not sure what y'alls environments look like, but iverilog compiles the verilog code with the testbenches, ./a.out runs the test programs, and gtkwave shows the generated waveforms


# Writeup
This project is written in LaTeX. [Overleaf](https://www.overleaf.com/) is a pretty good online editor, or you can install an editor properly; either works. If you don't know how to do something in latex, look at what's already in the document, or look it up. Backslashes start commands, which can receive arguments in curly braces. Double backslash means a newline.

Please clone this repo, make a branch for your changes, and push often. Thanks.


