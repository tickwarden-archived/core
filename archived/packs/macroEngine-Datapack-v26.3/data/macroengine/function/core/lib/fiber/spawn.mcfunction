# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:core/lib/fiber/spawn
# Starts a new fiber and immediately runs its first step.
# If spawned with the same id, the existing fiber is replaced.
#
# INPUT (storage macroengine:input):
# id → fiber id (unique string)
# func → function name to start
#
# EXAMPLE:
# data modify storage macroengine:input id set value "boss_intro"
# data modify storage macroengine:input func set value "mypack:boss/step_0"
# function macroengine:core/lib/fiber/spawn
# ─────────────────────────────────────────────────────────────────

function macroengine:core/internal/core/lib/fiber/spawn_exec with storage macroengine:input {}
