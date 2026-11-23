# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/run/cmd_as_uuid [MACRO]
# Dynamic commands are off by default (config dynamic_cmd). See docs/cmd_gate.md.
execute unless data storage macroengine:engine config{dynamic_cmd:1b} run return 0
$execute as @a[nbt={UUID:$(uuid)}] run $(cmd)
