# ─────────────────────────────────────────────────────────────────
# vortex:systems/math/vec/add
# Adds two 3D vectors.
#
# INPUT: ax, ay, az, bx, by, bz
# OUTPUT: vortex:output {x, y, z}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{math:0b} run return 0
function vortex:core/internal/systems/math/vec/add_exec with storage vortex:input {}
