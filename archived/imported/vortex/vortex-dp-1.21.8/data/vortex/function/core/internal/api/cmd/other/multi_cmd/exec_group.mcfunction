# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/api/cmd/other/multi_cmd/exec_group
# Expands a nested command group.
#
# _mcmd_current.commands is a list of queue entries (strings or objects,
# and groups themselves). Its items are spliced onto the FRONT of the
# active queue, so they run next and in order, ahead of whatever was
# already queued — depth-first, exactly as if the group had been written
# out inline.
#
# Splicing rather than recursing keeps one queue and one step loop, so
# nesting depth is bounded by the queue length and not by the function
# call stack.
#
# A group may carry its own `condition`: it is evaluated by exec_object
# before this runs, so a failing condition skips the whole group.
# ─────────────────────────────────────────────────────────────────

execute unless data storage vortex:engine _mcmd_current.commands[0] run return 0

# newq  = the group's own items
# oldq  = whatever is still queued behind us
data modify storage vortex:engine _mcmd_newq set from storage vortex:engine _mcmd_current.commands
data modify storage vortex:engine _mcmd_oldq set value []
execute if data storage vortex:engine _mcmd_queue[0] run data modify storage vortex:engine _mcmd_oldq set from storage vortex:engine _mcmd_queue

function vortex:core/internal/api/cmd/other/multi_cmd/exec_group_splice_rest

data modify storage vortex:engine _mcmd_queue set from storage vortex:engine _mcmd_newq
data remove storage vortex:engine _mcmd_newq
data remove storage vortex:engine _mcmd_oldq
