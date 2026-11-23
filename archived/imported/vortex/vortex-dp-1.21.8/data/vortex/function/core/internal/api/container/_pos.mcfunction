# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/container/_pos [INTERNAL, MACRO: x, y, z (input key names)]
# Validates three coordinate keys of vortex:input as ints in world range.
# RETURN 1 valid, 0 invalid.
scoreboard players set #vortex.chk vortex.tmp 0
$execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/container/_num {f:"$(x)"}
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
scoreboard players set #vortex.chk vortex.tmp 0
$execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/container/_num {f:"$(y)"}
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
scoreboard players set #vortex.chk vortex.tmp 0
$execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/container/_num {f:"$(z)"}
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
$execute store result score #ct_v vortex.tmp run data get storage vortex:container tmp.k.$(x)
execute unless score #ct_v vortex.tmp matches -30000000..30000000 run return 0
$execute store result score #ct_v vortex.tmp run data get storage vortex:container tmp.k.$(y)
execute unless score #ct_v vortex.tmp matches -2048..2047 run return 0
$execute store result score #ct_v vortex.tmp run data get storage vortex:container tmp.k.$(z)
execute unless score #ct_v vortex.tmp matches -30000000..30000000 run return 0
return 1
