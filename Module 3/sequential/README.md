### 🚀 Module 2 – Sequential Optimization

## 🔹 1. Overview

Sequential optimization is the process of improving sequential logic circuits to obtain an efficient hardware implementation while maintaining the required functionality.

Sequential circuits contain memory elements such as flip-flops and registers. Their outputs depend on present inputs as well as previously stored information.

In this module, Yosys is used to synthesize and optimize Verilog RTL designs and understand the resulting hardware implementation.

---

## 🔹 2. What is Sequential Logic?

Sequential logic is a type of digital logic where the output depends on:

- Present input values
- Previous state of the circuit

Unlike combinational logic, sequential logic contains memory elements and generally operates using a clock signal.

Examples

- Flip-flops
- Registers
- Counters
- Shift registers
- Finite State Machines (FSMs)
- Sequential logic circuits

A clock signal is commonly used to control when the stored state is updated.

---

## 🔹 3. What is Sequential Optimization?

Sequential optimization means simplifying or improving sequential logic while maintaining its required behavior.

The optimization process may reduce unnecessary logic, simplify state transitions, or improve the hardware implementation.

Main Objectives

- Reduce the number of logic gates
- Reduce hardware area
- Reduce unnecessary sequential logic
- Improve circuit efficiency
- Maintain the required functionality
- Optimize the use of flip-flops and combinational logic

---

## 🔹 4. Why is Optimization Required?

Optimization is important because sequential circuits may contain a large number of registers and logic elements.

An efficient sequential design can help reduce:

- Hardware area
- Logic complexity
- Power consumption
- Unnecessary switching activity
- Propagation delay

The exact improvement depends on the RTL design, synthesis tool, coding style, and target standard-cell library.

---

## 🔹 5. Sequential Optimization Using Yosys

Yosys is an open-source RTL synthesis tool used to convert Verilog RTL into a synthesized hardware representation.

For sequential designs, Yosys processes the RTL and identifies memory elements such as flip-flops.

Basic Synthesis Flow

Verilog RTL
     ↓
Yosys
     ↓
RTL Processing
     ↓
Logic Optimization
     ↓
Sequential Logic Analysis
     ↓
Technology Mapping
     ↓
Gate-Level Netlist

The synthesis process converts the RTL description into hardware components while preserving the required design behavior.

---

## 🔹 6. Design Used

The sequential optimization examples are implemented using Verilog RTL files.

Verilog Files

- "opt_check.v"
- "opt_check2.v"
- "opt_check3.v"

«Note: Replace the filenames above with the actual Verilog files used in your Module 2 lab.»

The designs are synthesized using Yosys to understand how sequential logic is processed and optimized.

---

## 🔹 7. Verilog Sequential Design

A basic sequential design can be implemented using an always block triggered by a clock.

Example

module sequential_example (
    input clk,
    input reset,
    input d,
    output reg q
);

always @(posedge clk) begin
    if (reset)
        q <= 1'b0;
    else
        q <= d;
end

endmodule

Description

- "clk" is the clock signal.
- "reset" initializes the output.
- "d" is the input data.
- "q" is the stored output.
- The output changes on the rising edge of the clock.

This example represents a simple D flip-flop with reset.

«Important: The above code is an example. Use your actual lab RTL code if it is different.»

---

## 🔹 8. Yosys Synthesis

The sequential RTL design can be processed using Yosys.

Typical Synthesis Commands

read_verilog
proc
opt
memory
opt
techmap
opt
abc
clean
stat

These commands represent a general synthesis flow.

Description

- "read_verilog" – Reads the Verilog RTL file.
- "proc" – Processes RTL processes and identifies sequential logic.
- "opt" – Performs logic optimization.
- "memory" – Processes memory-related RTL structures.
- "techmap" – Performs technology mapping.
- "abc" – Performs logic optimization and mapping using ABC.
- "clean" – Removes unused logic.
- "stat" – Displays synthesis statistics.

«The exact commands depend on the synthesis script used in your VSD workshop.»

---

🔹 9. Sequential Optimization Process

The optimization process simplifies the sequential logic while maintaining the required behavior.

General Flow

RTL Design
    ↓
Read Verilog
    ↓
Process Sequential Logic
    ↓
Identify Flip-Flops
    ↓
Optimize Logic
    ↓
Technology Mapping
    ↓
Final Netlist

The synthesis tool analyzes the RTL and generates a hardware implementation based on the design requirements.

---

## 🔹 10. SKY130 Standard Cell Library

The optimized sequential logic can be mapped to standard cells from the SKY130 technology library.

Technology mapping converts the synthesized logic into cells available in the target library.

Examples of Sequential Standard Cells

- D Flip-Flops
- Resettable Flip-Flops
- Inverters
- AND Gates
- OR Gates
- Multiplexers

The exact standard cells depend on the RTL design and synthesis configuration.

---

## 🔹 11. Synthesis Result

After running the Yosys synthesis flow, the synthesis statistics can be observed from the terminal output.

Important Parameters

- Number of wires
- Number of wire bits
- Number of cells
- Number of flip-flops
- Types of sequential cells
- Number of combinational cells
- Overall hardware structure

📸 Yosys Synthesis Output

Add your actual synthesis screenshot here.

![Yosys Synthesis Result](./images/sequential_synthesis.png)

«Change the image path to match the actual location and filename of your uploaded screenshot.»

---

## 🔹 12. Observations

From the synthesis and optimization process:

- The Verilog RTL is converted into a synthesized hardware representation.
- Yosys processes sequential logic and identifies memory elements.
- Flip-flops are used to store the circuit state.
- Logic optimization can simplify unnecessary hardware.
- Technology mapping converts the design into standard cells.
- Synthesis statistics help in understanding the hardware generated from RTL.

---

## 🔹 13. Learning Outcomes

Through this module, I learned:

1. The difference between combinational and sequential logic.
2. The importance of clock signals in sequential circuits.
3. How flip-flops store information.
4. How Yosys processes sequential RTL.
5. How logic optimization improves hardware efficiency.
6. How sequential designs can be mapped to SKY130 standard cells.
7. How to analyze synthesis statistics.

---

## 🔹 14. Conclusion

In this module, the concept of sequential optimization was studied using Yosys.

The sequential RTL design was processed through the synthesis flow to understand how memory elements and logic are represented in hardware.

This module helped in understanding the role of flip-flops, clock signals, RTL synthesis, and optimization in designing efficient sequential circuits.

---

📂 Files in This Folder

File| Description
"opt_check.v"| Sequential RTL design
"opt_check2.v"| Sequential optimization example
"opt_check3.v"| Sequential optimization example
"README.md"| Module documentation
"images/"| Synthesis screenshots
