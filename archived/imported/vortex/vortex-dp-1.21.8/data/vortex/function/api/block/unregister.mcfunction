# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/block/unregister
# Removes a registered custom block.
# INPUT  vortex:input id   RETURN 1 done, 0 refused. Same caller rule as register.
execute if data storage vortex:engine modules{block:0b} run return 0
execute if entity @s[type=minecraft:player] unless entity @s[tag=vortex.admin] run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:input id
execute unless function vortex:systems/validate/safe_name run return 0
data modify storage vortex:block tmp set value {m:{}}
data modify storage vortex:block tmp.m.id set from storage vortex:input id
return run function vortex:core/internal/api/block/_unreg with storage vortex:block tmp.m
