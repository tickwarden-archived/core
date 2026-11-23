# EOL entry guard; legacy Minecraft requires each command to be gated.
# Bounded iterator over actions[]. Stops when empty or counter exhausted.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if data storage tunnelscript_core:work actions[0] if score #counter tunnelscript.vars matches 1.. run function tunnelscript_core:internal/run_step
