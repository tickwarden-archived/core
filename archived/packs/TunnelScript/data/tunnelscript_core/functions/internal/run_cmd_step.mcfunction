# EOL entry guard; legacy Minecraft requires each command to be gated.
# Extract the "value" field from the current action and run it via command block.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify storage tunnelscript:in cmd set from storage tunnelscript_core:work current.value
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run function tunnelscript_core:internal/run_block
