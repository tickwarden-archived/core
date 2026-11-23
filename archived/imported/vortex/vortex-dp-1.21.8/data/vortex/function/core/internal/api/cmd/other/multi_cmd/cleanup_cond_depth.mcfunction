# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/api/cmd/other/multi_cmd/cleanup_cond_depth
# Removes the depth-indexed temporaries created by all_of / any_of / not.
# The evaluators allow depths 0..8 (see cond_depth_error), so the unrolled
# list below covers every key they can create.
# ─────────────────────────────────────────────────────────────────

function vortex:core/internal/api/cmd/other/multi_cmd/cleanup_cond_depth_one {d:0}
function vortex:core/internal/api/cmd/other/multi_cmd/cleanup_cond_depth_one {d:1}
function vortex:core/internal/api/cmd/other/multi_cmd/cleanup_cond_depth_one {d:2}
function vortex:core/internal/api/cmd/other/multi_cmd/cleanup_cond_depth_one {d:3}
function vortex:core/internal/api/cmd/other/multi_cmd/cleanup_cond_depth_one {d:4}
function vortex:core/internal/api/cmd/other/multi_cmd/cleanup_cond_depth_one {d:5}
function vortex:core/internal/api/cmd/other/multi_cmd/cleanup_cond_depth_one {d:6}
function vortex:core/internal/api/cmd/other/multi_cmd/cleanup_cond_depth_one {d:7}
function vortex:core/internal/api/cmd/other/multi_cmd/cleanup_cond_depth_one {d:8}
