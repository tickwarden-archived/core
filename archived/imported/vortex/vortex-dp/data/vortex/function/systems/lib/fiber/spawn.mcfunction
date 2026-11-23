# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/lib/fiber/spawn
# Starts a new fiber and immediately runs its first step.
# If spawned with the same id, the existing fiber is replaced.
#
# INPUT (storage vortex:input):
# id → fiber id (unique string)
# func → function name to start
#
# EXAMPLE:
# data modify storage vortex:input id set value "boss_intro"
# data modify storage vortex:input func set value "mypack:boss/step_0"
# function vortex:systems/lib/fiber/spawn
# ─────────────────────────────────────────────────────────────────

function vortex:core/internal/core/lib/fiber/spawn_exec with storage vortex:input {}
