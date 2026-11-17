# vortex:core/internal/api/block/_validate_stage [INTERNAL]
# validate handler when registered, otherwise: the block must be a container. RETURN 1 allowed, 0 denied.
data modify storage vortex:block tmp.m.h set value "validate"
execute store result score #bk_v vortex.tmp run function vortex:core/internal/api/block/_call with storage vortex:block tmp.m
execute if score #bk_v vortex.tmp matches 1.. run return 1
execute if score #bk_v vortex.tmp matches 0 run return 0
return run function vortex:core/internal/api/container/_exists with storage vortex:container tmp.k
