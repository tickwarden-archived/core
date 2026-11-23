# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/math/vec/angle_between
# Returns the angle between two vectors in degrees.
# cos(θ) = dot(A,B) / (|A| × |B|) → θ = arccos(...)
# Uses ×1000 fixed-point cos table for arccos.
#
# INPUT: ax, ay, az, bx, by, bz
# OUTPUT: vortex:output result (0–180, integer degrees)
# result=0 for zero vectors.
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{math:0b} run return 0
function vortex:core/internal/systems/math/vec/angle_exec with storage vortex:input {}
