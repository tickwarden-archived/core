# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/join_take [INTERNAL] joins the next 16 entries of pc into one entry of nl
data modify storage vortex:text jarg set value {p0:"",p1:"",p2:"",p3:"",p4:"",p5:"",p6:"",p7:"",p8:"",p9:"",p10:"",p11:"",p12:"",p13:"",p14:"",p15:""}
execute if data storage vortex:text pc[0] run data modify storage vortex:text jarg.p0 set from storage vortex:text pc[0]
data remove storage vortex:text pc[0]
execute if data storage vortex:text pc[0] run data modify storage vortex:text jarg.p1 set from storage vortex:text pc[0]
data remove storage vortex:text pc[0]
execute if data storage vortex:text pc[0] run data modify storage vortex:text jarg.p2 set from storage vortex:text pc[0]
data remove storage vortex:text pc[0]
execute if data storage vortex:text pc[0] run data modify storage vortex:text jarg.p3 set from storage vortex:text pc[0]
data remove storage vortex:text pc[0]
execute if data storage vortex:text pc[0] run data modify storage vortex:text jarg.p4 set from storage vortex:text pc[0]
data remove storage vortex:text pc[0]
execute if data storage vortex:text pc[0] run data modify storage vortex:text jarg.p5 set from storage vortex:text pc[0]
data remove storage vortex:text pc[0]
execute if data storage vortex:text pc[0] run data modify storage vortex:text jarg.p6 set from storage vortex:text pc[0]
data remove storage vortex:text pc[0]
execute if data storage vortex:text pc[0] run data modify storage vortex:text jarg.p7 set from storage vortex:text pc[0]
data remove storage vortex:text pc[0]
execute if data storage vortex:text pc[0] run data modify storage vortex:text jarg.p8 set from storage vortex:text pc[0]
data remove storage vortex:text pc[0]
execute if data storage vortex:text pc[0] run data modify storage vortex:text jarg.p9 set from storage vortex:text pc[0]
data remove storage vortex:text pc[0]
execute if data storage vortex:text pc[0] run data modify storage vortex:text jarg.p10 set from storage vortex:text pc[0]
data remove storage vortex:text pc[0]
execute if data storage vortex:text pc[0] run data modify storage vortex:text jarg.p11 set from storage vortex:text pc[0]
data remove storage vortex:text pc[0]
execute if data storage vortex:text pc[0] run data modify storage vortex:text jarg.p12 set from storage vortex:text pc[0]
data remove storage vortex:text pc[0]
execute if data storage vortex:text pc[0] run data modify storage vortex:text jarg.p13 set from storage vortex:text pc[0]
data remove storage vortex:text pc[0]
execute if data storage vortex:text pc[0] run data modify storage vortex:text jarg.p14 set from storage vortex:text pc[0]
data remove storage vortex:text pc[0]
execute if data storage vortex:text pc[0] run data modify storage vortex:text jarg.p15 set from storage vortex:text pc[0]
data remove storage vortex:text pc[0]
function vortex:core/internal/text/_join16 with storage vortex:text jarg
data modify storage vortex:text nl append from storage vortex:text jout
execute if data storage vortex:text pc[0] run function vortex:core/internal/text/join_take
