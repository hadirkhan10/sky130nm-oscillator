* spice written by hand

* .include ~/repos/sky130A/libs.ref/sky130_fd_sc_hd/sky130_fd_sc_hd.spice

.subckt sky130_fd_sc_hd__inv_1 A VGND VNB VPB VPWR Y
X0 VGND A Y VNB sky130_fd_pr__nfet_01v8 w=650000u l=150000u
X1 VPWR A Y VPB sky130_fd_pr__pfet_01v8_hvt w=1e+06u l=150000u
.ends

.subckt sky130_fd_sc_hd__nand2_1 A B VGND VNB VPB VPWR Y
X0 Y A VPWR VPB sky130_fd_pr__pfet_01v8_hvt w=1e+06u l=150000u
X1 VPWR B Y VPB sky130_fd_pr__pfet_01v8_hvt w=1e+06u l=150000u
X2 VGND B a_113_47# VNB sky130_fd_pr__nfet_01v8 w=650000u l=150000u
X3 a_113_47# A Y VNB sky130_fd_pr__nfet_01v8 w=650000u l=150000u
.ends

.subckt sky130_fd_sc_hd__mux2_1 A0 A1 S VGND VNB VPB VPWR X
X0 VPWR S a_218_374# VPB sky130_fd_pr__pfet_01v8_hvt w=420000u l=150000u
X1 a_76_199# A0 a_439_47# VNB sky130_fd_pr__nfet_01v8 w=420000u l=150000u
X2 a_535_374# a_505_21# VPWR VPB sky130_fd_pr__pfet_01v8_hvt w=420000u l=150000u
X3 VPWR S a_505_21# VPB sky130_fd_pr__pfet_01v8_hvt w=420000u l=150000u
X4 a_76_199# A1 a_535_374# VPB sky130_fd_pr__pfet_01v8_hvt w=420000u l=150000u
X5 a_218_47# A1 a_76_199# VNB sky130_fd_pr__nfet_01v8 w=420000u l=150000u
X6 a_218_374# A0 a_76_199# VPB sky130_fd_pr__pfet_01v8_hvt w=420000u l=150000u
X7 X a_76_199# VGND VNB sky130_fd_pr__nfet_01v8 w=650000u l=150000u
X8 X a_76_199# VPWR VPB sky130_fd_pr__pfet_01v8_hvt w=1e+06u l=150000u
X9 VGND S a_218_47# VNB sky130_fd_pr__nfet_01v8 w=420000u l=150000u
X10 VGND S a_505_21# VNB sky130_fd_pr__nfet_01v8 w=420000u l=150000u
X11 a_439_47# a_505_21# VGND VNB sky130_fd_pr__nfet_01v8 w=420000u l=150000u
.ends

.subckt OSC EN SEL VPWR VGND OUT
Xnand EN Z VGND VGND VPWR VPWR A sky130_fd_sc_hd__nand2_1 
Xinv0 A VGND VGND VPWR VPWR OUT sky130_fd_sc_hd__inv_1 
Xinv1 OUT VGND VGND VPWR VPWR B sky130_fd_sc_hd__inv_1 
Xinv2 B VGND VGND VPWR VPWR D sky130_fd_sc_hd__inv_1 
Xinv3 D VGND VGND VPWR VPWR E sky130_fd_sc_hd__inv_1 
Xinv4 E VGND VGND VPWR VPWR F sky130_fd_sc_hd__inv_1 
Xinv5 F VGND VGND VPWR VPWR G sky130_fd_sc_hd__inv_1 

Xmux B G SEL VGND VGND VPWR VPWR Z sky130_fd_sc_hd__mux2_1
.ends
