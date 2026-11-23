# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/cooldown/resume
# Resumes a previously paused cooldown.
# Params: player, key
# Output: vortex:output result (new expiry epoch tick), 0b if not paused

data modify storage vortex:output result set value 0b

$execute unless data storage vortex:engine paused_cooldowns.$(player).$(key) run return 0

# Reconstruct expiry: now + saved remaining ticks
$execute store result score $cdr_rem vortex.tmp run data get storage vortex:engine paused_cooldowns.$(player).$(key)
execute store result score $cdr_now vortex.tmp run scoreboard players get $epoch vortex.time
scoreboard players operation $cdr_now vortex.tmp += $cdr_rem vortex.tmp

# Write back to live cooldowns, remove from paused
$execute store result storage vortex:engine cooldowns.$(player).$(key) int 1 run scoreboard players get $cdr_now vortex.tmp
$data remove storage vortex:engine paused_cooldowns.$(player).$(key)
execute store result storage vortex:output result int 1 run scoreboard players get $cdr_now vortex.tmp
