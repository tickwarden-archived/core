# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/batch/add_exec [MACRO]
# INPUT: $(id)
# func or cmd field existence is checked outside the macro,
# then the relevant append_func / append_cmd is called — prevents undefined $(func/cmd).

$execute unless data storage vortex:engine batches.$(id) run return 0

execute if data storage vortex:input func run function vortex:core/internal/core/lib/batch/add_func with storage vortex:input
execute if data storage vortex:input cmd run function vortex:core/internal/core/lib/batch/add_cmd with storage vortex:input
