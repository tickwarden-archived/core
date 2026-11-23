# EOL entry guard; legacy Minecraft requires each command to be gated.
# Scan tagged input minecarts once, even if the tick module is paused.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run function tunnelscript_core:internal/minecart_scan
