# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/math/vec/cross
# Computes the cross product of two vectors.
# cx = ay*bz - az*by
# cy = az*bx - ax*bz
# cz = ax*by - ay*bx
#
# INPUT: ax, ay, az, bx, by, bz
# OUTPUT: vortex:output {x, y, z}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{math:0b} run return 0
function vortex:core/internal/systems/math/vec/cross_exec with storage vortex:input {}
