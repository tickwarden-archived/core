# EOL entry guard; legacy Minecraft requires each command to be gated.
# Show last captured and last executed input commands.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] last captured: ","color":"aqua"},{"storage":"tunnelscript:minecart","nbt":"last_captured","color":"white","plain":true,"interpret":false}]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] last executed: ","color":"green"},{"storage":"tunnelscript:minecart","nbt":"last_executed","color":"white","plain":true,"interpret":false}]
