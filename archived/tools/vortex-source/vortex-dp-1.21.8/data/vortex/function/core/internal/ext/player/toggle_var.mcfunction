# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:core/internal/ext/player/toggle_var [MACRO] [INTERNAL]
# $(player), $(key) validated by player/var/toggle.
# ======================================================================================

scoreboard players set #ext_tv vortex.tmp 0
$execute if data storage vortex:engine players.$(player).$(key) store result score #ext_tv vortex.tmp run data get storage vortex:engine players.$(player).$(key)
execute if score #ext_tv vortex.tmp matches 0 run data modify storage vortex:output result set value 1b
execute unless score #ext_tv vortex.tmp matches 0 run data modify storage vortex:output result set value 0b
$data modify storage vortex:engine players.$(player).$(key) set from storage vortex:output result
return run data get storage vortex:output result
