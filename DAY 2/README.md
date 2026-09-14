# DAY 2

## RTL Design Workshop

This folder contains my Day 2 workshop documentation and experiment work.

## Timing Libraries

## Hierarchical vs Flat Synthesis

## Efficient Flop Coding Styles

## Simulation and Synthesis

DAY 2 – Timing Libraries, Hierarchical vs Flat Synthesis and Efficient Flip-Flop Coding Styles

1. Overview

Day 2 of the RTL Design Workshop focuses on understanding standard-cell timing libraries, hierarchical and flat synthesis, sub-module level synthesis, and efficient flip-flop coding styles.

The main topics covered are:

- Understanding the SKY130 standard-cell library
- Understanding the ".lib" timing library
- PVT variations
- Contents of the Liberty file
- Different flavours of standard cells
- Hierarchical synthesis
- Flat synthesis
- Sub-module level synthesis
- Understanding flip-flops
- Asynchronous reset flip-flops
- Synchronous reset flip-flops
- Simulation using Icarus Verilog and GTKWave
- Synthesis using Yosys
- Basic synthesis optimization techniques

---

2. SKY130 Standard Cell Library

2.1 What is SKY130?

SKY130 is an open-source 130 nm semiconductor technology platform associated with the SkyWater process.

In RTL synthesis, the RTL code is converted into a gate-level representation using standard cells from a technology library.

The standard-cell library provides different types of cells such as:

- AND gates
- OR gates
- NAND gates
- NOR gates
- Inverters
- Buffers
- Multiplexers
- Flip-flops
- Other logic cells

For this workshop, the SKY130 high-density standard-cell library is used.

---

2.2 Standard Cell Library

A standard-cell library contains pre-characterized cells that can be used to implement digital circuits.

Each cell has information related to:

- Functionality
- Area
- Power
- Timing
- Input capacitance
- Output transition
- Leakage power
- Pin information

The synthesis tool uses this information to select appropriate cells while converting RTL into a gate-level netlist.

---

3. Timing Library

3.1 SKY130 ".lib" File

The timing library used in the workshop is:

"sky130_fd_sc_hd__tt_025C_1v80.lib"

The name of the library provides information about the technology and operating conditions.

Term| Meaning
sky130| 130 nm technology
fd| SkyWater foundry
sc| Standard Cell
hd| High Density
tt| Typical Process
025C| 25°C temperature
1v80| 1.80 V supply voltage

The "tt_025C_1v80" part represents a particular PVT operating corner.

---

3.2 PVT

PVT stands for:

- P – Process
- V – Voltage
- T – Temperature

Process

Process variation occurs because semiconductor manufacturing cannot produce every chip exactly identically.

Voltage

The behaviour of a circuit changes when the supply voltage changes.

Temperature

The electrical characteristics of semiconductor devices change with temperature.

Therefore, standard-cell libraries are characterized for different PVT conditions so that the circuit behaviour can be analysed under different operating conditions.

---

4. Opening the Timing Library

The library file can be opened using:

gvim ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

Useful commands while inspecting the library:

:syn off
:se nu

- ":syn off" disables syntax highlighting.
- ":se nu" displays line numbers.

To search for a particular cell:

/cell

The ".lib" file contains information about many standard cells and their electrical and timing characteristics.

"SKY130 Timing Library" (./images/lib_file.png)

---

5. Contents of the ".lib" File

The Liberty file contains important information required for synthesis and timing analysis.

Important information includes:

5.1 Library Information

General information about the library, such as:

- Technology
- Units
- Operating conditions
- Delay model

5.2 Cell Information

Each standard cell has its own section in the library.

The cell section contains information such as:

- Cell name
- Cell area
- Leakage power
- Cell functionality
- Pin information
- Timing information

5.3 Pin Information

Each input and output pin can have information such as:

- Direction
- Capacitance
- Function
- Timing characteristics
- Power information

5.4 Area

The area value represents the physical size associated with a standard cell.

5.5 Power

The library contains information related to:

- Internal power
- Leakage power

5.6 Timing

Timing information describes how the cell behaves when signals propagate through it.

It can include:

- Cell delay
- Rise transition
- Fall transition
- Setup time
- Hold time

5.7 Capacitance

Input capacitance indicates the load presented by a cell input.

Higher capacitance can affect the delay and drive requirements of the circuit.

---

6. Different Flavours of Standard Cells

The library contains different versions or flavours of cells having the same basic functionality.

For example, different versions of an AND gate can have different drive strengths and physical characteristics.

A higher-drive cell can provide better drive capability but may require more area and power.

Therefore, synthesis involves selecting suitable cells according to the requirements of the design.

"Standard Cell Comparison" (./images/cell_comparison.png)

---

7. Hierarchical and Flat Synthesis

7.1 Hierarchical Synthesis

In hierarchical synthesis, the relationship between different modules is maintained.

Consider a design containing:

- "sub_module1"
- "sub_module2"
- "multiple_modules"

Example:

module sub_module2 (
    input a,
    input b,
    output y
);
    assign y = a | b;
endmodule

module sub_module1 (
    input a,
    input b,
    output y
);
    assign y = a & b;
endmodule

module multiple_modules (
    input a,
    input b,
    input c,
    output y
);

    wire net1;

    sub_module1 u1 (
        .a(a),
        .b(b),
        .y(net1)
    );

    sub_module2 u2 (
        .a(net1),
        .b(c),
        .y(y)
    );

endmodule

Here, the top module contains two sub-modules.

---

8. Hierarchical Synthesis Using Yosys

First, open Yosys:

yosys

Read the timing library:

read_liberty -lib ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

Read the Verilog design:

read_verilog multiple_modules.v

Perform synthesis:

synth -top multiple_modules

Map the design using the standard-cell library:

abc -liberty ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

Display the synthesized design:

show multiple_modules

Generate the netlist:

write_verilog -noattr multiple_modules_netlist.v

"Hierarchical Synthesis" (./images/hierarchical.png)

---

9. Flat Synthesis

Flat synthesis removes the hierarchy between the modules and represents the complete design as one flattened module.

The following Yosys command can be used:

flatten

After flattening, the hierarchy between the sub-modules is no longer preserved.

The design can then be viewed using:

show multiple_modules

The flattened netlist can be written using:

write_verilog -noattr multiple_modules_flat.v

"Flat Synthesis" (./images/flat.png)

---

10. Hierarchical vs Flat Synthesis

Hierarchical Synthesis| Flat Synthesis
Module hierarchy is preserved| Module hierarchy is removed
Sub-modules remain visible| Logic is combined into a flat representation
Useful for modular designs| Useful when a complete flat representation is required
Easier to identify sub-modules| Easier to view the complete gate-level structure

---

11. Sub-Module Level Synthesis

Sub-module synthesis means synthesizing an individual module instead of synthesizing the complete top-level design.

This is useful in large designs.

For example, if the design contains many instances of the same sub-module, that sub-module can be synthesized separately and then reused.

It is also useful when the complete design is very large and difficult to synthesize at once.

The top module can be changed in the synthesis command:

synth -top sub_module1

This performs synthesis with "sub_module1" as the top module.

"Sub Module Synthesis" (./images/submodule.png)

---

12. Why Do We Use Flip-Flops?

Combinational circuits can experience glitches because different logic paths can have different propagation delays.

Flip-flops are storage elements that store one bit of information.

A flip-flop changes its stored value according to its clock and control conditions.

Common types include:

- D Flip-Flop
- JK Flip-Flop
- SR Flip-Flop
- T Flip-Flop

In this workshop, D flip-flops with synchronous and asynchronous reset are studied.

---

13. D Flip-Flop

A D flip-flop stores the value of the input "D" at the active clock edge.

Basic Verilog example:

module dff (
    input clk,
    input d,
    output reg q
);

always @(posedge clk)
begin
    q <= d;
end

endmodule

The output "q" changes according to the value of "d" at the rising edge of the clock.

---

14. D Flip-Flop with Asynchronous Reset

An asynchronous reset does not wait for the clock edge.

When reset is asserted, the output is immediately cleared.

Example:

module dff_asyncres (
    input clk,
    input async_reset,
    input d,
    output reg q
);

always @(posedge clk, posedge async_reset)
begin
    if (async_reset)
        q <= 1'b0;
    else
        q <= d;
end

endmodule

Here, both "posedge clk" and "posedge async_reset" are present in the sensitivity list.

Therefore, the reset can change the output independently of the clock.

---

15. Asynchronous Reset Simulation

The design can be simulated using Icarus Verilog.

Example:

iverilog dff_asyncres.v tb_dff_asyncres.v

Run the generated simulation:

./a.out

A VCD waveform can then be viewed using GTKWave:

gtkwave dump.vcd

In the waveform, when the asynchronous reset becomes active, the output "q" is cleared without waiting for the next clock edge.

"Asynchronous Reset Waveform" (./images/dff_async_waveform.png)

---

16. D Flip-Flop with Synchronous Reset

In a synchronous reset flip-flop, reset is checked only at the active clock edge.

Example:

module dff_syncres (
    input clk,
    input sync_reset,
    input d,
    output reg q
);

always @(posedge clk)
begin
    if (sync_reset)
        q <= 1'b0;
    else
        q <= d;
end

endmodule

Here, the reset is checked only when the positive edge of the clock occurs.

---

17. Synchronous Reset Simulation

Compile the design:

iverilog dff_syncres.v tb_dff_syncres.v

Run the simulation:

./a.out

Open the waveform:

gtkwave dump.vcd

The important observation is that the output does not immediately respond when reset changes. It responds when the active clock edge occurs.

"Synchronous Reset Waveform" (./images/dff_sync_waveform.png)

---

18. Asynchronous vs Synchronous Reset

Asynchronous Reset| Synchronous Reset
Does not depend on clock edge| Depends on clock edge
Reset can act immediately| Reset acts at active clock edge
Reset is included in sensitivity list| Reset is normally checked inside the clocked block
Output can change immediately when reset is asserted| Output changes only at the clock edge

---

19. Flip-Flop Synthesis Using Yosys

The flip-flop RTL can also be synthesized using Yosys.

Start Yosys:

yosys

Read the library:

read_liberty -lib ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

Read the Verilog file:

read_verilog dff_asyncres.v

Synthesize:

synth -top dff_asyncres

Perform technology mapping:

abc -liberty ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

View the synthesized circuit:

show

Generate the netlist:

write_verilog -noattr dff_asyncres_netlist.v

The same process can be followed for the synchronous reset flip-flop.

"Asynchronous Flip-Flop Synthesis" (./images/dff_async_synthesis.png)

"Synchronous Flip-Flop Synthesis" (./images/dff_sync_synthesis.png)

---

20. Simulation Flow

The Day 2 simulation flow is:

Verilog RTL
     ↓
Testbench
     ↓
Icarus Verilog
     ↓
VCD File
     ↓
GTKWave
     ↓
Waveform Analysis

The waveform is used to verify whether the RTL design behaves as expected.

---

21. Synthesis Flow

The synthesis flow is:

Verilog RTL
     ↓
Yosys
     ↓
Read SKY130 Liberty Library
     ↓
RTL Synthesis
     ↓
Technology Mapping
     ↓
Gate-Level Netlist

Yosys is used for RTL synthesis, while the SKY130 standard-cell library provides the cells and their characterized information.

---

22. Optimization Techniques Observed

During synthesis, the synthesis tool can optimize the design instead of directly converting every RTL statement into separate hardware.

Some common observations include:

- Removing unnecessary logic
- Simplifying Boolean expressions
- Sharing common logic
- Selecting suitable standard cells
- Optimizing the synthesized netlist
- Mapping the logic to available library cells

For example, simple arithmetic operations may sometimes be represented using simpler wiring or logic structures rather than requiring a large dedicated hardware block.

---

23. Important Commands Used

Open the library

gvim ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

Start Yosys

yosys

Read Liberty library

read_liberty -lib ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

Read Verilog

read_verilog <design>.v

Synthesis

synth -top <top_module>

Technology mapping

abc -liberty ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

Show synthesized design

show

Flatten hierarchy

flatten

Generate netlist

write_verilog -noattr <netlist>.v

Simulate

iverilog <design>.v <testbench>.v
./a.out

View waveform

gtkwave dump.vcd

---

24. Observations

From the Day 2 experiments, the following observations were made:

1. The ".lib" file contains important timing, power, area and cell information.

2. PVT conditions are important when characterizing standard cells.

3. Different standard-cell flavours can have different area, power and timing characteristics.

4. Hierarchical synthesis preserves the module structure.

5. Flat synthesis removes the hierarchy and represents the design as a flattened structure.

6. Sub-module synthesis is useful for modular and large designs.

7. An asynchronous reset can affect the flip-flop output independently of the clock.

8. A synchronous reset affects the flip-flop output only at the active clock edge.

9. Yosys can synthesize RTL and map the design to cells from the SKY130 library.

10. The final synthesized netlist can be inspected to understand how the RTL is implemented using standard cells.

---

25. Conclusion

Day 2 provided an understanding of timing libraries and the role of standard cells in RTL synthesis.

The SKY130 Liberty library was studied to understand PVT conditions, cell information, timing, power, area and capacitance.

Hierarchical, flat and sub-module synthesis were explored using Yosys. The behaviour of D flip-flops with synchronous and asynchronous reset was also studied through simulation and synthesis.

These experiments helped in understanding how Verilog RTL is converted into a technology-mapped gate-level implementation using the SKY130 standard-cell library.
