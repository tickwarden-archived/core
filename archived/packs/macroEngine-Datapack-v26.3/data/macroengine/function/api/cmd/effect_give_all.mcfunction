# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/cmd/effect_give_all [MACRO]
execute if data storage macroengine:engine modules{cmd:0b} run return 0
execute if score #perm_cmd macroengine.tick_flags matches 1 run data modify storage macroengine:perm_require in set value {perm:"cmd.effect_give_all"}
execute if score #perm_cmd macroengine.tick_flags matches 1 unless function macroengine:api/perm/require run return 0
$effect give @a $(effect) $(duration) $(amplifier) $(hide)
