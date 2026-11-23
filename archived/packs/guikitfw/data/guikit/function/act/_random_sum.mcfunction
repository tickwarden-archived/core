# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
execute unless data storage guikit:work rewards[0] run return 0
execute store result score #w guikit.tmp run data get storage guikit:work rewards[0].weight
execute unless score #w guikit.tmp matches 1.. run scoreboard players set #w guikit.tmp 1
scoreboard players operation #sum guikit.tmp += #w guikit.tmp
data remove storage guikit:work rewards[0]
function guikit:act/_random_sum
