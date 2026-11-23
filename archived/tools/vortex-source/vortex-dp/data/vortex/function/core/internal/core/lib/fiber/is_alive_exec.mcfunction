# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/fiber/is_alive_exec [MACRO]
# INPUT: $(id)

data modify storage vortex:output result set value 0b
$execute if data storage vortex:engine fibers.$(id){alive:1b} run data modify storage vortex:output result set value 1b
