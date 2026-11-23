# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# w.cycle.score, w.cycle.options[{item,name,...}], w.cycle.wrap
data modify storage guikit:work key set from storage guikit:draw w.cycle.score
execute unless data storage guikit:work key run data modify storage guikit:work key set from storage guikit:draw w.key
execute if data storage guikit:work key run function guikit:widget/cycle_pick with storage guikit:work
function guikit:widget/_place
