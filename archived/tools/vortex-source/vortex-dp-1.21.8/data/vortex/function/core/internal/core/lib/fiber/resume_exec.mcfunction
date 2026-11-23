# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/fiber/resume_exec [MACRO]
# INPUT: $(id), $(func)
# Fed from _fib_cur.

# Is the fiber still alive?
$execute unless data storage vortex:engine fibers.$(id){alive:1b} run return 0

# Run via central dispatch
$data modify storage vortex:engine _dispatch.func set value "$(func)"
function #vortex:internal/dispatch
