# EOL entry guard; legacy Minecraft requires each command to be gated.
# Input: vf_macro:internal want_key, scan_list
# Output: vf_macro:internal matched_value, #vf_macro.key_found

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute unless data storage vf_macro:internal scan_list[0] run scoreboard players set #vf_macro.key_found vf_macro 0

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal scan_list[0] run data modify storage vf_macro:internal scan_item set from storage vf_macro:internal scan_list[0]
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal scan_list[0] run data remove storage vf_macro:internal scan_list[0]

# Compare keys
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.cmp vf_macro 1
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal scan_item.key run data modify storage vf_macro:string tmp.a set from storage vf_macro:internal want_key
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:internal scan_item.key run execute store success score #vf_macro.cmp vf_macro run data modify storage vf_macro:string tmp.a set from storage vf_macro:internal scan_item.key

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if score #vf_macro.cmp vf_macro matches 0 if data storage vf_macro:internal scan_item.value run data modify storage vf_macro:internal matched_value set from storage vf_macro:internal scan_item.value
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if score #vf_macro.cmp vf_macro matches 0 if data storage vf_macro:internal scan_item.value run scoreboard players set #vf_macro.key_found vf_macro 1

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if score #vf_macro.key_found vf_macro matches 0 if data storage vf_macro:internal scan_list[0] run function vf_macro:core/macro/match_key_in_list
