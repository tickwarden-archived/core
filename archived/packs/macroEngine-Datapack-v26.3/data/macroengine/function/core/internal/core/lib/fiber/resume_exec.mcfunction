# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/lib/fiber/internal/resume_exec [MACRO]
# INPUT: $(id), $(func)
# Fed from _fib_cur.

# Is the fiber still alive?
$execute unless data storage macroengine:engine fibers.$(id){alive:1b} run return 0

# Run via central dispatch
$data modify storage macroengine:engine _dispatch.func set value "$(func)"
function #macroengine:internal/dispatch
