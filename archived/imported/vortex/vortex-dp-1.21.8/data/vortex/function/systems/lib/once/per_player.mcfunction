# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/lib/once/per_player
# Runs the function once per player for the given key.
# Will not run again until the session is reset.
#  Input : $(func)   → function to run
#           $(key)    → unique key (e.g. "tutorial_intro")
#           $(player) → player name
# Output: vortex:output ran → 1b (ran) / 0b (already done)
# ─────────────────────────────────────────────────────────────────

data modify storage vortex:output ran set value 0b

$execute if data storage vortex:engine once_per_player.$(player).$(key) run return 0

data modify storage vortex:output ran set value 1b
$data modify storage vortex:engine once_per_player.$(player).$(key) set value 1b

$data modify storage vortex:engine _dispatch.func set value "$(func)"
function #vortex:internal/dispatch
