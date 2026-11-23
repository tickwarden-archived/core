# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/math/vec/dot
# Computes the dot product of two vectors. (ax*bx + ay*by + az*bz)
# Result is integer — no fractions. May overflow for large vectors.
#
# INPUT: ax, ay, az, bx, by, bz
# OUTPUT: vortex:output result (int)
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{math:0b} run return 0
function vortex:core/internal/systems/math/vec/dot_exec with storage vortex:engine _vec_dot_tmp
