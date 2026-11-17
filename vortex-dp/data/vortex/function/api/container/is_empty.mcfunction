# vortex:api/container/is_empty
# Condition: does the container hold no items at all?
# INPUT  vortex:input x, y, z
# RETURN 1 when it is a container with no items, else 0. vortex:output container {ok}.
execute if data storage vortex:engine modules{container:0b} run return 0
data modify storage vortex:output container set value {ok:0b}
execute unless function vortex:core/internal/api/container/_addr run return 0
scoreboard players set #vortex.chk vortex.tmp 0
execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/container/_count with storage vortex:container tmp.k
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
data modify storage vortex:output container.ok set value 1b
execute if score #ct_n vortex.tmp matches 0 run return 1
return 0
