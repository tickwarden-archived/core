# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:tui/divider - horizontal rule for @s. No input.
tellraw @s {"text":"═════════════════════════════","color":"dark_gray"}
return 1
