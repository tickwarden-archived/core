# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:world/time/phase
# not exist on 1.21.8. The ranges below (0..23999) need ticks-into-day, i.e.
# the older `daytime` argument.
execute store result score $tp_t vortex.tmp run time query daytime
execute store result storage vortex:output daytime int 1 run scoreboard players get $tp_t vortex.tmp
data modify storage vortex:output is_day set value 0b
data modify storage vortex:output is_night set value 0b
data modify storage vortex:output is_dawn set value 0b
data modify storage vortex:output is_dusk set value 0b
execute if score $tp_t vortex.tmp matches 0..12999 run data modify storage vortex:output is_day set value 1b
execute if score $tp_t vortex.tmp matches 13000..23999 run data modify storage vortex:output is_night set value 1b
execute if score $tp_t vortex.tmp matches 0..999 run data modify storage vortex:output is_dawn set value 1b
execute if score $tp_t vortex.tmp matches 12000..13799 run data modify storage vortex:output is_dusk set value 1b
execute if score $tp_t vortex.tmp matches 0..999 run data modify storage vortex:output phase set value "dawn"
execute if score $tp_t vortex.tmp matches 1000..11999 run data modify storage vortex:output phase set value "day"
execute if score $tp_t vortex.tmp matches 12000..13799 run data modify storage vortex:output phase set value "dusk"
execute if score $tp_t vortex.tmp matches 13800..23999 run data modify storage vortex:output phase set value "night"
