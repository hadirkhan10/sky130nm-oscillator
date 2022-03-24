* spice stimuli written for characterizing extracted netlist of OSC layout

* include the MOSFET models with TT proccess 
.lib "~/repos/sky130A/libs.tech/ngspice/sky130.lib.spice" tt
*.lib "~/repos/sky130A/libs.tech/ngspice/sky130.lib.spice" ss
*.lib "~/repos/sky130A/libs.tech/ngspice/sky130.lib.spice" fs
*.lib "~/repos/sky130A/libs.tech/ngspice/sky130.lib.spice" ff

.include 'OSC.spice'

.param supply_voltage=1.8V
*.param supply_voltage=1V
*.param supply_voltage=1.4V
*.param supply_voltage=1.6V

* set the operating temperature
.option temp=27
*.option temp=1
*.option temp=40
*.option temp=75
*.option temp=100

Xosc en sel vdd 0 out OSC

Vdd vdd 0 supply_voltage

VSWE en 0 PULSE (0V supply_voltage 500ps 5ps 5ps 16000ps 16000ps) DC 0V
VSWS sel 0 PULSE (0V supply_voltage 500ps 5ps 5ps 16000ps 16000ps) DC 0V

.DC VSWE 0 'supply_voltage' 0.1
.DC VSWS 0 'supply_voltage' 0.1

.tran 1ps 16ns

.param half_supply = '0.5*supply_voltage'
.param slew_low = '0.1*supply_voltage'
.param slew_high = '0.9*supply_voltage'

.meas tran osc_period trig v(out) val=half_supply rise=1 targ v(out) val=half_supply rise=2

.meas tran stage_delay trig v(Xosc.sky130_fd_sc_hd__inv_1_4/A) val=half_supply rise=1 targ v(Xosc.sky130_fd_sc_hd__inv_1_5/A) val=half_supply fall=1

.meas tran nand_slew_rise trig v(Xosc.sky130_fd_sc_hd__inv_1_0/A) val=slew_low rise=1 targ v(Xosc.sky130_fd_sc_hd__inv_1_0/A) val=slew_high rise=1

.meas tran nand_slew_fall trig v(Xosc.sky130_fd_sc_hd__inv_1_0/A) val=slew_high fall=1 targ v(Xosc.sky130_fd_sc_hd__inv_1_0/A) val=slew_low fall=1

.control
run
plot en sel out
.endc

.END
