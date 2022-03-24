* spice stimuli written for characterizing hand written schemtic of OSC

* include the MOSFET models with TT proccess 
.lib "~/repos/sky130A/libs.tech/ngspice/sky130.lib.spice" tt

.include 'OSC.spc'

.param supply_voltage=1.8V

* set the operating temperature
.option temp=27

Xosc en sel vdd 0 out OSC

Vdd vdd 0 supply_voltage

VSWE en 0 PULSE (0V supply_voltage 500ps 5ps 5ps 2000ps 4000ps) DC 0V
VSWS sel 0 PULSE (0V supply_voltage 500ps 5ps 5ps 4000ps 6000ps) DC 0V

.DC VSWE 0 'supply_voltage' 0.1
.DC VSWS 0 'supply_voltage' 0.1

.tran 1ps 4ns

.param half_supply = '0.5*supply_voltage'


.meas tran osc_period trig v(out) val=half_supply rise=1 targ v(out) val=half_supply rise=2

.meas tran stage_delay trig v(Xosc.B) val=half_supply rise=1 targ v(Xosc.D) val=half_supply fall=1

.control
run
plot en sel out
.endc

.END
