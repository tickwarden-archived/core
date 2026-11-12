# vortex:core/cooldown/pause
# Pauses an active cooldown, saving the remaining ticks.
# Params: player, key
# Output: vortex:output result (remaining ticks saved), 0b if not active

data modify storage vortex:output result set value 0b

$execute unless data storage vortex:engine cooldowns.$(player).$(key) run return 0

# Calculate remaining ticks
$execute store result score $cdp_exp vortex.tmp run data get storage vortex:engine cooldowns.$(player).$(key)
execute store result score $cdp_now vortex.tmp run scoreboard players get $epoch vortex.time
scoreboard players operation $cdp_exp vortex.tmp -= $cdp_now vortex.tmp

# Only pause if actually still active
execute unless score $cdp_exp vortex.tmp matches 1.. run return 0

# Save remaining ticks to paused storage and clear the live cooldown
$execute store result storage vortex:engine paused_cooldowns.$(player).$(key) int 1 run scoreboard players get $cdp_exp vortex.tmp
$data remove storage vortex:engine cooldowns.$(player).$(key)
execute store result storage vortex:output result int 1 run scoreboard players get $cdp_exp vortex.tmp
