# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/store/remove
# global value
#
# INPUT  macroengine:store in.name
# OUTPUT none
# RETURN 1 on success, 0 on invalid name / missing input / not a player.
#
# Plain strings in, plain strings out. Nothing here ever builds a text component.
# Names are checked with systems/validate/safe_name while they are still data in storage,
# before they reach a macro line (see api/perm/require for the same pattern).
execute if data storage macroengine:engine modules{store:0b} run return 0
data remove storage macroengine:store tmp
execute unless function macroengine:core/internal/api/store/_name run return 0
return run function macroengine:core/internal/api/store/_g_remove with storage macroengine:store tmp.k
