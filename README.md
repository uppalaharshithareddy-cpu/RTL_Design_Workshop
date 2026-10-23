🔰 RTL Design Workshop

Welcome to my RTL Design Workshop repository.

This repository contains my work, documentation, assignments, and RTL design experiments completed as part of the workshop. It covers RTL design using Verilog HDL, combinational optimization, simulation, synthesis, and ASIC physical design.

The repository documents my learning journey from basic digital circuit design to the physical implementation stages of VLSI design.

---

📂 1. Repository Structure

RTL_Design_Workshop/
│
├── 2_to_1_MUX/
│
├── DAY 2/
│
├── Module 3/
│
├── Module 4/
│
├── Module 5/
│
├── PD 1/
│
├── PD 2/
│
├── PD 3/
│
├── PD 4/
│
├── PD 5/
│
└── README.md

---

📚 2. RTL Design Workshop Modules

🔹 Day 1 — 2:1 Multiplexer

🎯 Objective

To understand basic digital logic design and implement a 2:1 Multiplexer using Verilog HDL.

📖 Topics Covered

- Introduction to RTL design
- Verilog HDL fundamentals
- 2:1 Multiplexer functionality
- Digital logic implementation
- Simulation and output verification

🧠 Key Learnings

- Understanding combinational logic.
- Writing RTL code using Verilog.
- Understanding input selection and output generation.

---

🔹 Day 2 — Workshop Activities

🎯 Objective

To understand the workshop environment and perform the assigned RTL design experiments.

📖 Topics Covered

- Workshop setup and tools
- RTL design workflow
- Experiment execution
- Design analysis
- Documentation of results

🧠 Key Learnings

- Understanding the RTL design process.
- Learning the basic workflow of digital design experiments.
- Recording observations and documenting results.

---

🔹 Module 3 — Combinational Optimization

🎯 Objective

To understand combinational logic optimization and how synthesis tools simplify digital circuits.

📖 Topics Covered

- Combinational logic
- RTL optimization
- Logic simplification
- Synthesis concepts
- Standard-cell mapping

🛠️ Tools Used

- Yosys
- SKY130 standard-cell library, where applicable

🧠 Key Learnings

- Understanding combinational logic optimization.
- Learning how redundant logic can be simplified.
- Understanding the relationship between RTL and synthesized logic.

---

🔹 Module 4 — Sequential Logic

🎯 Objective

To study sequential digital circuits and understand how circuit behavior depends on stored state and clock signals.

📖 Topics Covered

- Sequential logic fundamentals
- Registers and flip-flops
- Clock signals
- State-dependent behavior
- RTL implementation and synthesis

🧠 Key Learnings

- Understanding the difference between combinational and sequential circuits.
- Learning the role of registers and flip-flops.
- Understanding clock-dependent circuit behavior.

---

🔹 Module 5 — Routing and Physical Verification

🎯 Objective

To understand routing algorithms, power distribution, TritonRoute, and design-rule verification in the physical design flow.

📖 Topics Covered

- Maze routing
- Lee's algorithm
- Design Rule Checking (DRC)
- Power Distribution Network (PDN)
- Global routing
- Detailed routing
- TritonRoute features
- Route guides and connectivity
- Post-route design data

🧠 Key Learnings

- Understanding global and detailed routing.
- Learning how metal layers and vias connect circuit components.
- Understanding routing guides and connectivity.
- Learning the purpose of physical verification.

---

🏭 3. Physical Design — PD 1 to PD 5

🔰 PD 1 — Introduction to Physical Design and Synthesis

🎯 Objective

To understand the ASIC physical design flow, RTL synthesis, standard-cell libraries, and the tools used to generate a gate-level netlist.

📖 Topics Covered

- ASIC design flow
- RTL synthesis
- Logic optimization
- Technology mapping
- Standard-cell libraries
- SKY130 PDK
- Gate-level netlist generation

🔹 RTL Synthesis

RTL synthesis converts Verilog RTL code into a gate-level representation using a target standard-cell library.

🔄 Synthesis Flow

RTL Design
↓
RTL Processing
↓
Logic Optimization
↓
Technology Mapping
↓
Gate-Level Netlist
↓
Synthesis Reports

🛠️ Tools Used

- Yosys
- OpenLANE
- SKY130 PDK
- OpenROAD
- OpenSTA

📚 Important Concepts

Topic| Description
🧩 RTL| Register Transfer Level design
⚙️ Synthesis| Converts RTL into a gate-level representation
🔧 Yosys| Open-source synthesis tool
📚 Standard-Cell Library| Collection of predefined circuit cells
🏭 PDK| Technology-specific design resources
📄 Netlist| Description of circuit connectivity
📊 Area Report| Information about mapped cell area
⏱️ Timing Report| Information about circuit timing

🧠 Skills Developed

- RTL synthesis fundamentals
- Standard-cell library understanding
- ASIC design flow
- Synthesis report analysis

🏁 Conclusion

PD 1 introduces the fundamental concepts of ASIC Physical Design and explains how RTL code is converted into a gate-level netlist.

---

🏗️ PD 2 — Floorplanning and Power Planning

🎯 Objective

To understand floorplanning, core and die dimensions, pin placement, and power distribution network generation.

📖 Topics Covered

- Die area and core area
- Core utilization
- Aspect ratio
- Pin placement
- Placement rows
- Tap cells and endcap cells
- Power Distribution Network (PDN)
- Power straps and standard-cell rails

🔹 Floorplanning

Floorplanning establishes the initial physical structure of a chip by defining its core area, die area, and other physical implementation parameters.

⚡ Power Planning

Power planning establishes the power and ground distribution network used to supply the circuit.

Important components include:

- VDD — Positive supply network
- VSS — Ground network
- Power straps
- Standard-cell power rails
- Vias between metal layers

🔄 Floorplanning Flow

Synthesized Netlist
↓
Floorplan Configuration
↓
Core and Die Definition
↓
Pin Placement
↓
Placement Rows
↓
Power Distribution Network
↓
Floorplan Inspection

📚 Important Concepts

Topic| Description
🏗️ Floorplanning| Establishes the initial chip structure
📐 Die Area| Overall chip area
🧩 Core Area| Main implementation region
📊 Utilization| Standard-cell area relative to core area
📍 Pin Placement| Assigns physical pin locations
⚡ PDN| Power distribution network
🔌 VDD/VSS| Power and ground networks
🔗 Vias| Connections between metal layers

🧠 Skills Developed

- Physical area planning
- Floorplanning fundamentals
- Pin placement
- Power distribution concepts

🏁 Conclusion

PD 2 explains how the physical structure of an ASIC is established and how power and ground connections are planned.

---

📍 PD 3 — Placement and Optimization

🎯 Objective

To understand standard-cell placement, placement optimization, routing congestion, and the effect of placement on timing.

📖 Topics Covered

- Standard-cell placement
- Global placement
- Detailed placement
- Placement optimization
- Placement legality
- Congestion analysis
- Setup and hold timing

🔹 Types of Placement

Global Placement: Determines approximate standard-cell locations while considering wire length, density, and other optimization objectives.

Detailed Placement: Refines cell locations to satisfy placement constraints and ensure legal placement.

⏱️ Timing Analysis

Timing analysis evaluates whether signals reach their destinations within the required time.

Important concepts include:

- Setup time
- Hold time
- Timing slack
- Critical paths
- Timing violations

🔄 Placement Flow

Floorplanned Design
↓
Global Placement
↓
Placement Optimization
↓
Detailed Placement
↓
Placement Legality Checks
↓
Timing and Congestion Analysis
↓
Placed Design

📚 Important Concepts

Topic| Description
📍 Placement| Determines standard-cell locations
🌐 Global Placement| Estimates cell positions
🧩 Detailed Placement| Refines cell locations
⚙️ Optimization| Improves implementation quality
🚦 Congestion| Competition for routing resources
⏱️ Setup Timing| Data stability before the clock edge
🔒 Hold Timing| Data stability after the clock edge
📊 Slack| Indicates timing margin or violation

🧠 Skills Developed

- Standard-cell placement
- Placement optimization
- Timing analysis
- Congestion analysis
- Placement report interpretation

🏁 Conclusion

PD 3 focuses on standard-cell placement and optimization to improve physical implementation quality and prepare the design for clock distribution.

---

⏱️ PD 4 — Clock Tree Synthesis (CTS)

🎯 Objective

To understand clock distribution, clock buffers, clock latency, clock skew, and post-CTS timing analysis.

📖 Topics Covered

- Clock Tree Synthesis
- Clock distribution
- Clock buffers
- Clock latency
- Clock skew
- Setup and hold timing
- Timing optimization

🔹 Clock Tree Synthesis

Clock Tree Synthesis creates a clock distribution network to deliver clock signals to sequential elements such as flip-flops.

🔹 Important Clock Concepts

Clock Latency: The time taken for the clock signal to reach a destination.

Clock Skew: The difference in clock arrival times between clock destinations.

Clock Buffer: A cell used to drive clock loads and help manage clock distribution.

🔄 CTS Flow

Placed Design
↓
Clock Definition and Constraints
↓
Clock Tree Construction
↓
Clock Buffer Insertion
↓
Clock Network Optimization
↓
Post-CTS Timing Analysis
↓
Clocked Design

💻 Command

In a compatible OpenLANE interactive environment:

"run_cts"

📚 Important Concepts

Topic| Description
⏱️ CTS| Builds the clock distribution network
🔌 Clock Buffer| Drives clock loads
🕒 Clock Latency| Clock arrival delay
⚖️ Clock Skew| Difference in clock arrival times
🔄 Clock Tree| Network distributing the clock
🔍 STA| Static Timing Analysis
⚠️ Setup Violation| Data arrives too late
⚠️ Hold Violation| Data changes too soon

🧠 Skills Developed

- Clock distribution
- Clock buffering
- Clock latency and skew analysis
- Post-CTS timing analysis
- Timing optimization concepts

🏁 Conclusion

PD 4 explains how a clock distribution network is created and how clock timing characteristics are evaluated after CTS.

---

🛣️ PD 5 — Routing and Physical Verification

🎯 Objective

To understand routing algorithms, power distribution, TritonRoute, route guides, connectivity, and physical verification.

🚦 SKY130_D5_SK1 — Routing and DRC

🔹 Maze Routing

Maze routing searches for a valid path between connection points while considering obstacles and routing constraints.

🔹 Lee's Algorithm

Lee's algorithm systematically explores possible paths through a grid until a connection is found or no valid path exists.

🔹 Design Rule Check (DRC)

DRC checks the physical layout against manufacturing rules, including applicable width and spacing requirements.

⚡ SKY130_D5_SK2 — PDN and Routing

🔹 Power Distribution Network

The PDN distributes power and ground throughout the chip.

🔹 Power Straps and Standard-Cell Rails

Power straps distribute supply across the design, while standard-cell rails provide power connections to standard cells.

🔹 Global Routing

Global routing estimates routing paths and allocates routing resources.

🔹 Detailed Routing

Detailed routing determines the actual wires and vias needed to connect the nets.

⚙️ SKY130_D5_SK3 — TritonRoute Features

🔹 SKY_L1: Pre-Processed Route Guides

TritonRoute uses route guides generated earlier in the routing flow to guide detailed routing.

🔹 SKY_L2: Inter-Guide Connectivity and Layer Routing

Inter-guide connectivity maintains connections between routing-guide regions.

Intra-layer routing creates connections within the same metal layer.

Inter-layer routing connects different metal layers using vias.

Metal Layer A
     ↓
    Via
     ↓
Metal Layer B

🔹 SKY_L3: Connectivity Handling

Detailed routing must preserve the intended electrical connections.

Important concepts include:

- Net and guide connectivity
- Routing topology
- Via insertion
- Metal-layer transitions
- Connectivity verification

🔹 SKY_L4: Routing Topology and Post-Route Files

Typical outputs and information include:

- Routed DEF
- Routing reports
- Post-route physical data
- Physical-verification information

These outputs support further analysis and verification of the routed design.

🔄 Routing Flow

Placed Design
↓
Power Distribution Network
↓
Global Routing
↓
Route Guides
↓
Detailed Routing (TritonRoute)
↓
DRC / Physical Verification
↓
Post-Route Design

📚 Important Concepts

Topic| Description
🧩 Maze Routing| Grid-based path finding
🧮 Lee's Algorithm| Systematic routing search
🔍 DRC| Manufacturing-rule verification
⚡ PDN| VDD/VSS power distribution
🌐 Global Routing| Approximate paths and resource allocation
🛠️ Detailed Routing| Physical wires and vias
🧭 Route Guides| Guidance for detailed routing
⚙️ TritonRoute| Detailed-routing tool
🔗 Connectivity| Maintaining electrical connections
📂 Post-Route Data| Routed files and reports

✅ Module Completion Checklist

- SKY130_D5_SK1 — Routing and DRC
- Maze routing and Lee's algorithm
- Design Rule Check concepts
- SKY130_D5_SK2 — PDN and routing
- Power straps and standard-cell rails
- Global and detailed routing
- TritonRoute features
- Route guides and connectivity
- Intra-layer and inter-layer routing
- Routing topology and post-route files

🧠 Skills Developed

- 🏗️ Physical Design: PDN, DRC, and physical verification
- 🧩 Routing Algorithms: Maze routing and Lee's algorithm
- 🌐 Routing Techniques: Global and detailed routing
- ⚙️ Tools: TritonRoute and the RTL-to-GDSII flow
- 🔌 ASIC Concepts: Power delivery, vias, connectivity, and post-route data

🏁 Conclusion

PD 5 brings together routing algorithms, power distribution, TritonRoute, and DRC to explain the final routing-focused stages of physical design.

These concepts demonstrate how a placed and clocked design is converted into a physically routed implementation that can proceed through physical verification.

---

🔄 4. Complete RTL-to-GDSII Flow

The overall ASIC implementation flow consists of several interconnected stages.

RTL Design
    ↓
Synthesis
    ↓
Floorplanning
    ↓
Power Planning
    ↓
Placement
    ↓
Clock Tree Synthesis (CTS)
    ↓
Global Routing
    ↓
Detailed Routing
    ↓
Physical Verification
    ↓
GDSII

Each stage contributes to converting a digital design into a physical layout suitable for manufacturing.

---

🛠️ 5. Tools and Technologies

Tool / Technology| Purpose
💻 Verilog HDL| RTL design
⚙️ Yosys| Logic synthesis
🏭 OpenLANE| ASIC implementation flow
📐 OpenROAD| Physical design operations
⏱️ OpenSTA| Static timing analysis
🔬 Magic| Layout viewing and physical verification
📚 SKY130 PDK| Technology-specific design resources
📊 GTKWave| Waveform visualization, where used

Tools are listed as part of the workshop's broader technology scope; their actual use depends on the corresponding experiment.

---

🎯 6. Overall Learning Objectives

Through these workshop activities, I aim to:

- Understand RTL design using Verilog HDL.
- Implement basic digital circuits.
- Learn combinational and sequential logic concepts.
- Understand RTL synthesis and logic optimization.
- Explore the ASIC physical design flow.
- Learn floorplanning and power planning.
- Understand standard-cell placement.
- Study Clock Tree Synthesis.
- Understand global and detailed routing.
- Learn basic physical verification concepts.
- Interpret design outputs and reports.

---

🧠 7. Skills Developed

- 💻 RTL Design: Verilog HDL fundamentals
- 🧩 Digital Logic: Combinational and sequential circuits
- ⚙️ Synthesis: Logic optimization and netlist generation
- 🏗️ Physical Design: Floorplanning and placement
- ⏱️ Timing Analysis: Setup, hold, latency, and skew
- ⚡ Power Planning: Power distribution concepts
- 🛣️ Routing: Global routing and detailed routing
- 🔍 Verification: DRC and physical verification concepts
- 📂 Documentation: Organizing experiments and results using GitHub

---

👩‍💻 8. Author

Harshitha Reddy

🎓 RTL Design Workshop
📌 ASIC / VLSI Design Learning and Documentation

---

🏁 Final Conclusion

This repository documents my learning activities in RTL Design and ASIC Physical Design.

Starting with basic Verilog RTL implementation, the workshop progresses through logic optimization, synthesis, floorplanning, placement, Clock Tree Synthesis, routing, and physical verification.

The documented concepts provide a foundation for understanding how digital designs move from RTL descriptions toward physical chip layouts.

Thank you for visiting my RTL Design Workshop repository! 🚀
