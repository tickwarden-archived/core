# EOL entry guard; legacy Minecraft requires each command to be gated.
# Consume clist[] one command at a time and run it through the command block.
# Bounded by #counter (max_actions); finite recursion, never an auto-loop.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if data storage tunnelscript_core:work clist[0] if score #counter tunnelscript.vars matches 1.. run function tunnelscript_core:internal/run_commands_step
