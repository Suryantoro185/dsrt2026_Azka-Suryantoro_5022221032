v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -180 -80 -180 -40 {lab=#net1}
N -0 -20 0 20 {lab=out}
N -40 -50 -40 50 {lab=in}
N -0 -100 -0 -80 {lab=#net1}
N -180 -100 -0 -100 {lab=#net1}
N -180 -100 -180 -80 {lab=#net1}
N -90 -0 -40 -0 {lab=in}
N 0 0 80 -0 {lab=out}
N -180 20 -180 80 {lab=gnd}
N -180 80 -0 80 {lab=gnd}
N -90 60 -90 80 {lab=gnd}
N -140 80 -140 100 {lab=gnd}
C {sky130_fd_pr/nfet3_01v8.sym} -20 50 0 0 {name=M1
W=2
L=0.15
body=GND
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} -20 -50 0 0 {name=M2
W=6
L=0.15
body=VDD
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {vsource.sym} -180 -10 0 0 {name=V1 value=1.8 savecurrent=false}
C {vsource.sym} -90 30 0 0 {name=V2 value=0 savecurrent=false}
C {lab_pin.sym} -90 0 0 0 {name=p1 sig_type=std_logic lab=in}
C {lab_pin.sym} 80 0 0 1 {name=p2 sig_type=std_logic lab=out}
C {code.sym} 10 120 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
.param mc_mm_switch=0
.param mc_pr_switch=1
"}
C {gnd.sym} -140 100 0 0 {name=l1 lab=gnd}
C {code_shown.sym} 120 -100 0 0 {name=spice only_toplevel=false value="
.option wnflag=0
.option savecurrents
.control
save all
dc v2 0 1.8 0.01
plot in out
op
.endc
"}
