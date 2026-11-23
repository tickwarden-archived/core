# EOL entry guard; legacy Minecraft requires each command to be gated.
# Copy the list and start the shared bounded command-list iterator.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify storage tunnelscript_core:work clist set from storage tunnelscript:in commands
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run function tunnelscript_core:internal/command_list_start
