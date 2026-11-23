# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/cb/reset
# Scheduled 2t after exec — cleans up the temporary command block.
# Reads coordinates from transient cb_slot storage so reset targets
# the correct location even if run() was called again in the meantime.

function vortex:core/internal/api/cb/reset_exec with storage vortex:engine _cb_last
