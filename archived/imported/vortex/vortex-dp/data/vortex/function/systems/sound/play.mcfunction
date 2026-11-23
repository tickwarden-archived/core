# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/sound/play
# Entity-targeted playsound wrapper.
# Runs at the executor's position — call inside  execute as <target> at @s  if
# positional accuracy matters (e.g. per-player distance checks).
#
# Input  (vortex:input sound):
#   sound    — sound event ID   e.g. "minecraft:entity.player.levelup"
#   category — source category  master|music|record|weather|block|
#                               hostile|neutral|player|ambient|voice
#   target   — selector string  e.g. "@a"  "@s"  "@p"
#   volume   — float ≥ 0        1.0 = full volume, >1 increases range
#   pitch    — float 0.0–2.0    1.0 = normal pitch
#
# Usage:
#   data modify storage vortex:input sound set value \
#     {sound:"minecraft:entity.player.levelup",category:"player",\
#      target:"@a",volume:1.0f,pitch:1.0f}
#   function vortex:systems/sound/play with storage vortex:input sound

execute if data storage vortex:engine modules{sound:0b} run return 0
$playsound $(sound) $(category) $(target) ~ ~ ~ $(volume) $(pitch)
