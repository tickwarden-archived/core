# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# Processes exactly one action: queued request first, otherwise one direct api request.
execute if score #debug rtw.config matches 1.. if score #silent rtw.config matches 0 run tellraw @a[tag=rtwrapper.debug] [{"text":"[RTWrapper] run_next","color":"gold"}]
function rtwrapper:core/wrappers/handler/main
