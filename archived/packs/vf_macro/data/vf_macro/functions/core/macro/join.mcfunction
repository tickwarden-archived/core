# EOL entry guard; legacy Minecraft requires each command to be gated.
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data remove storage vf_macro:out Command
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.multi vf_macro 0

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute unless data storage vf_macro:out resolved[0] run data modify storage vf_macro:out Command set value ""
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:out resolved[0] unless data storage vf_macro:out resolved[1] run data modify storage vf_macro:out Command set from storage vf_macro:out resolved[0]

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:out resolved[1] run scoreboard players set #vf_macro.multi vf_macro 1
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:out resolved[1] run data modify storage vf_macro:string parts set from storage vf_macro:out resolved
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:out resolved[1] run function vf_macro:string/force_join
