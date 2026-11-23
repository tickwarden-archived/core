# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(cmd)
# Off by default: an operator enables stored commands with guikit:cfg dynamic_cmd.
execute unless data storage guikit:cfg {dynamic_cmd:1b} run return 0
$execute as @s at @s run $(cmd)
