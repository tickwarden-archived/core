# EOL entry guard; legacy Minecraft requires each command to be gated.
# PUBLIC API — vf_macro:api/return/fail
# Simulates /return fail

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.returned vf_macro 1
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:out return_value set value 0
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:out return_success set value 0b
