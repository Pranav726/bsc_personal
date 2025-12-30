##Bluespec Compiler Installation and Setup
--------------------------------------------

This repository captures my learning and experimental work using Bluespec SystemVerilog (BSV), a high-level hardware description language widely used for designing and verifying complex processors and digital systems. Bluespec enables modular, rule-based hardware design, making it suitable for building scalable and formally analyzable architectures. The repository includes example designs, generated build artifacts, and toolchain setup files that demonstrate the end-to-end flow from BSV source code to simulation and synthesis-ready outputs.

A key motivation for this work is the study of real-world processor implementations developed using Bluespec, most notably the Shakti Processor, an open-source RISC-V processor family developed at IIT Madras. Shakti leverages Bluespec to model different processor classes ranging from microcontrollers to high-performance cores, highlighting the practical relevance of BSV in academic research and production-grade processor design. In addition to Shakti, Bluespec has been used in the development of other processor and accelerator designs, including RISC-V cores, domain-specific accelerators, and research-oriented SoC prototypes.

Overall, this repository serves as a learning-oriented reference for understanding how Bluespec is used in processor design and hardware modeling. It aims to bridge fundamental digital design concepts with real processor architectures, providing insight into how high-level hardware descriptions can be translated into efficient, verifiable implementations suitable for FPGA prototyping and further system-level exploration.

##step-1
-------------------
clone the bsc repository from "https://github.com/Pranav726/bsc.git" and verify the cloned repo in your pc.
using the cmd- "sudo git clone https://github.com/Pranav726/bsc.git"
now clone the submodules from the repo
using the cmd in the "github_submodules" file.

##step-2
--------------------
install all dependencies using the cmd in the "install_bsc" file.
Dependencies - gperf,
               autoconf,
               flex,
               bison,
               zlib1g-dev.
still some more dependencies are there,it depends on the spec and os of the pc.
now make the source file using cmd in the "install_bsc" file.
change the permission for the required files.
after making the source file,test the bsv compiler using "bsc -help"

##step-3
-------------------
test the compiler by writing a sample bsv code.you can find a sample "counter.bsv" in the repo.
you can test the bsv by following the commands in "test_bsc" file in the repo.

##step-4
-------------------
The counter successfully increments from 0 to 255 for each iteration.

Using the command specified in the test_bsc script, the BSV source code is translated into Verilog.

The generated Verilog output is stored as mkCounter.v.

The presence of both outputs verifies the successful installation and operation of the Bluespec compiler.

## Acknowledgements
----------------------
Thanks to the Bluespec and open-source hardware community for providing
documentation, tools, and resources that made this setup and learning
process possible.
