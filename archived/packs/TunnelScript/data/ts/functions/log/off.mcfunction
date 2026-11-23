# EOL entry guard; legacy Minecraft requires each command to be gated.
# Stop recording. Existing entries are kept.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players set #log_enabled tunnelscript.vars 0
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] ","color":"aqua"},{"text":"command log OFF","color":"yellow"}]
