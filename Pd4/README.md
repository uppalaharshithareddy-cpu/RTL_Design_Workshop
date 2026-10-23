
⏱️ PD 4 – Clock Tree Synthesis (CTS)

🎯 Objective

To understand Clock Tree Synthesis and learn how the clock signal is distributed to sequential elements in a digital circuit.

📚 Topics Covered

- Clock Distribution
- Clock Buffers
- Clock Latency
- Clock Skew
- Clock Tree Construction
- Setup and Hold Timing
- Timing Optimization

🛠️ Tools Used

- OpenLANE
- OpenROAD
- OpenSTA
- SKY130 PDK

🔄 Implementation Steps

1. Load the placed design.
2. Configure clock-related parameters.
3. Perform Clock Tree Synthesis.
4. Insert clock buffers.
5. Examine the clock distribution network.
6. Analyze post-CTS timing.
7. Review timing optimization results.

💻 Command

In a compatible OpenLANE interactive flow:

"run_cts"

💡 Key Learnings

- Understood the purpose of CTS.
- Learned the role of clock buffers.
- Understood clock latency and clock skew.
- Learned how timing is analyzed after CTS.

📸 Screenshots

Add CTS execution, clock tree, and post-CTS timing report screenshots here.

✅ Conclusion

Clock Tree Synthesis builds the clock distribution network and helps deliver the clock signal to sequential elements with acceptable timing characteristics.
