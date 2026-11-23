# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(url)
$tellraw @s [{"text":"[guikit] ","color":"gold"},{"text":"Open link: ","color":"gray"},{"text":"$(url)","color":"aqua","underlined":true,"click_event":{"action":"open_url","url":"$(url)"}}]
