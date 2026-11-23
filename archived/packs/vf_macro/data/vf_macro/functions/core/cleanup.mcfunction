# EOL entry guard; legacy Minecraft requires each command to be gated.
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:internal current
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:internal resolve_list
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:internal token_list
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:internal cmd
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:internal free_list
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:internal free_item
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:internal scan_list
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:internal scan_item
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:internal want_key
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:internal matched_value
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:in template
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:in tokens
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:in replace_list
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:in source
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:in parts
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:in Command
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:in value
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:in data
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:engine Command
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:engine pending
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:out Command
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:out resolved
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:out sign_payload
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:string parts
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:string exec_list
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:string extra
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:string build_list
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:string tmp
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:string in
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:string out
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:string sign_payload
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:string joined_json

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.skip vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.multi vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.resolve_done vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.expanded vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.free_done vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.cmp vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.key_found vf_macro 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.force_ok vf_macro 0
