# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroEngine player module — resolve (load step 2 of 3).
# The module ships in exactly one flavour per pack, so there is nothing to
# gate on: resolving the player module means initializing it directly.

function macroengine:core/internal/player/init
