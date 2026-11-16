# vortex:api/player/run/cmd_as_uuid [MACRO]
# Dynamic commands are off by default (config dynamic_cmd). See docs/cmd_gate.md.
execute unless data storage vortex:engine config{dynamic_cmd:1b} run return 0
$execute as @a[nbt={UUID:$(uuid)}] run $(cmd)
