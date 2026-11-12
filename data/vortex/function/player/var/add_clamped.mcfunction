# ======================================================================================
# vortex:player/var/add_clamped
# Adds a delta to a player variable and clamps the result to [min, max] in one step
# (player/var/increment and player/var/clamp would need two calls and can overshoot between them).
# A missing variable counts as 0.
#
# INPUT  (storage vortex:input pvar):  player, key, delta, min, max
#   delta, min and max must be real NBT numbers (a string would be read as its length).
#   They are limited to +-1000000000, so the sum can never overflow a score.
#   min > max is rejected.
# OUTPUT vortex:output result (int): the new stored value
# RETURN 1 when applied, 0 when the input is invalid (nothing is changed).
#
# Same storage as player/var/get|set. player and key are checked with
# systems/validate/safe_name before any macro line.
#
# Usage:
#   data modify storage vortex:input pvar set value {player:"Steve",key:"coins",delta:-5,min:0,max:9999}
#   function vortex:player/var/add_clamped
# ======================================================================================

execute unless data storage vortex:input pvar.player run return 0
execute unless data storage vortex:input pvar.key run return 0
execute unless data storage vortex:input pvar.delta run return 0
execute unless data storage vortex:input pvar.min run return 0
execute unless data storage vortex:input pvar.max run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:input pvar.player
execute unless function vortex:systems/validate/safe_name run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:input pvar.key
execute unless function vortex:systems/validate/safe_name run return 0

execute store result score #ext_pv_d vortex.tmp run data get storage vortex:input pvar.delta
execute store result score #ext_pv_min vortex.tmp run data get storage vortex:input pvar.min
execute store result score #ext_pv_max vortex.tmp run data get storage vortex:input pvar.max
execute if score #ext_pv_min vortex.tmp > #ext_pv_max vortex.tmp run return 0
execute if score #ext_pv_d vortex.tmp matches 1000000001.. run scoreboard players set #ext_pv_d vortex.tmp 1000000000
execute if score #ext_pv_d vortex.tmp matches ..-1000000001 run scoreboard players set #ext_pv_d vortex.tmp -1000000000
execute if score #ext_pv_min vortex.tmp matches 1000000001.. run scoreboard players set #ext_pv_min vortex.tmp 1000000000
execute if score #ext_pv_min vortex.tmp matches ..-1000000001 run scoreboard players set #ext_pv_min vortex.tmp -1000000000
execute if score #ext_pv_max vortex.tmp matches 1000000001.. run scoreboard players set #ext_pv_max vortex.tmp 1000000000
execute if score #ext_pv_max vortex.tmp matches ..-1000000001 run scoreboard players set #ext_pv_max vortex.tmp -1000000000
function vortex:core/internal/ext/player/add_var_clamped with storage vortex:input pvar
return 1
