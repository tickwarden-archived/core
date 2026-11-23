# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ======================================================================================
# macroengine:core/internal/ext/input/int_to_score [MACRO] [INTERNAL]
# $(s) is a string that already passed input/validate/check (optional '-', digits only)
# and is at most 9 characters long, so the score command cannot fail or overflow.
# ======================================================================================

$scoreboard players set #ext_ir_val macroengine.tmp $(s)
