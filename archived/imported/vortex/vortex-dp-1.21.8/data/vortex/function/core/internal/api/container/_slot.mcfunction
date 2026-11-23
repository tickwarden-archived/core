# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/container/_slot [INTERNAL, MACRO: f]
# Like _num, plus a range check 0..255. RETURN 1 valid, 0 invalid.
scoreboard players set #vortex.chk vortex.tmp 0
$execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/container/_num {f:"$(f)"}
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
$execute store result score #ct_v vortex.tmp run data get storage vortex:container tmp.k.$(f)
execute unless score #ct_v vortex.tmp matches 0..255 run return 0
return 1
