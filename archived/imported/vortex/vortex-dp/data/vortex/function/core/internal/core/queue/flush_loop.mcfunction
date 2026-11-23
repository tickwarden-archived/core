# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/core/queue/flush_loop
# Drains the entire work_queue in one call stack (used by queue/flush).
# Recursion depth = queue size — do NOT call on large queues.

execute unless data storage vortex:engine work_queue[0] run return 0
function vortex:core/internal/core/queue/exec_next
function vortex:core/internal/core/queue/flush_loop
