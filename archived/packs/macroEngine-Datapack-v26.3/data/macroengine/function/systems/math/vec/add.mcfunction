# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:systems/math/vec/add
# Adds two 3D vectors.
#
# INPUT: ax, ay, az, bx, by, bz
# OUTPUT: macroengine:output {x, y, z}
# ─────────────────────────────────────────────────────────────────

execute if data storage macroengine:engine modules{math:0b} run return 0
function macroengine:core/internal/systems/math/vec/add_exec with storage macroengine:input {}
