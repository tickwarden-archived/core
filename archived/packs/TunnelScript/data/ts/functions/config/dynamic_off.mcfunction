# EOL entry guard; legacy Minecraft requires each command to be gated.
# Block stored command strings at the command-block runner (default).
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players set #dynamic_enabled tunnelscript.vars 0
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] ","color":"aqua"},{"text":"dynamic commands OFF","color":"gold"}]
