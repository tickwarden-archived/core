# EOL entry guard; legacy Minecraft requires each command to be gated.
# Shared setup for any list of full command strings.
# Used by ts:run_commands and ts:run_functions so both go through one iterator.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players operation #counter tunnelscript.vars = #max_actions tunnelscript.vars
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run function tunnelscript_core:internal/run_commands_iter
