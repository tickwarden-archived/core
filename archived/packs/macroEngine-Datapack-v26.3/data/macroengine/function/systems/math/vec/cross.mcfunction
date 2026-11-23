# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:systems/math/vec/cross
# Computes the cross product of two vectors.
# cx = ay*bz - az*by
# cy = az*bx - ax*bz
# cz = ax*by - ay*bx
#
# INPUT: ax, ay, az, bx, by, bz
# OUTPUT: macroengine:output {x, y, z}
# ─────────────────────────────────────────────────────────────────

execute if data storage macroengine:engine modules{math:0b} run return 0
function macroengine:core/internal/systems/math/vec/cross_exec with storage macroengine:input {}
