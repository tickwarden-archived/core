# vortex:core/internal/api/store/_p_add [MACRO] [INTERNAL]
# #st_by holds the amount; a missing value counts as 0.
scoreboard players set #st_v vortex.tmp 0
$execute store result score #st_v vortex.tmp run data get storage vortex:store p."$(a)_$(b)_$(c)_$(d)".$(name)
scoreboard players operation #st_v vortex.tmp += #st_by vortex.tmp
$execute store result storage vortex:store p."$(a)_$(b)_$(c)_$(d)".$(name) int 1 run scoreboard players get #st_v vortex.tmp
execute store result storage vortex:store out.value int 1 run scoreboard players get #st_v vortex.tmp
return run scoreboard players get #st_v vortex.tmp
