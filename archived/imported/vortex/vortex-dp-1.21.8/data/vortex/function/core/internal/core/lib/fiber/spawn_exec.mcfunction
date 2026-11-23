# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/fiber/spawn_exec [MACRO]
# INPUT: $(id), $(func)

# Delete if same id exists
$data remove storage vortex:engine fibers.$(id)

# Create fiber record
$data modify storage vortex:engine fibers.$(id) set value {alive:1b}

# Run first step via central dispatch
$data modify storage vortex:engine _dispatch.func set value "$(func)"
function #vortex:internal/dispatch
