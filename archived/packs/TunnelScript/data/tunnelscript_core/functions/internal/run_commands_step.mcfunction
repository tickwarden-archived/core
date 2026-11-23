# EOL entry guard; legacy Minecraft requires each command to be gated.
# Run one command from the list, then continue the iterator.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players remove #counter tunnelscript.vars 1
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify storage tunnelscript:in cmd set from storage tunnelscript_core:work clist[0]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data remove storage tunnelscript_core:work clist[0]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run function tunnelscript_core:internal/run_block
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run schedule function tunnelscript_core:internal/run_commands_iter 2t
