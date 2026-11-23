# EOL entry guard; legacy Minecraft requires each command to be gated.
# Resolve the command alias, then run it via the command block.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if data storage tunnelscript:in command run data modify storage tunnelscript:in cmd set from storage tunnelscript:in command
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run function tunnelscript_core:internal/run_block
