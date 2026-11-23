# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/store/_g_add [MACRO] [INTERNAL]
# #st_by holds the amount; a missing value counts as 0.
scoreboard players set #st_v vortex.tmp 0
$execute store result score #st_v vortex.tmp run data get storage vortex:store g.$(name)
scoreboard players operation #st_v vortex.tmp += #st_by vortex.tmp
$execute store result storage vortex:store g.$(name) int 1 run scoreboard players get #st_v vortex.tmp
execute store result storage vortex:store out.value int 1 run scoreboard players get #st_v vortex.tmp
return run scoreboard players get #st_v vortex.tmp
