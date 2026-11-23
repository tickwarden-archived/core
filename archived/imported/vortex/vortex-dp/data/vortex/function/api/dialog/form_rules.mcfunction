# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/form_rules [MACRO]
execute unless data storage vortex:dialog_work form.callback run return 0
$data modify storage vortex:dialog_rules candidate set value {step:$(step),offset:$(offset),allowed:$(allowed)}
execute store result score #rule_step vortex.dialog_tmp run data get storage vortex:dialog_rules candidate.step
execute store result score #rule_offset vortex.dialog_tmp run data get storage vortex:dialog_rules candidate.offset
execute store result score #rule_count vortex.dialog_tmp run data get storage vortex:dialog_rules candidate.allowed
execute unless score #rule_step vortex.dialog_tmp matches 1..1000000 run return 0
execute unless score #rule_offset vortex.dialog_tmp matches 0..999999 run return 0
execute unless score #rule_count vortex.dialog_tmp matches 0..64 run return 0
data modify storage vortex:dialog_work form.rules set from storage vortex:dialog_rules candidate
return 1
