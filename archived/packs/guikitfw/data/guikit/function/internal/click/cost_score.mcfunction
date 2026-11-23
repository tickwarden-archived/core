# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
data modify storage guikit:work cscore set from storage guikit:work costs[0].score
execute store result score #need guikit.tmp run data get storage guikit:work costs[0].amount
function guikit:internal/click/cost_score_do with storage guikit:work
