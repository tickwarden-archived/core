# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
execute if data storage guikit:act w.commands[0] run function guikit:act/_commands
execute if data storage guikit:act w.functions[0] run function guikit:act/_functions
execute if data storage guikit:act w.msg run function guikit:act/_tell
