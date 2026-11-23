# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/store/_step_name [INTERNAL]
# The head follows an opening '%'. It is a token only when a closing '%' exists, i.e.
# another segment follows; otherwise "%" + head is kept as text.
scoreboard players set #st_mode vortex.tmp 0
execute unless data storage vortex:store tmp.segs[1] run data modify storage vortex:store tmp.frags append value "%"
execute unless data storage vortex:store tmp.segs[1] run return run function vortex:core/internal/api/store/_step_text
function vortex:core/internal/api/store/_resolve
data remove storage vortex:store tmp.segs[0]
