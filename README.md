Procedure how to make a plot from Verilog Code
make a new directory inside your IIC-OSIC-TOOLS 
  /foss/designs/SKY/not
and copy this files into it
  not.v
  not_tb.v
  config.json

how to display Verilog into GTKWAVE:
  iverilog -o not_tb.vvp not_tb.v not.v
  vvp not_tb.vvp
  gtkwave not_tb.vcd

Inside GTKWAVE
  select your DUT, add the signals to the timeline and with Ctrl+Scroll you can Zoom-Out and see the plot


Procedure how to visualize and syntheszse to Gate Level within Yosys Tool

Run Yosys from your Project Directory
  read_verilog not.v
  proc
  stat
  show -colors 3
With -ls and -cd you can go into the cell

For synthesis you can follow this procedure
    Bevor start make sure you have copied the Library into your project directory:
      cp /foss/pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib .
  
  techmap
  write_verilog -noattr not_synth.v
  abc -liberty sky130_fd_sc_hd__tt_025C_1v80.lib
  write_verilog -noattr not_synth2.v
  exit


Procedure how to Synthesys Verillog within Openlane2 
Got to the Openlane2 inside IIC-OSIC-TOOLS and make a new directory
  /headless/OpenLane/designs/not
Place the following files into it
  not.v
  config.json
And run the Openlane2
  openlane config.json

...after 2 you will see the flow is complete.
Go to the runs Directory, then the latest RUN... 

to see the Power Consumptions goto:
  /headless/OpenLane/designs/not/runs/RUN_2025-04-13_08-27-15/54-openroad-stapostpnr/nom_tt_025C_1v80
  and select power.rpt

to see the Core Arer and Die Area goto:
  /headless/OpenLane/designs/not/runs/RUN_2025-04-13_08-27-15/13-openroad-floorplan
  and select openroad-floorplan.log

to see the Layout goto:
  /headless/OpenLane/designs/not/runs/RUN_2025-04-13_08-27-15/final/gds
  there you will find not.gds File , write klayout and hit enter

to see the Heatmap goto:
  /headless/OpenLane/designs/not/runs/RUN_2025-04-13_08-27-15/final/odb
  write openroad -gui
  
  
