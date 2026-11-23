# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/guard [MACRO]
scoreboard players set #allowed vortex.dialog_tmp 0
$execute if predicate $(guard) run scoreboard players set #allowed vortex.dialog_tmp 1
