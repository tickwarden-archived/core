# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/toggle/perm/status
# Prints the permission switches to @s (enforcement, per-command permissions, default).

tellraw @s ["",{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"perm_enforce=","color":"aqua"},{"nbt":"config.perm_enforce","storage":"macroengine:engine"},{"text":"  perm_cmd=","color":"aqua"},{"nbt":"config.perm_cmd","storage":"macroengine:engine"},{"text":"  perm_default=","color":"aqua"},{"nbt":"perm_default","storage":"macroengine:engine"},{"text":"  module_perm=","color":"aqua"},{"nbt":"config.module_perm","storage":"macroengine:engine"}]
