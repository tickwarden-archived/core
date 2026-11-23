# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/log/add (internal)
# Called by error/warn/info/debug — do not call directly.
# Appends to the 30-entry ring buffer in vortex:engine log_display.
execute if data storage vortex:engine modules{log:0b} run return 0
execute unless data storage vortex:engine log_display run data modify storage vortex:engine log_display set value []

$data modify storage vortex:engine log_display append value {text:"[$(level)] $(message)",color:"$(color)"}

scoreboard players add #vortex.log_count vortex.tmp 1
execute if score #vortex.log_count vortex.tmp matches 31.. run data remove storage vortex:engine log_display[0]
execute if score #vortex.log_count vortex.tmp matches 31.. run scoreboard players remove #vortex.log_count vortex.tmp 1
