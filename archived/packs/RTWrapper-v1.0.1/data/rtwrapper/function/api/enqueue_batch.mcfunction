# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
execute unless data storage rtwrapper:api batch[0] run return 0

scoreboard players operation #batch_id rtw.status = #processed rtw.status

function rtwrapper:api/enqueue_batch_step

data remove storage rtwrapper:api batch
