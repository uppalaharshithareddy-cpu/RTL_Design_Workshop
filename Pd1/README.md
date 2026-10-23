PD 1 – Design Preparation and Synthesis

Overview

Physical Design is an important stage in VLSI design. It converts a synthesized digital circuit into a physical layout that can eventually be manufactured as an integrated circuit.

In this stage, we prepare the design, configure the required files, and perform synthesis using the OpenLANE flow.

Objective

- Understand the basic ASIC design flow.
- Learn how to prepare a design for physical implementation.
- Understand RTL synthesis.
- Generate a gate-level netlist.
- Examine the synthesis reports.

Tools Used

- OpenLANE
- Yosys
- SKY130 PDK
- OpenSTA
- VS Code or the provided Linux environment

1. Design Preparation

Design preparation involves selecting the design, checking its configuration, and preparing the required RTL and constraint files.

The configuration file contains information about the design and the parameters required to execute the physical design flow.

2. RTL Synthesis

Synthesis converts RTL Verilog code into a gate-level netlist using the available standard-cell library.

During synthesis, the tool performs logic optimization and maps the design to standard cells.

Main Steps

1. Read the RTL design.
2. Check the design hierarchy.
3. Perform logic optimization.
4. Map the design to standard cells.
5. Generate the synthesized netlist.
6. Examine the synthesis reports.

3. Synthesis Output

The synthesis stage generates files and reports that help us understand the implemented logic.

Important outputs include:

- Synthesized Verilog netlist
- Cell usage report
- Area information
- Timing information
- Synthesis logs

The exact output locations depend on the OpenLANE version and the selected design.

4. Observations

- RTL describes the required digital circuit.
- Synthesis converts the RTL into a gate-level representation.
- Logic optimization helps remove unnecessary logic.
- Synthesis reports provide information about area and timing.

Conclusion

In this stage, we learn how to prepare a design and understand the synthesis process. The generated netlist becomes an input for the subsequent physical design stages.

Screenshots

Add screenshots of:

1. Design preparation.
2. Synthesis execution.
3. Synthesized netlist.
4. Synthesis reports.
