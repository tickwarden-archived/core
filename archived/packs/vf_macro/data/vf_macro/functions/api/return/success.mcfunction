# EOL entry guard; legacy Minecraft requires each command to be gated.
# PUBLIC API — vf_macro:api/return/success
# Simulates /return 1 (or bare /return) for pre-1.20.2.
# Sets the returned flag so callers can early-exit.

execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run scoreboard players set #vf_macro.returned vf_macro 1
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:out return_value set value 1
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run data modify storage vf_macro:out return_success set value 1b
