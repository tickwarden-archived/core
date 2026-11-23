# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/queue/internal/exec_as
# Runs a queued function as the named player (if online).
# If the player is offline the item is silently dropped — no retry.
#
# Macro input:
#   fn     — function path to call
#   player — player name used in selector

$data modify storage macroengine:engine _dispatch.func set value "$(fn)"
$execute as $(player) run function #macroengine:internal/dispatch
