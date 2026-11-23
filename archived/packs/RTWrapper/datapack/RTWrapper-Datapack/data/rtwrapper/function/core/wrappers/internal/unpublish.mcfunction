# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
# RTWrapper generated named-parameter dispatcher for /unpublish.
# Provide contiguous parameters in this order:
# (none)
scoreboard players set #pc rtw.status 0
execute if score #pc rtw.status matches 0 run function rtwrapper:core/wrappers/internal/variants/unpublish_0
