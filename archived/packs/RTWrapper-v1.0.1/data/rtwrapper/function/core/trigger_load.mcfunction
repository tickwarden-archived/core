# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# RTWrapper trigger-module bootstrap. Idempotent - safe to call every /reload.
scoreboard objectives add rtw.status dummy
execute unless data storage rtwrapper:triggers registry run data modify storage rtwrapper:triggers registry set value []
