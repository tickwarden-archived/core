# EOL entry guard; legacy Minecraft requires each command to be gated.
# Show the most recently executed command.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] last executed: ","color":"aqua"},{"storage":"tunnelscript:log","nbt":"last","color":"white","plain":true,"interpret":false}]
