# EOL entry guard; legacy Minecraft requires each command to be gated.
# Scan tagged command-block minecarts. Non-empty Command values are captured.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute as @e[type=command_block_minecart,tag=tunnelscript_input] run function tunnelscript_core:internal/minecart_process
