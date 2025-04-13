# 🔌 NOT Gate Project – Verilog Simulation, Synthesis, and Layout

This project demonstrates the complete digital design flow for a simple NOT gate, including simulation, synthesis, and physical layout.  
It uses **IIC-OSIC-TOOLS**, **GTKWave**, **Yosys**, and **OpenLane 2**.

📺 Also available as a video series on YouTube:  
https://www.youtube.com/@marcinmaslanka9621
---

## 📁 Directory Setup

Create a new project directory inside your IIC-OSIC-TOOLS environment:

```bash
mkdir -p /foss/designs/SKY/not
```

Copy the following files into the new directory:

- `not.v` – Verilog source
- `not_tb.v` – Verilog testbench
- `config.json` – OpenLane2 configuration file

---

## 📊 View Simulation in GTKWave

### 1. Compile and Simulate

```bash
iverilog -o not_tb.vvp not_tb.v not.v
vvp not_tb.vvp
gtkwave not_tb.vcd
```

### 2. GTKWave Instructions

- Select your **DUT** (Device Under Test)
- Add signals to the timeline
- Use `Ctrl + Scroll` to zoom in and out on the waveform

---

## 🧠 Synthesis and Visualization using Yosys

### 1. Launch Yosys

```bash
yosys
```

Inside the Yosys shell:

```yosys
read_verilog not.v
proc
stat
show -colors 3
```

Use `-ls` and `-cd` in the Yosys shell to navigate through cells.

---

### 2. Gate-Level Synthesis

Before you begin, copy the *.lib file into your directory:

```bash
cp /foss/pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib .
```

Then run the following inside Yosys shell:

```yosys
techmap
write_verilog -noattr not_synth.v
abc -liberty sky130_fd_sc_hd__tt_025C_1v80.lib
write_verilog -noattr not_synth2.v
exit
```

---

## 🏗️ Synthesis and Layout with OpenLane2

### 1. Create Project Directory

```bash
mkdir -p /headless/OpenLane/designs/not
```

Copy these files into the new directory:

- `not.v`
- `config.json`

### 2. Run the Flow

From your Project directory:

```bash
openlane config.json
```

... After 2 minutes, the flow will be completed.

---

## 🔍 How to View Results

### 🔌 Power Report

```bash
/headless/OpenLane/designs/not/runs/RUN_2025-04-13_08-27-15/54-openroad-stapostpnr/nom_tt_025C_1v80/power.rpt
```

### 📐 Core and Die Area

```bash
/headless/OpenLane/designs/not/runs/RUN_2025-04-13_08-27-15/13-openroad-floorplan/openroad-floorplan.log
```

### 🧱 Layout (GDS File)

```bash
cd /headless/OpenLane/designs/not/runs/RUN_2025-04-13_08-27-15/final/gds
klayout not.gds
```

### 🔥 Heatmap (GUI)

```bash
cd /headless/OpenLane/designs/not/runs/RUN_2025-04-13_08-27-15/final/odb
openroad -gui
```

---

## ✅ Summary

With this flow, you can:

- Simulate Verilog and visualize results with GTKWave
- Generate gate-level netlists using Yosys
- Run full RTL-to-GDSII flow with OpenLane2
- Analyze power, layout, and area metrics

---
