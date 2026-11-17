# ─────────────────────────────────────────────────────────────────
# vortex:systems/math/vec/sub
# Subtracts vector B from vector A. (A - B)
#
# INPUT: ax, ay, az, bx, by, bz
# OUTPUT: vortex:output {x, y, z}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{math:0b} run return 0
function vortex:core/internal/systems/math/vec/sub_exec with storage vortex:input {}
