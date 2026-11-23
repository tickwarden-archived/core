# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/api/cmd/other/multi_cmd/exec_group_splice_rest
# Appends the entries still queued behind the group, one at a time, to
# the new queue. `data modify ... append from` would push the whole list
# as a single element, so the items have to be moved individually.
# ─────────────────────────────────────────────────────────────────

execute unless data storage vortex:engine _mcmd_oldq[0] run return 0

data modify storage vortex:engine _mcmd_newq append from storage vortex:engine _mcmd_oldq[0]
data remove storage vortex:engine _mcmd_oldq[0]

function vortex:core/internal/api/cmd/other/multi_cmd/exec_group_splice_rest
