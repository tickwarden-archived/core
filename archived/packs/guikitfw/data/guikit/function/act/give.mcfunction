# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
data remove storage guikit:work item
data remove storage guikit:work count
data modify storage guikit:work item set from storage guikit:act w.give
execute unless data storage guikit:work item run data modify storage guikit:work item set from storage guikit:act w.item
execute store result storage guikit:work count int 1 run data get storage guikit:act w.count
execute unless data storage guikit:work count run data modify storage guikit:work count set value 1
execute unless data storage guikit:work item run return 0
function guikit:act/_give_do with storage guikit:work
