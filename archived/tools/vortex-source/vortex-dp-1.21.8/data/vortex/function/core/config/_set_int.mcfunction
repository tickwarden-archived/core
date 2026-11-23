# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/config/_set_int [MACRO, INTERNAL]  $(key) is a schema key; value is clamped to min..max
execute store result score #cfg_in vortex.tmp run data get storage vortex:engine config_in.value
execute store result score #cfg_min vortex.tmp run data get storage vortex:engine config_sc.min
execute store result score #cfg_max vortex.tmp run data get storage vortex:engine config_sc.max
execute if score #cfg_in vortex.tmp < #cfg_min vortex.tmp run scoreboard players operation #cfg_in vortex.tmp = #cfg_min vortex.tmp
execute if score #cfg_in vortex.tmp > #cfg_max vortex.tmp run scoreboard players operation #cfg_in vortex.tmp = #cfg_max vortex.tmp
$execute store result storage vortex:engine config.$(key) int 1 run scoreboard players get #cfg_in vortex.tmp
function vortex:core/config/apply
return 1
