# EOL entry guard; legacy Minecraft requires each command to be gated.
# Copy the action list and start the bounded iterator.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify storage tunnelscript_core:work actions set from storage tunnelscript:in actions
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players operation #counter tunnelscript.vars = #max_actions tunnelscript.vars
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run function tunnelscript_core:internal/run_iter
