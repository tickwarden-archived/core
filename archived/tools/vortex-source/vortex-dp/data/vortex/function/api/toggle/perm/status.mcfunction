# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/toggle/perm/status
# Prints the permission switches to @s (enforcement, per-command permissions, default).

tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"perm_enforce=","color":"aqua"},{"nbt":"config.perm_enforce","storage":"vortex:engine"},{"text":"  perm_cmd=","color":"aqua"},{"nbt":"config.perm_cmd","storage":"vortex:engine"},{"text":"  perm_default=","color":"aqua"},{"nbt":"perm_default","storage":"vortex:engine"},{"text":"  module_perm=","color":"aqua"},{"nbt":"config.module_perm","storage":"vortex:engine"}]
