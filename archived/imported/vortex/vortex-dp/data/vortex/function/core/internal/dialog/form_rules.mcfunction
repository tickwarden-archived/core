# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/form_rules
execute unless data storage vortex:dialog_event route.rules run return 1
execute store result score #rule_step vortex.dialog_tmp run data get storage vortex:dialog_event route.rules.step
execute store result score #rule_offset vortex.dialog_tmp run data get storage vortex:dialog_event route.rules.offset
execute unless score #rule_step vortex.dialog_tmp matches 1..1000000 run return 0
scoreboard players operation #rule_rem vortex.dialog_tmp = #digit vortex.dialog_tmp
scoreboard players operation #rule_rem vortex.dialog_tmp -= #rule_offset vortex.dialog_tmp
scoreboard players operation #rule_rem vortex.dialog_tmp %= #rule_step vortex.dialog_tmp
execute unless score #rule_rem vortex.dialog_tmp matches 0 run return 0
execute unless data storage vortex:dialog_event route.rules.allowed[0] run return 1
execute store result storage vortex:dialog_rules check.value int 1 run scoreboard players get #digit vortex.dialog_tmp
return run function vortex:core/internal/dialog/form_allowed with storage vortex:dialog_rules check
