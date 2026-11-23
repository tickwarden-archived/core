# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/player/run/cmd_as_uuid [MACRO]
$execute as @a[nbt={UUID:$(uuid)}] run $(cmd)
