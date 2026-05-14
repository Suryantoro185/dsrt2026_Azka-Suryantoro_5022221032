v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -200 -100 -200 -50 {lab=#net1}
N -200 -100 40 -100 {lab=#net1}
N 40 -100 40 -80 {lab=#net1}
N 40 -20 40 20 {lab=out}
N -0 -50 0 50 {lab=in}
N -100 0 -100 20 {lab=in}
N -100 0 -0 -0 {lab=in}
N -200 10 -200 100 {lab=gnd}
N -200 100 40 100 {lab=gnd}
N 40 80 40 100 {lab=gnd}
N -100 80 -100 100 {lab=gnd}
N -130 100 -130 110 {lab=gnd}
N 40 0 120 0 {lab=out}
N 40 -50 50 -50 {lab=#net1}
N 50 -80 50 -50 {lab=#net1}
N 40 -80 50 -80 {lab=#net1}
C {sky130_fd_pr/nfet3_01v8.sym} 20 50 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8.sym} 20 -50 0 0 {name=M2
W=6
L=0.15
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
C {vsource.sym} -200 -20 0 0 {name=V1 value=1.8 savecurrent=false}
C {vsource.sym} -100 50 0 0 {name=V2
value="PULSE(0 1.8 0 100p 100p 5n 10n)"
savecurrent=false}
C {gnd.sym} -130 110 0 0 {name=l1 lab=gnd}
C {lab_pin.sym} -100 0 0 0 {name=p1 sig_type=std_logic lab=in}
C {lab_pin.sym} 120 0 0 1 {name=p2 sig_type=std_logic lab=out}
C {code.sym} 160 -110 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
.param mc_mm_switch=0
.param mc_pr_switch=1
"}
C {code_shown.sym} -550 -190 0 0 {name=test code only_toplevel=false value="
.option wnflag=0
.option savecurrents
.control
save all

dc v2 0 1.8 0.01
plot v(in) v(out)

tran 10p 50n
plot v(in) v(out)

op
.endc
"}
