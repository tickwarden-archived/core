# EOL entry guard; legacy Minecraft requires each command to be gated.
# Resume minecart input scanning and queue execution.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players set #input_paused tunnelscript.vars 0
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] Input resumed","color":"green"}]
