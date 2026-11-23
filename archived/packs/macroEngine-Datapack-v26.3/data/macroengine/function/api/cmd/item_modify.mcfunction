# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/cmd/item_modify [MACRO]
execute if data storage macroengine:engine modules{cmd:0b} run return 0
execute if score #perm_cmd macroengine.tick_flags matches 1 run data modify storage macroengine:perm_require in set value {perm:"cmd.item_modify"}
execute if score #perm_cmd macroengine.tick_flags matches 1 unless function macroengine:api/perm/require run return 0
$item modify entity @a[name=$(player),limit=1] $(slot) $(modifier)
