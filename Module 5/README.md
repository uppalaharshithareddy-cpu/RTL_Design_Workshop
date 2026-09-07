# Module 5
# Day 5 – RTL Constructs, Case/If Statements and Synthesis
## 🎯 Overview

Module 5 focuses on understanding different RTL coding constructs
and how they are interpreted during simulation and synthesis.

The experiments covered:

- if and case based combinational logic
- incomplete conditional assignments
- latch inference
- MUX and DEMUX implementations
- generate-based RTL structures
- partial case assignments
- Ripple Carry Adder
- RTL simulation and waveform analysis

  ## 🛠️ Tools Used

- Verilog HDL
- Cloud-based Verilog simulation environment
- GTKWave / waveform viewer
- GitHub

## 🔄 Overall Flow

Verilog RTL
     ↓
RTL Simulation
     ↓
Waveform Generation
     ↓
Waveform Analysis
     ↓
Yosys Synthesis
     ↓
SKY130 Technology Mapping
     ↓
Synthesized Hardware

## 📚 Experiments

| No. | Experiment | Main Concept |
|---|---|---|
| 1 | bad_case | Case-based combinational logic |
| 2 | comp_case | Case-based combinational logic |
| 3 | demux_case | DEMUX using case |
| 4 | incomp_if | Incomplete if and latch inference |
| 5 | incomp_if2 | Conditional assignment and latch behavior |
| 6 | mux_generate | Generate-based MUX implementation |
| 7 | partial_case_assign | Partial case assignment |
| 8 | Ripple_Carry_Adder | Multi-bit arithmetic structure |

## 1. Bad Case

The bad_case experiment demonstrates case-based combinational
logic.

A case statement is used to select the required output based
on the input condition.

### Concept

Input Conditions
       ↓
Case Logic
       ↓
Combinational Logic
       ↓
Output

### Waveform

The waveform generated from the RTL simulation is shown below.

![bad_case waveform](bad_case_waveform.png)

## 2. Case-Based Combinational Logic

The comp_case experiment demonstrates combinational logic
implemented using a case statement.

The output changes according to the selected input condition.

### Concept

Inputs
   ↓
Case Statement
   ↓
Condition Selection
   ↓
Combinational Logic
   ↓
Output

### Waveform

![comp_case waveform](comp_case_waveform.png)

## 3. DEMUX Using Case

The demux_case experiment demonstrates a demultiplexer
implemented using a case statement.

A DEMUX routes one input signal to one of several output
lines according to the select signal.

### Concept

Input
  ↓
DEMUX
  ↓
Selected Output

### Waveform

![demux_case waveform](demux_case_waveform.png)

## 4. Incomplete If and Latch Inference

The incomp_if experiment demonstrates the effect of incomplete
assignments in combinational RTL.

When an output is not assigned for every required condition,
the synthesis tool may infer a latch.

### Concept

Incomplete Assignment
        ↓
Previous value must be retained
        ↓
Storage required
        ↓
Latch

### Waveform

![incomp_if waveform](incomp_if_waveform.png)

## 5. Incomplete If – Second Case

The incomp_if2 experiment provides another example of
conditional assignment in RTL.

The experiment helps understand how incomplete assignments
can affect the hardware inferred during synthesis.

### Waveform

![incomp_if2 waveform](incomp_if2_waveform.png)

## 6. MUX Using Generate

The mux_generate experiment demonstrates a multiplexer
implementation using the generate construct.

Generate statements are useful for creating repeated
hardware structures.

### Concept

Generate
   ↓
Repeated Logic
   ↓
MUX Hardware

### Waveform

![mux_generate waveform](mux_generate_waveform.png)

## 7. Partial Case Assignment

The partial_case_assign experiment demonstrates the effect
of partial assignments in case-based RTL.

If all required cases are not assigned, the synthesized
hardware may contain storage behavior such as a latch.

### Concept

Case Statement
      ↓
Check Conditions
      ↓
Complete Assignment?
   ↙          ↘
 YES          NO
 ↓             ↓
Combinational  Possible
Logic          Latch

### Waveform

![partial case waveform](partial_case_assign_waveform.png)

## 8. Ripple Carry Adder

The Ripple Carry Adder experiment demonstrates a multi-bit
arithmetic circuit constructed using full-adder stages.

The carry output from one stage becomes the carry input
of the next stage.

### Concept

A + B + Cin
     ↓
Full Adder
     ↓
Sum + Carry
     ↓
Next Full Adder

### Waveform

![Ripple Carry Adder waveform](rca_waveform.png)

## 🧠 Learning Outcomes

Through these experiments, I learned:

- How if and case statements are used in RTL design
- How case statements implement combinational logic
- How MUX and DEMUX circuits can be described using RTL
- How incomplete assignments can result in latch inference
- How generate constructs create repeated hardware structures
- How partial case assignments affect hardware behavior
- How a Ripple Carry Adder is constructed
- How to simulate RTL designs and analyze their waveforms
- How RTL coding style affects the resulting hardware


