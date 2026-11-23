# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# Consume one queued/direct action only.
execute if data storage rtwrapper:api request.cmd run function rtwrapper:api/enqueue
execute unless data storage rtwrapper:api request.cmd if data storage rtwrapper:api request.type run function rtwrapper:api/enqueue
function rtwrapper:core/run/run_next
