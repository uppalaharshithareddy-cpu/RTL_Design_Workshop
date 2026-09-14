# DAY 2

## RTL Design Workshop

This folder contains my Day 2 workshop documentation and experiment work.

## Timing Libraries

## Hierarchical vs Flat Synthesis

## Efficient Flop Coding Styles

## Simulation and Synthesis

🟦 DAY 2 – Timing Libraries, Hierarchical vs Flat Synthesis and Flip-Flop Coding Styles

---

## 🔹 1. OVERVIEW

Day 2 focuses on understanding timing libraries, standard cells, synthesis techniques, and sequential logic.

Topics Covered

- SKY130 PDK and Standard Cell Library
- Timing Library (".lib")
- PVT – Process, Voltage and Temperature
- Contents of the Liberty File
- Standard Cell Characteristics
- Hierarchical Synthesis
- Flat Synthesis
- Sub-Module Level Synthesis
- D Flip-Flop
- Asynchronous Reset
- Synchronous Reset
- Simulation using Icarus Verilog
- Waveform Analysis using GTKWave
- Synthesis using Yosys
- Basic Optimization Techniques

---

## 🔹 2. SKY130 PDK

What is SKY130?

SKY130 is an open-source 130 nm semiconductor technology used for designing and implementing integrated circuits.

The technology provides a collection of standard cells that can be used during digital synthesis.

Standard cells include:

- AND gates
- OR gates
- NAND gates
- NOR gates
- Inverters
- Buffers
- Multiplexers
- Flip-flops

---

## 🔹 3. STANDARD CELL LIBRARY

A standard-cell library contains pre-designed and characterized cells used during synthesis.

Each cell contains important information such as:

Parameter| Description
Function| Logic operation performed by the cell
Area| Physical area occupied by the cell
Power| Power consumed by the cell
Timing| Delay and timing characteristics
Capacitance| Input/output loading information
Leakage Power| Power consumed when the cell is not switching

The synthesis tool uses this information to select suitable cells for the RTL design.

---

## 🔹 4. SKY130 TIMING LIBRARY

The timing library used in the workshop is:

sky130_fd_sc_hd__tt_025C_1v80.lib

Library Name Explanation

Part| Meaning
sky130| 130 nm technology
fd| SkyWater foundry
sc| Standard Cell
hd| High Density
tt| Typical Process
025C| 25°C temperature
1v80| 1.80 V supply voltage

PVT

PVT = Process + Voltage + Temperature

PVT conditions affect the performance of standard cells.

"SKY130 Timing Library" (./images/lib_file.png)

---

## 🔹 5. LIBERTY ".lib" FILE

The Liberty file (".lib") contains information required by synthesis and timing analysis tools.

It provides information about the electrical and timing characteristics of standard cells.

Important information in a ".lib" file:

- Cell name
- Cell area
- Power information
- Leakage power
- Input capacitance
- Output capacitance
- Cell function
- Propagation delay
- Rise transition
- Fall transition
- Setup time
- Hold time
- Pin information

---

## 🔹 6. CELL CHARACTERISTICS

Different versions of the same standard cell may have different:

- Drive strength
- Area
- Power
- Delay
- Input capacitance

The synthesis tool selects an appropriate cell according to the requirements of the design.

For example, a higher-drive cell can drive a larger load, but it may require more area and power.

---

## 🔹 7. HIERARCHICAL SYNTHESIS

In hierarchical synthesis, the module structure of the RTL design is maintained.

# Example

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

Here, "multiple_modules" is the top module, while "sub_module1" and "sub_module2" are sub-modules.

Yosys Commands

read_liberty -lib ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog multiple_modules.v
synth -top multiple_modules
abc -liberty ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show

"Hierarchical Synthesis" (./images/hierarchical.png)

---

## 🔹 8. FLAT SYNTHESIS

In flat synthesis, the hierarchy between the modules is removed.

The "flatten" command is used in Yosys:

flatten

The complete design is represented as a single flattened structure.

Generate Netlist

write_verilog -noattr multiple_modules_flat.v

"Flat Synthesis" (./images/flat.png)

---

## 🔹 9. HIERARCHICAL vs FLAT SYNTHESIS

Hierarchical| Flat
Module hierarchy is maintained| Module hierarchy is removed
Sub-modules remain identifiable| Complete logic is flattened
Useful for modular designs| Useful for complete design optimization
Easier to understand individual modules| Easier to view the complete logic

---

## 🔹 10. SUB-MODULE LEVEL SYNTHESIS

A sub-module can be synthesized independently by specifying it as the top module.

For example:

synth -top sub_module1

This is useful when:

- The design contains many modules.
- Individual modules need to be tested.
- A large design needs to be divided into smaller parts.
- Reusable modules are being developed.

---

## 🔹 11. FLIP-FLOP OVERVIEW

A flip-flop is a sequential logic element used to store one bit of information.

A D flip-flop stores the value of D at the active clock edge.

Basic D Flip-Flop

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

---

## 🔹 12. D FLIP-FLOP WITH ASYNCHRONOUS RESET

An asynchronous reset can reset the flip-flop without waiting for the clock edge.

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

Important Point

When "async_reset" becomes active, "q" can become "0" immediately.

---

## 🔹 13. ASYNCHRONOUS RESET – SIMULATION

Compile

iverilog dff_asyncres.v tb_dff_asyncres.v

Run

./a.out

View Waveform

gtkwave dump.vcd

The waveform shows that the output responds to the reset independently of the clock edge.

"Asynchronous Reset Waveform" (./images/dff_async_waveform.png)

---

## 🔹 14. D FLIP-FLOP WITH SYNCHRONOUS RESET

A synchronous reset is checked only at the active clock edge.

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

Important Point

The output changes due to reset only when the active clock edge occurs.

---

## 🔹 15. SYNCHRONOUS RESET – SIMULATION

Compile

iverilog dff_syncres.v tb_dff_syncres.v

Run

./a.out

View Waveform

gtkwave dump.vcd

The waveform shows that the reset is considered only at the clock edge.

"Synchronous Reset Waveform" (./images/dff_sync_waveform.png)

---

## 🔹 16. ASYNCHRONOUS vs SYNCHRONOUS RESET

Asynchronous Reset| Synchronous Reset
Acts independently of clock| Depends on clock
Can reset immediately| Resets at active clock edge
Reset appears in sensitivity list| Reset is checked inside clocked block
Output can change immediately| Output waits for clock edge

---

## 🔹 17. FLIP-FLOP SYNTHESIS USING YOSYS

The RTL flip-flop can be converted into a gate-level implementation using Yosys.

Step 1 – Start Yosys

yosys

Step 2 – Read Timing Library

read_liberty -lib ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

Step 3 – Read Verilog

read_verilog dff_asyncres.v

Step 4 – Synthesize

synth -top dff_asyncres

Step 5 – Technology Mapping

abc -liberty ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

Step 6 – View Circuit

show

Step 7 – Generate Netlist

write_verilog -noattr dff_asyncres_netlist.v

"Asynchronous Flip-Flop Synthesis" (./images/dff_async_synthesis.png)

---

## 🔹 18. SYNCHRONOUS FLIP-FLOP SYNTHESIS

The same synthesis flow can be applied to the synchronous reset flip-flop.

read_liberty -lib ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog dff_syncres.v
synth -top dff_syncres
abc -liberty ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
write_verilog -noattr dff_syncres_netlist.v

"Synchronous Flip-Flop Synthesis" (./images/dff_sync_synthesis.png)

---

## 🔹 19. SIMULATION FLOW

The overall simulation process is:

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

Tools Used

Tool| Purpose
Icarus Verilog| RTL simulation
GTKWave| Waveform viewing
Yosys| RTL synthesis
SKY130 ".lib"| Standard-cell timing/library information

---

🔹 20. SYNTHESIS FLOW

RTL Verilog
     ↓
Yosys
     ↓
Read Liberty Library
     ↓
RTL Synthesis
     ↓
Technology Mapping
     ↓
Standard Cells
     ↓
Gate-Level Netlist

---

## 🔹 21. OPTIMIZATION TECHNIQUES

During synthesis, Yosys performs different optimizations to obtain an efficient implementation.

Important optimization concepts include:

- Logic simplification
- Boolean optimization
- Removal of unnecessary logic
- Logic sharing
- Technology mapping
- Selection of suitable standard cells

The objective is to obtain an efficient implementation while considering factors such as:

Area + Power + Timing

---

## 🔹 22. OBSERVATIONS

Observation 1

The SKY130 timing library contains important information about standard cells.

Observation 2

The ".lib" file contains area, power, capacitance and timing information.

Observation 3

PVT conditions affect standard-cell behaviour.

Observation 4

Hierarchical synthesis maintains the RTL module structure.

Observation 5

Flat synthesis removes the module hierarchy.

Observation 6

An asynchronous reset can affect the output without waiting for a clock edge.

Observation 7

A synchronous reset affects the output only at the active clock edge.

Observation 8

Yosys can synthesize RTL and map it to cells from the SKY130 library.

---

## 🔹 23. CONCLUSION

Day 2 provided an understanding of timing libraries, standard cells, synthesis techniques and sequential logic.

The SKY130 ".lib" timing library was studied along with PVT, cell characteristics, area, power, capacitance and timing information.

Both hierarchical and flat synthesis were explored using Yosys. The behaviour of D flip-flops with asynchronous and synchronous reset was verified through simulation and waveform analysis.

The complete flow from RTL → Simulation → Synthesis → Technology Mapping → Netlist was understood.

---



«RTL design is not only about writing Verilog. The RTL must be understood, simulated, synthesized and mapped to suitable standard cells using technology libraries.»
