# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:core/internal/api/cmd/other/multi_cmd/exec_object_skipped
# The entry's condition did not pass, so nothing ran.
#
# This must ALWAYS execute at least one command. The previous version
# gated its only line on _mcmd_options.profile:1b, which made the whole
# function a no-op at the default profile:0b — and that no-op is what
# let the old `return run` gate fall through and run the command anyway.
# The counter is cheap and unconditional so the function is never empty.
# ─────────────────────────────────────────────────────────────────

scoreboard players add $mcmd_skipped macroengine.tmp 1
