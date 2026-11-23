# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/lib/fiber/internal/kill_exec [MACRO]
# INPUT: $(id)

$execute unless data storage macroengine:engine fibers.$(id) run return 0

$data remove storage macroengine:engine fibers.$(id).alive
$data remove storage macroengine:engine fibers.$(id).resume
