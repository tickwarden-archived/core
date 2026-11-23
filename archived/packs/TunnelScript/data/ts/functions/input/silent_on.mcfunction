# EOL entry guard; legacy Minecraft requires each command to be gated.
# Disable input capture/execution chat messages.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players set #input_silent tunnelscript.vars 1
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] Input silent mode on","color":"yellow"}]
