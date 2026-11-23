# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/concat_loop [INTERNAL]
execute unless data storage vortex:text cl[0] run return 1
data modify storage vortex:text s set string storage vortex:text cl[0]
data remove storage vortex:text cl[0]
execute store result score #tx_ok vortex.tmp run function vortex:core/internal/text/safe
execute if score #tx_ok vortex.tmp matches 0 run data modify storage vortex:text err set value "concat: an element contains a quote or backslash"
execute if score #tx_ok vortex.tmp matches 0 run return 0
data modify storage vortex:text pc append from storage vortex:text s
return run function vortex:core/internal/text/concat_loop
