# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
scoreboard players set #cost_fail guikit.tmp 0
data modify storage guikit:work costs set from storage guikit:act w.costs
function guikit:internal/click/cost_loop
