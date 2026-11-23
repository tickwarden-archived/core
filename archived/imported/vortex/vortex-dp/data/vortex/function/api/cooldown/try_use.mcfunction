# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:api/cooldown/try_use
# Atomic 'is it ready? then start it' for a cooldown. check + set in one call, so two
# callers in the same tick cannot both pass.
#
# INPUT  (storage vortex:input cd):
#   player    the player name
#   key       the cooldown key
#   duration  ticks, >= 1 (clamped to 1..1000000000). Must be a real NBT number:
#             a string would be read as its length.
# OUTPUT vortex:output result: 1b = was ready and is now armed, 0b = still active/invalid
# RETURN 1 when armed, 0 otherwise.
#
# Uses the same storage as core/cooldown/set|check|remaining|clear, so all of them keep
# working on a cooldown started here. A denied call never extends the cooldown.
# player and key are checked with systems/validate/safe_name before any macro line.
#
# Usage:
#   data modify storage vortex:input cd set value {player:"Steve",key:"dash",duration:100}
#   execute if function vortex:api/cooldown/try_use run say go
# ======================================================================================

data modify storage vortex:output result set value 0b
execute unless data storage vortex:input cd.player run return 0
execute unless data storage vortex:input cd.key run return 0
execute unless data storage vortex:input cd.duration run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:input cd.player
execute unless function vortex:systems/validate/safe_name run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:input cd.key
execute unless function vortex:systems/validate/safe_name run return 0

execute store result score #ext_cd_dur vortex.tmp run data get storage vortex:input cd.duration
execute if score #ext_cd_dur vortex.tmp matches ..0 run scoreboard players set #ext_cd_dur vortex.tmp 1
execute if score #ext_cd_dur vortex.tmp matches 1000000001.. run scoreboard players set #ext_cd_dur vortex.tmp 1000000000
execute store result score #ext_cd_now vortex.tmp run scoreboard players get $epoch vortex.time
scoreboard players operation #ext_cd_new vortex.tmp = #ext_cd_now vortex.tmp
scoreboard players operation #ext_cd_new vortex.tmp += #ext_cd_dur vortex.tmp
return run function vortex:core/internal/ext/cooldown/try_use with storage vortex:input cd
