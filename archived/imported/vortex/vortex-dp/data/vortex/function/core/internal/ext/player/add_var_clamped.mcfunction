# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:core/internal/ext/player/add_var_clamped [MACRO] [INTERNAL]
# $(player), $(key) validated; #ext_pv_d / _min / _max prepared by player/var/add_clamped.
# ======================================================================================

scoreboard players set #ext_pv vortex.tmp 0
$execute if data storage vortex:engine players.$(player).$(key) store result score #ext_pv vortex.tmp run data get storage vortex:engine players.$(player).$(key)

# Clamp the current value first, so value + delta can never leave the +-2e9 range.
execute if score #ext_pv vortex.tmp < #ext_pv_min vortex.tmp run scoreboard players operation #ext_pv vortex.tmp = #ext_pv_min vortex.tmp
execute if score #ext_pv vortex.tmp > #ext_pv_max vortex.tmp run scoreboard players operation #ext_pv vortex.tmp = #ext_pv_max vortex.tmp
scoreboard players operation #ext_pv vortex.tmp += #ext_pv_d vortex.tmp
execute if score #ext_pv vortex.tmp < #ext_pv_min vortex.tmp run scoreboard players operation #ext_pv vortex.tmp = #ext_pv_min vortex.tmp
execute if score #ext_pv vortex.tmp > #ext_pv_max vortex.tmp run scoreboard players operation #ext_pv vortex.tmp = #ext_pv_max vortex.tmp

$execute store result storage vortex:engine players.$(player).$(key) int 1 run scoreboard players get #ext_pv vortex.tmp
execute store result storage vortex:output result int 1 run scoreboard players get #ext_pv vortex.tmp
