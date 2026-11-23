# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
# Process exactly one queued/direct action, then return. Queue takes priority
# over a direct rtwrapper:api request (see core/wrappers/handler/main). Called
# by core/tick.mcfunction under autotick, and once per action by run_actions.
function rtwrapper:core/wrappers/handler/main
