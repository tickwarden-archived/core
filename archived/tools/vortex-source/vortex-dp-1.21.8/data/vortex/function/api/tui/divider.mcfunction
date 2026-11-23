# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/tui/divider - horizontal rule for @s. No input.
tellraw @s {"text":"═════════════════════════════","color":"dark_gray"}
return 1
