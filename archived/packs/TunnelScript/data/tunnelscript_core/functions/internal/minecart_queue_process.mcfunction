# EOL entry guard; legacy Minecraft requires each command to be gated.
# Execute one queued minecart input per tick through the shared command-block runner.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if data storage tunnelscript:minecart queue[0] run function tunnelscript_core:internal/minecart_queue_step
