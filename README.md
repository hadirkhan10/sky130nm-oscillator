# Sky130nm-Oscillator
A seven stage ring oscillator created by hand on the skywater-130nm open-source process design kit. The circuit consists of six inverters, one 2-input nand gate and one 2:1 multiplexer. All the gates were utilised from the pre-made library of skywater-130nm pdk. 

# Schematic
The inverters are connected back to back to provide the oscillation. The nand gate has an external port "EN" which needs to be asserted in order for the oscillator to work. The multiplexer provides dual variable frequency as it selects from either the second stage or the last stage depending upon what "SEL" is set to.

![schematic image](images/osc_schematic.png?raw=true "Oscillator Schematic")

# Layout
The standard cells are placed and routed in a way to save area. This means instead of abutting all inverters adjacent to each other, some are abutted vertically. 

## Top view
The design uses metal1 for power and ground rails. Routing for the cells is done with metal1 and metal2.

![top view](images/osc_top.png?raw=true "Oscillator Layout Top")

## Detailed view

![detail view](images/osc_detailed.png?raw=true "Oscillator Layout Detail")

# Digital Simulation

The digital simulation for the oscillator is done using [IRSIM](http://opencircuitdesign.com/irsim/). 

![irsim](images/osc_irsim.png?raw=true "IRSIM Simulation")

The repository has all the files to re-run the above simulation. To simulate the oscillator:
```bash
irsim sky130A_1v80_27.prm OSC.sim -@ OSC.cmd
```
To manually provide the stimuli to the oscillator edit the `OSC.cmd` file.

# Analog Simulation

For analog simulation [ngspice](http://ngspice.sourceforge.net/) is used. There are two types characterization:
1. Characterization of oscillator spice written by hand 
2. Characterization of oscillator spice extracted from the layout

For (1), the stimuli spice file `OSC_ideal.sp` provides stimulus to the hand written spice file of the oscillator `OSC.spc`.

For (2), the stimuli spice file `OSC_extracted.sp` provides stimulus to the extracted spice file of the oscillator `OSC.spice`.




